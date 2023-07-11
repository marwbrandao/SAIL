#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <limits.h>
#include <ilcplex/cplex.h>

#include "state.h"
#include "graph.h"
#include "ILP.h"

typedef struct Mapping;

typedef struct CodeIndexMapping;

void create_code_index(TU **units, int n)
{
    for (int i = 0; i < n; i++)
    {
        // code_index_mappings[i].code = units[i]->code;
        units[i]->unit_id = i;
    }
}

int find_id_by_code(TU **units, int n, int code)
{
    for (int i = 0; i < n; i++)
    {
        if (units[i]->code == code)
        {
            return i;
        }
    }

    // Return -1 if no unit with the given code is found
    return -1;
}

void create_neighbor_index(TU **units, int n)
{
    for (int i = 0; i < n; i++)
    {
        int num_neighbors = units[i]->num_neighbors;
        units[i]->neighbor_ids = (int *)malloc(num_neighbors * sizeof(int));

        for (int j = 0; j < num_neighbors; j++)
        {
            int neighbor_code = units[i]->neighbor_codes[j];
            // printf("here\n");
            units[i]->neighbor_ids[j] = find_id_by_code(units, n, neighbor_code);
        }
    }
}

bool are_neighbors(TU *unit1, TU *unit2)
{
    for (int i = 0; i < unit1->num_neighbors; i++)
    {
        // printf("here %d, %d\n", unit1->neighbor_ids[i] ,unit2->unit_id);
        if (unit1->neighbor_ids[i] == unit2->unit_id)
        {
            return true;
        }
    }
    return false;
}

int get_b_var_index(int i, int j, int j_prime, CPXENVptr env, CPXLPptr lp)
{
    char var_name[32];
    // printf("hhhh\n");
    sprintf(var_name, "b_%d_%d_%d", i, j, j_prime);
    int index;
    // printf("hhhh\n");
    int status = CPXgetcolindex(env, lp, var_name, &index);
    // printf("%d, %d, %d, index %d status %d\n",i, j, j_prime, index, status);
    if (index < 0)
    {
        fprintf(stderr, "Variable %s not found.\n", var_name);
        exit(1);
    }
    return index;
}

int get_var_index(int i, int j, CPXENVptr env, CPXLPptr lp)
{
    char var_name[128];
    sprintf(var_name, "x_%d_%d", i, j);

    int index;
    int status = CPXgetcolindex(env, lp, var_name, &index);
    if (status != 0)
    {
        fprintf(stderr, "Failed to get index of variable %s.\n", var_name);
        exit(1);
    }
    return index;
}

//

void init_adjMatrix(TU **units, int n, int adjMatrix[n][n])
{
    // Initialize adjacency matrix with 0
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            adjMatrix[i][j] = 0;
        }
    }

    // Fill adjacency matrix according to neighbors
    for (int i = 0; i < n; i++)
    {
        // printf("hi %d, %d \n", i, units[i]->num_neighbors);
        for (int j = 0; j < units[i]->num_neighbors; j++)
        {
            // printf("hi %d, %d\n", j, units[i]->neighbor_ids[j]);
            int neighbor_id = units[i]->neighbor_ids[j];

            adjMatrix[i][neighbor_id] = 1;
            adjMatrix[neighbor_id][i] = 1;
        }
    }
}

void floydWarshall(int n, int adjMatrix[n][n], int distMatrix[n][n])
{
    // Initialize the distance matrix with the adjacency matrix
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            if (i == j)
                distMatrix[i][j] = 0;
            else if (adjMatrix[i][j])
                distMatrix[i][j] = 1;
            else
                distMatrix[i][j] = INT_MAX;
        }
    }

    // Apply Floyd-Warshall algorithm
    for (int k = 0; k < n; k++)
    {
        for (int i = 0; i < n; i++)
        {
            for (int j = 0; j < n; j++)
            {
                if (distMatrix[i][k] != INT_MAX && distMatrix[k][j] != INT_MAX)
                {
                    int newDistance = distMatrix[i][k] + distMatrix[k][j];
                    if (newDistance < distMatrix[i][j])
                        distMatrix[i][j] = newDistance;
                }
            }
        }
    }
}

void add_population_constraints(TU **units, int n, int k, CPXENVptr env, CPXLPptr lp, int ideal_population)
{
    for (int cluster = 0; cluster < k; cluster++)
    {
        int *indices = (int *)malloc(n * sizeof(int));
        double *values = (double *)malloc(n * sizeof(double));
        // printf("ideal pop = %d\n", ideal_population);
        for (int unit = 0; unit < n; unit++)
        {
            char var_name[32];
            snprintf(var_name, sizeof(var_name), "x_%d_%d", cluster, unit);

            int col_index;
            int status = CPXgetcolindex(env, lp, var_name, &col_index);
            if (status)
            {
                fprintf(stderr, "Failed to get column index for %s.\n", var_name);
                exit(1);
            }
            indices[unit] = col_index;
            values[unit] = units[unit]->voters; // number of voters in this unit
            // printf("id = %d, values = %f\n",indices[unit], values[unit]);
        }

        double rhs_upper = 1.15 * ideal_population; // upper bound (115% of ideal population)
        char sense_upper = 'L';                     // Use 'L' for "less than or equal to".
        int matbeg = 0;
        int status_upper = CPXaddrows(env, lp, 0, 1, n, &rhs_upper, &sense_upper, &matbeg, indices, values, NULL, NULL);
        if (status_upper)
        {
            fprintf(stderr, "Failed to add upper population constraint for cluster %d.\n", cluster);
            exit(1);
        }

        double rhs_lower = 0.85 * ideal_population; // lower bound (85% of ideal population)
        char sense_lower = 'G';                     // Use 'G' for "greater than or equal to".
        int status_lower = CPXaddrows(env, lp, 0, 1, n, &rhs_lower, &sense_lower, &matbeg, indices, values, NULL, NULL);
        if (status_lower)
        {
            fprintf(stderr, "Failed to add lower population constraint for cluster %d.\n", cluster);
            exit(1);
        }

        free(indices);
        free(values);
    }
}

int create_decision_variables(TU **units, int k, int n, CPXENVptr env, CPXLPptr lp)
{
    int num_vars = 0;
    for (int i = 0; i < k; i++)
    {
        for (int j = 0; j < n; j++)
        {
            // Create decision variable x_ij

            char var_name[32];
            snprintf(var_name, sizeof(var_name), "x_%d_%d", i, j);

            double lb = 0.0;       // Lower bound of variable
            double ub = 1.0;       // Upper bound of variable
            double obj_coef = 0.0; // Coefficient of variable in objective function
            char *var_names[1] = {var_name};

            int status = CPXnewcols(env, lp, 1, &obj_coef, &lb, &ub, "B", var_names);

            // printf("here\n");
            if (status)
            {
                fprintf(stderr, "Failed to create decision variable x_%d_%d.\n", i, j);
                exit(1);
            }

            num_vars++;
        }
    }
    printf("Total decision variables created: %d\n", num_vars);

    for (int j = 0; j < n; j++)
    {
        int *indices = (int *)malloc(k * sizeof(int));
        double *values = (double *)malloc(k * sizeof(double));
        for (int i = 0; i < k; i++)
        {
            char var_name[32];
            snprintf(var_name, sizeof(var_name), "x_%d_%d", i, units[j]->unit_id);
            int col_index;
            int status = CPXgetcolindex(env, lp, var_name, &col_index);
            if (status)
            {
                fprintf(stderr, "Failed to get column index for %s.\n", var_name);
                exit(1);
            }
            indices[i] = col_index;
            values[i] = 1.0;
        }
        double rhs = 1.0;
        int matbeg = 0;
        char sense = 'E';
        int status = CPXaddrows(env, lp, 0, 1, k, &rhs, &sense, &matbeg, indices, values, NULL, NULL);
        if (status)
        {
            fprintf(stderr, "Failed to add constraint for unit %d.\n", units[j]->unit_id);
            exit(1);
        }
        free(indices);
        free(values);
    }
    return num_vars;
}

void create_b_vars(TU **units, int k, int n, CPXENVptr env, CPXLPptr lp)
{
    for (int i = 0; i < k; i++)
    {
        for (int j = 0; j < n; j++)
        {
            for (int l = 0; l < n; l++)
            {
                int j_prime = l;

                char var_name[64];
                snprintf(var_name, sizeof(var_name), "b_%d_%d_%d", i, j, j_prime);

                double lb = 0.0;       // Lower bound of variable
                double ub = 1.0;       // Upper bound of variable
                double obj_coef = 0.0; // Coefficient of variable in objective function
                char *var_names[1] = {var_name};

                int status = CPXnewcols(env, lp, 1, &obj_coef, &lb, &ub, "B", var_names);
                if (status)
                {
                    fprintf(stderr, "Failed to create decision variable %s.\n", var_name);
                    exit(1);
                }
            }
        }
    }
}

void create_c_variables(TU **units, int n, int k, CPXENVptr env, CPXLPptr lp)
{

    for (int i = 0; i < k; i++)
    {
        for (int j = 0; j < n; j++)
        {
            for (int l = 0; l < units[j]->num_neighbors; l++)
            {
                int j_prime = units[j]->neighbor_ids[l];

                char var_name[64];
                snprintf(var_name, sizeof(var_name), "c_%d_%d_%d", i, j, j_prime);
                // printf("c_%d_%d_%d\n", i, j, j_prime);
                double lb = 0.0;  // Lower bound is 0
                double ub = 1.0;  // Upper bound is 1
                double obj = 0.0; // Coefficient in the objective function
                char type = 'B';  // 'B' for binary variables

                char *var_names[1] = {var_name};
                int status = CPXnewcols(env, lp, 1, &obj, &lb, &ub, &type, var_names);
                // printf("herewwwww\n");
                if (status)
                {
                    fprintf(stderr, "Failed to create variable %s.\n", var_name);
                    exit(1);
                }
            }
        }
    }
}

void add_c_constraints(TU **units, int n, int k, CPXENVptr env, CPXLPptr lp)
{
    double rhs[1];
    char sense[1];
    int matbeg[1] = {0};
    int matind[3];
    double matval[3];

    for (int i = 0; i < k; i++)
    {
        for (int j = 0; j < n; j++)
        {
            for (int l = 0; l < units[j]->num_neighbors; l++)
            {
                int j_prime = units[j]->neighbor_ids[l];
                if (j_prime != j)
                {
                    char x_name_j[32], x_name_j_prime[32], c_name[64];
                    snprintf(x_name_j, sizeof(x_name_j), "x_%d_%d", i, j);
                    snprintf(x_name_j_prime, sizeof(x_name_j_prime), "x_%d_%d", i, j_prime);
                    snprintf(c_name, sizeof(c_name), "c_%d_%d_%d", i, j, j_prime);

                    int x_index_j, x_index_j_prime, c_index;
                    if (CPXgetcolindex(env, lp, x_name_j, &x_index_j) || CPXgetcolindex(env, lp, x_name_j_prime, &x_index_j_prime) || CPXgetcolindex(env, lp, c_name, &c_index))
                    {
                        fprintf(stderr, "Failed to get variable index.\n");
                        exit(1);
                    }
                    // printf("%d,\n", c_index);

                    // Constraints
                    // 1. b[i][j][j'] <= x[i][j]
                    rhs[0] = 0.0;
                    sense[0] = 'L';
                    matind[0] = c_index;
                    matind[1] = x_index_j;
                    matval[0] = 1.0;
                    matval[1] = -1.0;
                    if (CPXaddrows(env, lp, 0, 1, 2, rhs, sense, matbeg, matind, matval, NULL, NULL))
                    {
                        fprintf(stderr, "Failed to add constraint.\n");
                        exit(1);
                    }

                    // 2. b[i][j][j'] <= x[i][j']
                    matind[1] = x_index_j_prime;
                    if (CPXaddrows(env, lp, 0, 1, 2, rhs, sense, matbeg, matind, matval, NULL, NULL))
                    {
                        fprintf(stderr, "Failed to add constraint.\n");
                        exit(1);
                    }

                    // 3. b[i][j][j'] >= x[i][j] + x[i][j'] - 1
                    rhs[0] = -1.0;
                    sense[0] = 'G';
                    matind[0] = x_index_j;
                    matind[1] = x_index_j_prime;
                    matind[2] = c_index;
                    matval[0] = -1.0;
                    matval[1] = -1.0;
                    matval[2] = 1.0;
                    if (CPXaddrows(env, lp, 0, 1, 3, rhs, sense, matbeg, matind, matval, NULL, NULL))
                    {
                        fprintf(stderr, "Failed to add constraint.\n");
                        exit(1);
                    }

                    int *indices = (int *)malloc(k * sizeof(int));
                    double *values = (double *)malloc(k * sizeof(double));

                    for (int i = 0; i < k; i++)
                    {
                        char var_name[64];
                        snprintf(var_name, sizeof(var_name), "c_%d_%d_%d", i, j, j_prime);
                        int col_index;
                        int status = CPXgetcolindex(env, lp, var_name, &col_index);
                        if (status)
                        {
                            fprintf(stderr, "Failed to get column index for %s.\n", var_name);
                            exit(1);
                        }
                        indices[i] = col_index;
                        values[i] = 1.0;
                    }
                    double rhs = 1.0;
                    int matbeg = 0;
                    char sense = 'L';
                    int status = CPXaddrows(env, lp, 0, 1, k, &rhs, &sense, &matbeg, indices, values, NULL, NULL);
                    if (status)
                    {
                        fprintf(stderr, "Failed to add constraint for units %d and %d.\n", j, j_prime);
                        exit(1);
                    }
                }
            }
        }
    }
}

void add_objective_function(TU **units, int n, int k, CPXENVptr env, CPXLPptr lp)
{
    // Loop over clusters
    for (int i = 0; i < k; i++)
    {
        // Loop over units
        for (int j = 0; j < n; j++)
        {
            // Loop over neighbors of the current unit
            for (int l = 0; l < units[j]->num_neighbors; l++)
            {
                int j_prime = units[j]->neighbor_ids[l]; // Neighbor of j
                if (j < j_prime)
                {
                    int border_size = units[j]->border_sizes[l]; // Border size with the neighbor
                    // printf("b_%d_%d_%d = %d\n", i, j, j_prime, border_size);
                    //  Retrieve the `b` variable for this cluster, unit, and neighbor pair
                    char var_name[64];

                    snprintf(var_name, sizeof(var_name), "c_%d_%d_%d", i, j, j_prime);

                    int col_index;
                    int status = CPXgetcolindex(env, lp, var_name, &col_index);
                    if (status)
                    {
                        fprintf(stderr, "Failed to get column index for %s.\n", var_name);
                        exit(1);
                    }

                    // Multiply the border size by the `b` variable and add it to the objective function
                    double coef = border_size;
                    status = CPXchgobj(env, lp, 1, &col_index, &coef);
                    if (status)
                    {
                        fprintf(stderr, "Failed to change objective function.\n");
                        exit(1);
                    }
                }
            }
        }
    }

    // We want to maximize the sum of border lengths between TUs in the same cluster
    CPXchgobjsen(env, lp, CPX_MAX);
}

void add_force_assignment_constraint(CPXENVptr env, CPXLPptr lp, int n, int k)
{
    for (int i = 0; i < k; i++)
    {
        int *indices = (int *)malloc(k * sizeof(int));
        double *values = (double *)malloc(k * sizeof(double));
        for (int j = 0; j < n; j++)
        {
            char var_name[32];
            snprintf(var_name, sizeof(var_name), "x_%d_%d", i, j);
            int col_index;
            int status = CPXgetcolindex(env, lp, var_name, &col_index);
            if (status)
            {
                fprintf(stderr, "Failed to get column index for %s.\n", var_name);
                exit(1);
            }
            indices[j] = col_index;
            values[j] = 1.0;
        }
        double rhs = 1.0;
        char sense = 'E';
        int matbeg = 0;
        int status = CPXaddrows(env, lp, 0, 1, k, &rhs, &sense, &matbeg, indices, values, NULL, NULL);
        if (status)
        {
            fprintf(stderr, "Failed to add force assignment constraint for node %d.\n", i);
            exit(1);
        }
        free(indices);
        free(values);
    }
}

void add_basic_constraints(CPXENVptr env, CPXLPptr lp, int n, int k)
{
    for (int unit = 0; unit < n; unit++)
    {
        int *indices = (int *)malloc(k * sizeof(int));
        double *values = (double *)malloc(k * sizeof(double));

        for (int cluster = 0; cluster < k; cluster++)
        {
            char var_name[32];
            snprintf(var_name, sizeof(var_name), "x_%d_%d", cluster, unit);

            int col_index;
            int status = CPXgetcolindex(env, lp, var_name, &col_index);
            if (status)
            {
                fprintf(stderr, "Failed to get column index for %s.\n", var_name);
                exit(1);
            }
            indices[cluster] = col_index;
            values[cluster] = 1.0;
        }

        double rhs = 1.0; // Right-hand side of constraint: each unit must belong to at least one cluster.
        char sense = 'G'; // Use 'G' for "greater than or equal to".
        int matbeg = 0;
        int status = CPXaddrows(env, lp, 0, 1, k, &rhs, &sense, &matbeg, indices, values, NULL, NULL);
        if (status)
        {
            fprintf(stderr, "Failed to add basic constraint for unit %d.\n", unit);
            exit(1);
        }

        free(indices);
        free(values);
    }
}

void add_at_least_one_unit_per_cluster_constraints(CPXENVptr env, CPXLPptr lp, int n, int k)
{
    for (int cluster = 0; cluster < k; cluster++)
    {
        int *indices = (int *)malloc(n * sizeof(int));
        double *values = (double *)malloc(n * sizeof(double));

        for (int unit = 0; unit < n; unit++)
        {
            char var_name[32];
            snprintf(var_name, sizeof(var_name), "x_%d_%d", cluster, unit);

            int col_index;
            int status = CPXgetcolindex(env, lp, var_name, &col_index);
            if (status)
            {
                fprintf(stderr, "Failed to get column index for %s.\n", var_name);
                exit(1);
            }
            indices[unit] = col_index;
            values[unit] = 1.0;
        }

        double rhs = 1.0; // Right-hand side of constraint: each cluster must contain at least one unit.
        char sense = 'G'; // Use 'G' for "greater than or equal to".
        int matbeg = 0;
        int status = CPXaddrows(env, lp, 0, 1, n, &rhs, &sense, &matbeg, indices, values, NULL, NULL);
        if (status)
        {
            fprintf(stderr, "Failed to add cluster constraint for cluster %d.\n", cluster);
            exit(1);
        }

        free(indices);
        free(values);
    }
}
void create_contiguity_constraints(TU **units, int k, int n, CPXENVptr env, CPXLPptr lp)
{
    double rhs[1];
    char sense[1];
    int matbeg[1] = {0};
    int matind[3];
    double matval[3];

    for (int i = 0; i < k; i++)
    {
        for (int j = 0; j < n; j++)
        {
            for (int l = 0; l < n; l++)
            {
                int j_prime = l;
                if (j_prime != j)
                {
                    char x_name_j[32], x_name_j_prime[32], b_name[64];
                    snprintf(x_name_j, sizeof(x_name_j), "x_%d_%d", i, j);
                    snprintf(x_name_j_prime, sizeof(x_name_j_prime), "x_%d_%d", i, j_prime);
                    snprintf(b_name, sizeof(b_name), "b_%d_%d_%d", i, j, j_prime);

                    int x_index_j, x_index_j_prime, b_index;
                    if (CPXgetcolindex(env, lp, x_name_j, &x_index_j) || CPXgetcolindex(env, lp, x_name_j_prime, &x_index_j_prime) || CPXgetcolindex(env, lp, b_name, &b_index))
                    {
                        fprintf(stderr, "Failed to get variable index.\n");
                        exit(1);
                    }

                    // Constraints
                    // 1. b[i][j][j'] <= x[i][j]
                    rhs[0] = 0.0;
                    sense[0] = 'L';
                    matind[0] = b_index;
                    matind[1] = x_index_j;
                    matval[0] = 1.0;
                    matval[1] = -1.0;
                    if (CPXaddrows(env, lp, 0, 1, 2, rhs, sense, matbeg, matind, matval, NULL, NULL))
                    {
                        fprintf(stderr, "Failed to add constraint.\n");
                        exit(1);
                    }

                    // 2. b[i][j][j'] <= x[i][j']
                    matind[1] = x_index_j_prime;
                    if (CPXaddrows(env, lp, 0, 1, 2, rhs, sense, matbeg, matind, matval, NULL, NULL))
                    {
                        fprintf(stderr, "Failed to add constraint.\n");
                        exit(1);
                    }

                    // 3. b[i][j][j'] >= x[i][j] + x[i][j'] - 1
                    rhs[0] = -1.0;
                    sense[0] = 'G';
                    matind[0] = x_index_j;
                    matind[1] = x_index_j_prime;
                    matind[2] = b_index;
                    matval[0] = -1.0;
                    matval[1] = -1.0;
                    matval[2] = 1.0;
                    if (CPXaddrows(env, lp, 0, 1, 3, rhs, sense, matbeg, matind, matval, NULL, NULL))
                    {
                        fprintf(stderr, "Failed to add constraint.\n");
                        exit(1);
                    }
                }
            }
        }
    }
}
void print_adjMatrix(int n, int adjMatrix[n][n])
{
    printf("Adjacency Matrix:\n");
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            printf("%d ", adjMatrix[i][j]);
        }
        printf("\n");
    }
}

void print_distMatrix(int n, int distMatrix[n][n])
{
    printf("Distance Matrix:\n");
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            printf("%d ", distMatrix[i][j]);
        }
        printf("\n");
    }
}

void add_contiguity_constraints2(TU **units, int k, int n, int distMatrix[n][n], CPXENVptr env, CPXLPptr lp)
{
    char sense[1];
    int matbeg[1] = {0};

    for (int i = 0; i < k; i++)
    {
        for (int j = 0; j < n; j++)
        {
            for (int j_prime = 0; j_prime < n; j_prime++)
            {
                if (j != j_prime && !are_neighbors(units[j], units[j_prime]))
                {

                    int x_index_j_prime_prime[n];
                    double matval_j_prime_prime[n];
                    int num_j_prime_prime = 0;

                    for (int j_double_prime = 0; j_double_prime < n; j_double_prime++)
                    {
                        if (j_double_prime != j && j_double_prime != j_prime && are_neighbors(units[j_double_prime], units[j_prime]) && distMatrix[j][j_double_prime] < distMatrix[j][j_prime])
                        {
                            char x_name_j_double_prime[32];
                            snprintf(x_name_j_double_prime, sizeof(x_name_j_double_prime), "x_%d_%d", i, j_double_prime);

                            if (CPXgetcolindex(env, lp, x_name_j_double_prime, &x_index_j_prime_prime[num_j_prime_prime]))
                            {
                                fprintf(stderr, "Failed to get variable index.\n");
                                exit(1);
                            }

                            matval_j_prime_prime[num_j_prime_prime] = 1.0;
                            num_j_prime_prime++;
                        }
                    }

                    if (num_j_prime_prime > 0)
                    {
                        char x_name_j[32], x_name_j_prime[32];
                        snprintf(x_name_j, sizeof(x_name_j), "x_%d_%d", i, j);
                        snprintf(x_name_j_prime, sizeof(x_name_j_prime), "x_%d_%d", i, j_prime);

                        int x_index_j, x_index_j_prime;
                        if (CPXgetcolindex(env, lp, x_name_j, &x_index_j) || CPXgetcolindex(env, lp, x_name_j_prime, &x_index_j_prime))
                        {
                            fprintf(stderr, "Failed to get variable index.\n");
                            exit(1);
                        }

                        int matind[num_j_prime_prime + 2];
                        double matval[num_j_prime_prime + 2];

                        matind[0] = x_index_j;
                        matind[1] = x_index_j_prime;
                        matval[0] = -1.0;
                        matval[1] = -1.0;

                        for (int t = 0; t < num_j_prime_prime; t++)
                        {
                            matind[t + 2] = x_index_j_prime_prime[t];
                            matval[t + 2] = matval_j_prime_prime[t];
                        }

                        // Constraint: -x[i][j] - x[i][j'] + sum_j''(x[i][j'']) >= -1
                        double rhs[1] = {-1.0};
                        sense[0] = 'G';

                        if (CPXaddrows(env, lp, 0, 1, num_j_prime_prime + 2, rhs, sense, matbeg, matind, matval, NULL, NULL))
                        {
                            fprintf(stderr, "Failed to add constraint.\n");
                            exit(1);
                        }
                    }
                }
            }
        }
    }
}

void parse_var_name(char *var_name, int *cluster_id, int *unit_id)
{
    // Scan the variable name
    int status = sscanf(var_name, "x_%d_%d", cluster_id, unit_id);

    // Check if we successfully scanned 2 numbers
    if (status != 2)
    {
        fprintf(stderr, "Failed to parse variable name: %s\n", var_name);
        exit(1);
    }
}

Cluster **create_initial_clusters(TU **units, int k, int n)
{
    Cluster *clusters = malloc(k * sizeof(Cluster));
    for (int j = 0; j < k; j++)
    {
        clusters[j].units = malloc(n * sizeof(TU *));
        clusters[j].size = 0;
    }
    int t = 0;
    int cluster_id = 0;
    // printf("111AHYO\n");
    for (int i = 0; i < n; i++)
    {
        // printf("1111AHYO\n");
        TU *unit = units[i];
        // printf("unit %d cluster %d\n", unit->code, unit->cluster_id);
        // if (unit->assigned) {

        int cluster_id = unit->cluster_id;
        // printf("11111AHYO clut: %d\n", cluster_id);
        clusters[cluster_id].units[clusters[cluster_id].size] = unit;
        // printf("111111AHYO\n");
        // printf("clust %d and size %d\n", cluster_id, clusters[cluster_id].size);
        clusters[cluster_id].size++;
        //}
    }

    return clusters;
}

// Cluster** create_initial_clusters(TU **units, int k, int n) {
//     Cluster *clusters = malloc(k * sizeof(Cluster));
//     for (int j = 0; j< k; j++)
//     {
//         clusters[j].units = malloc(n * sizeof(TU *));
//         clusters[j].size = 0;
//     }

//     for (int i = 0; i < n; i++) {
//         TU* unit = units[i];
//         if (unit->assigned) {
//             int cluster_id = unit->cluster_id;
//             clusters[cluster_id].units[clusters[cluster_id].size] = unit;
//             clusters[cluster_id].size++;

//         }
//     }

//     return clusters;
// }

void add_fixed_cluster_constraints(CPXENVptr env, CPXLPptr lp, TU **units, Cluster *clusters, int num_units, int num_clusters, int max_population)
{
    for (int c = 0; c < num_clusters; c++)
    {
        Cluster *cluster = &clusters[c];
        int cluster_population = 0;
        for (int i = 0; i < cluster->size; i++)
        {
            cluster_population += cluster->units[i]->voters;
        }
         printf("cluster %d population %d\n", c, cluster_population);
        if (cluster_population <= max_population)
        {
            for (int i = 0; i < cluster->size; i++)
            {
                TU *unit = cluster->units[i];
                char var_name[32];
                sprintf(var_name, "x_%d_%d", c, unit->unit_id);
                int idx;
                int status = CPXgetcolindex(env, lp, var_name, &idx);
                if (status)
                {
                    fprintf(stderr, "Failed to get index for variable %s.\n", var_name);
                    exit(1);
                }

                 printf("Fixing unit %d to cluster %d\n", unit->unit_id, c); // print which units are going to be fixed

                double rhs[1] = {1.0};
                char sense[1] = {'E'};
                int rmatbeg[1] = {0};
                int rmatind[1] = {idx};
                double rmatval[1] = {1.0};

                status = CPXaddrows(env, lp, 0, 1, 1, rhs, sense, rmatbeg, rmatind, rmatval, NULL, NULL);
                if (status)
                {
                    fprintf(stderr, "Failed to add fixed cluster constraint for unit %d.\n", i);
                    exit(1);
                }
            }
        }
    }
}
void add_impossible_pairs_constraints(TU **units, int n, int k, CPXENVptr env, CPXLPptr lp, int distMatrix[n][n], int upper_limit)
{
    //printf("Entering add_impossible_pairs_constraints function.\n");
    
    for (int unit1 = 0; unit1 < n; unit1++)
    {
        //printf("Outer loop iteration, unit1: %d.\n", unit1);
        
        for (int unit2 = 0; unit2 < n; unit2++)
        {
            // print_distMatrix(n, distMatrix);
            // printf("Inner loop iteration, unit2: %d.\n", unit2);
            // printf("unit1: %d, unit2: %d\n", unit1, unit2);
            // printf("units[unit1] address: %p\n", (void *)units[unit1]);
            // printf("distMatrix[unit1] address: %p\n", (void *)distMatrix[unit1]);
            
            if (unit1 != unit2 && units[unit1]->voters + distMatrix[unit1][unit2] > (upper_limit*1.15))
            {
                //printf("Voters of unit1 plus shortest distance to unit2 exceeds upper_limit.\n");
                
                for (int cluster = 0; cluster < k; cluster++)
                {
                    //printf("Cluster iteration, cluster: %d.\n", cluster);

                    char var_name1[32];
                    snprintf(var_name1, sizeof(var_name1), "x_%d_%d", cluster, unit1);

                    int col_index1;
                    int status1 = CPXgetcolindex(env, lp, var_name1, &col_index1);
                    if (status1)
                    {
                        fprintf(stderr, "Failed to get column index for %s.\n", var_name1);
                        exit(1);
                    }

                    char var_name2[32];
                    snprintf(var_name2, sizeof(var_name2), "x_%d_%d", cluster, unit2);

                    int col_index2;
                    int status2 = CPXgetcolindex(env, lp, var_name2, &col_index2);
                    if (status2)
                    {
                        fprintf(stderr, "Failed to get column index for %s.\n", var_name2);
                        exit(1);
                    }

                    printf("Adding constraint for unit1: %d and unit2: %d in cluster: %d.\n", unit1, unit2, cluster);

                    int indices[2] = {col_index1, col_index2};
                    double values[2] = {1.0, 1.0};
                    double rhs = 1.0; // Only one of these two units can be in the cluster
                    char sense = 'L'; // Use 'L' for "less than or equal to".
                    int matbeg = 0;
                    int status = CPXaddrows(env, lp, 0, 1, 2, &rhs, &sense, &matbeg, indices, values, NULL, NULL);
                    if (status)
                    {
                        fprintf(stderr, "Failed to add impossible pair constraint for units %d and %d in cluster %d.\n", unit1, unit2, cluster);
                        exit(1);
                    }
                }
            }
        }
    }

    //printf("Exiting add_impossible_pairs_constraints function.\n");
}


// lisboa ao nivel de freguesias, simulated annealing time out 3 horas, baseline, com soluçao parcial, e restringir fixando determinadas , estabelecer um time out, e ver quanto temp, tempo fixo, verificar o status
// quiarta as 16

Cluster **runILP(TU **units, int k, int n, int m, int ideal_pop, Cluster *clusters)
{
    CPXENVptr env = NULL;
    CPXLPptr lp = NULL;
    int status;
    double start_time, end_time;

    env = CPXopenCPLEX(&status);
    if (env == NULL)
    {
        fprintf(stderr, "Could not open CPLEX environment.\n");
        exit(1);
    }

    lp = CPXcreateprob(env, &status, "districting");
    if (lp == NULL)
    {
        fprintf(stderr, "Could not create LP problem.\n");
        exit(1);
    }
    CPXgettime(env, &start_time);
    // printf("star = == = %f\n", start_time);
    int adjMatrix[n][n];
    int distMatrix[n][n];
    double time_limit = 60.0 * 10; // Time limit in seconds
    status = CPXsetdblparam(env, CPX_PARAM_TILIM, time_limit);
    if (status)
    {
        fprintf(stderr, "Failed to set time limit parameter.\n");
        exit(1);
    }

    create_code_index(units, n);
    create_neighbor_index(units, n);
    int num_vars = create_decision_variables(units, k, n, env, lp);

    // create_b_vars(units, k, n, env, lp);
    create_c_variables(units, n, k, env, lp);

    init_adjMatrix(units, n, adjMatrix);
    floydWarshall(n, adjMatrix, distMatrix);

    // print_adjMatrix(n, adjMatrix);
    // print_distMatrix(n, distMatrix);

    add_basic_constraints(env, lp, n, k);
    add_at_least_one_unit_per_cluster_constraints(env, lp, n, k);
    add_fixed_cluster_constraints(env, lp, units, clusters, n, k, ideal_pop);

    add_population_constraints(units, n, k, env, lp, ideal_pop);

    add_contiguity_constraints2(units, k, n, distMatrix, env, lp);
    add_c_constraints(units, n, k, env, lp);
    //add_impossible_pairs_constraints(units, n, k,  env, lp, distMatrix, ideal_pop);
    add_objective_function(units, n, k, env, lp);

    status = CPXmipopt(env, lp);
    if (status)
    {
        fprintf(stderr, "Failed to optimize the ILP problem.\n");
        // exit(1);
    }

    status = CPXwriteprob(env, lp, "model.lp", NULL);
    // printf("here\n");
    if (status)
    {
        fprintf(stderr, "Failed to write problem to file.\n");
        // exit(1);
    }

    int solstat = CPXgetstat(env, lp);
    printf("Solution status: %d\n", solstat);

    double objval;
    status = CPXgetobjval(env, lp, &objval);

    char statstring[CPXMESSAGEBUFSIZE];
    CPXgetstatstring(env, solstat, statstring);
    printf("%s\n", statstring);

    if (status)
    {
        fprintf(stderr, "Failed to get objective value.\n");
        // exit(1);
    }
    printf("Objective value: %.2f\n", objval);

    if (solstat == 103 || solstat == 108)
        return clusters;

    double *solution = (double *)malloc(num_vars * sizeof(double));

    status = CPXgetx(env, lp, solution, 0, num_vars - 1);
    if (status)
    {
        fprintf(stderr, "Failed to get optimal solution.\n");
        // exit(1);
    }

    //     printf("Conflict written to conflict.lp.\n");
    // }int
    // num_vars = CPXgetnumcols(env, lp);

    // Print the optimal solution
    int *cluster_unit_counts = calloc(k, sizeof(int));  // Assuming k is the number of clusters
    bool *processed_clusters = calloc(k, sizeof(bool)); // This tracks which clusters have been processed

    for (int i = 0; i < num_vars; i++)
    {

        char var_name[32];
        int storespace = 32; // Adjust as needed
        char **colname = (char **)malloc(sizeof(char *));
        char *namestore = (char *)malloc(storespace * sizeof(char));
        int surplus;
        status = CPXgetcolname(env, lp, colname, namestore, storespace, &surplus, i, i);
        int cluster_id, unit_id;
        parse_var_name(*colname, &cluster_id, &unit_id);

        // Create a new unit and set its properties
        // TU* unit = (TU*)malloc(sizeof(TU));
        TU *unit = units[unit_id];
        // printf("hi unit id %d, and pop %d\n", unit->unit_id, unit->voters);

        if (solution[i] >= 0.5)
        {
            unit->assigned = true;
            unit->cluster_id = cluster_id;
            // printf("%d %d %d \n", unit->cluster_id, unit->unit_id, unit->assigned);
        }
        else
        {
            unit->assigned = false;
        }
        unit->assigned = solution[i] >= 0.5 ? true : false; //

        if (unit->assigned)
        { // Only add the unit to the cluster if it is assigned

            // printf("%d %d %d \n", unit->cluster_id, unit->unit_id, unit->assigned);
            // printf("unit %d cluster %d\n", unit->code, unit->cluster_id);
            unit->cluster_id = cluster_id;
            unit->unit_id = unit_id;
            cluster_unit_counts[cluster_id]++;
            processed_clusters[cluster_id] = true;
        }
        units[i] = unit;
        for (int i = 0; i < k; i++)
        {
            // If a cluster has zero units or it's not a valid cluster, return the clusters as they are
            if (processed_clusters[i] && (cluster_unit_counts[i] == 0))
            { // replace is_valid_cluster with your own validity check function
                // Handle this case as per your needs
                fprintf(stderr, "Cluster %d is empty or invalid.\n", i);
                return clusters; // or some other error handling / default return
            }
        }

        if (status)
        {
            fprintf(stderr, "Failed to get variable name for column %d.\n", i);
            // exit(1);
        }
        // printf("%s: %.2f\n", *colname, solution[i]);
        free(colname);
        free(namestore);
    }

    free(solution);
    clusters = create_initial_clusters(units, k, n);
    // printf("22AHYO\n");
    printf("..Cluster 0 with size %d: ", clusters[1].size);
    status = CPXmipopt(env, lp);
    CPXgettime(env, &end_time);
    // printf("end = == = %f\n", end_time);
    double time_taken = end_time - start_time;
    printf("Time taken: %f seconds\n", time_taken);
    status = CPXfreeprob(env, &lp);
    if (status != 0)
    {
        fprintf(stderr, "Failed to free the problem.\n");
        exit(1);
    }
    status = CPXcloseCPLEX(&env);
    if (status != 0)
    {
        fprintf(stderr, "Failed to close CPLEX environment.\n");
        exit(1);
    }

    return clusters;
}

Cluster **runILP_only(TU **units, int k, int n, int m, int ideal_pop)
{
    CPXENVptr env = NULL;
    CPXLPptr lp = NULL;
    int status;
    double start_time, end_time;
    Cluster *clusters = malloc(k * sizeof(Cluster));
    for (int i = 0; i < k; i++)
    {
        clusters[i].units = malloc(n * sizeof(TU *));
        clusters[i].size = 0;
    }
    env = CPXopenCPLEX(&status);
    if (env == NULL)
    {
        fprintf(stderr, "Could not open CPLEX environment.\n");
        exit(1);
    }

    lp = CPXcreateprob(env, &status, "districting");
    if (lp == NULL)
    {
        fprintf(stderr, "Could not create LP problem.\n");
        exit(1);
    }
    printf("1 ");
    CPXgettime(env, &start_time);
    // printf("star = == = %f\n", start_time);
    int adjMatrix[n][n];
    int distMatrix[n][n];
    double time_limit = 60.0 * 60.0 * 1.0; // Time limit in seconds
    status = CPXsetdblparam(env, CPX_PARAM_TILIM, time_limit);
    if (status)
    {
        fprintf(stderr, "Failed to set time limit parameter.\n");
        exit(1);
    }

    create_code_index(units, n);
    create_neighbor_index(units, n);
    int num_vars = create_decision_variables(units, k, n, env, lp);

    // create_b_vars(units, k, n, env, lp);
    create_c_variables(units, n, k, env, lp);

    init_adjMatrix(units, n, adjMatrix);
    floydWarshall(n, adjMatrix, distMatrix);

    // print_adjMatrix(n, adjMatrix);
    // print_distMatrix(n, distMatrix);

    add_basic_constraints(env, lp, n, k);
    add_at_least_one_unit_per_cluster_constraints(env, lp, n, k);
    // add_fixed_cluster_constraints(env, lp, units, clusters, n, k, ideal_pop);
    add_impossible_pairs_constraints(units, n, k,  env, lp, distMatrix, ideal_pop);
    add_population_constraints(units, n, k, env, lp, ideal_pop);

    add_contiguity_constraints2(units, k, n, distMatrix, env, lp);
    add_c_constraints(units, n, k, env, lp);
    add_objective_function(units, n, k, env, lp);

    status = CPXmipopt(env, lp);
    if (status)
    {
        fprintf(stderr, "Failed to optimize the ILP problem.\n");
        // exit(1);
    }

    status = CPXwriteprob(env, lp, "model.lp", NULL);
    // printf("here\n");
    if (status)
    {
        fprintf(stderr, "Failed to write problem to file.\n");
        // exit(1);
    }

    int solstat = CPXgetstat(env, lp);
    printf("Solution status: %d\n", solstat);

    double objval;
    status = CPXgetobjval(env, lp, &objval);

    char statstring[CPXMESSAGEBUFSIZE];
    CPXgetstatstring(env, solstat, statstring);
    printf("%s\n", statstring);

    if (status)
    {
        fprintf(stderr, "Failed to get objective value.\n");
        // exit(1);
    }
    printf("2 ");
    printf("Objective value: %.2f\n", objval);

    double *solution = (double *)malloc(num_vars * sizeof(double));

    //status = CPXgetx(env, lp, solution, 0, num_vars - 1);
    printf("Before CPXgetx.\n");
    status = CPXgetx(env, lp, solution, 0, num_vars - 1);
    printf("After CPXgetx.\n");
    if (status)
    {
        // fprintf(stderr, "Failed to get optimal solution.\n");
    }
    printf("After if statement.\n");

    printf("3 ");
    //     printf("Conflict written to conflict.lp.\n");
    // }int
    // num_vars = CPXgetnumcols(env, lp);
    int *cluster_unit_counts = calloc(k, sizeof(int));  // Assuming k is the number of clusters
    bool *processed_clusters = calloc(k, sizeof(bool)); // This tracks which clusters have been processed

    for (int i = 0; i < num_vars; i++)
    {

        char var_name[32];
        int storespace = 32; // Adjust as needed
        char **colname = (char **)malloc(sizeof(char *));
        char *namestore = (char *)malloc(storespace * sizeof(char));
        int surplus;
        status = CPXgetcolname(env, lp, colname, namestore, storespace, &surplus, i, i);
        int cluster_id, unit_id;
        parse_var_name(*colname, &cluster_id, &unit_id);

        // Create a new unit and set its properties
        // TU* unit = (TU*)malloc(sizeof(TU));
        TU *unit = units[unit_id];
        // printf("hi unit id %d, and pop %d\n", unit->unit_id, unit->voters);

        if (solution[i] >= 0.5)
        {
            printf("4 ");
            unit->assigned = true;
            unit->cluster_id = cluster_id;
            // printf("%d %d %d \n", unit->cluster_id, unit->unit_id, unit->assigned);
        }
        else
        {
            unit->assigned = false;
        }
        unit->assigned = solution[i] >= 0.5 ? true : false; //

        if (unit->assigned)
        { // Only add the unit to the cluster if it is assigned

            // printf("%d %d %d \n", unit->cluster_id, unit->unit_id, unit->assigned);
            // printf("unit %d cluster %d\n", unit->code, unit->cluster_id);
            unit->cluster_id = cluster_id;
            unit->unit_id = unit_id;
            cluster_unit_counts[cluster_id]++;
            processed_clusters[cluster_id] = true;
        }
        units[i] = unit;
        for (int i = 0; i < k; i++)
        {
            // If a cluster has zero units or it's not a valid cluster, return the clusters as they are
            if (processed_clusters[i] && (cluster_unit_counts[i] == 0))
            { // replace is_valid_cluster with your own validity check function
                // Handle this case as per your needs
                fprintf(stderr, "Cluster %d is empty or invalid.\n", i);
                return clusters; // or some other error handling / default return
            }
        }

        if (status)
        {
            fprintf(stderr, "Failed to get variable name for column %d.\n", i);
            // exit(1);
        }
        // printf("%s: %.2f\n", *colname, solution[i]);
        free(colname);
        free(namestore);
    }
    //
    printf("5 ");
    free(solution);
    clusters = create_initial_clusters(units, k, n);
    // printf("22AHYO\n");
    printf("..Cluster 0 with size %d: ", clusters[1].size);
    status = CPXmipopt(env, lp);
    CPXgettime(env, &end_time);
    // printf("end = == = %f\n", end_time);
    double time_taken = end_time - start_time;
    printf("Time taken: %f seconds\n", time_taken);
    status = CPXfreeprob(env, &lp);
    if (status != 0)
    {
        fprintf(stderr, "Failed to free the problem.\n");
        exit(1);
    }
    status = CPXcloseCPLEX(&env);
    if (status != 0)
    {
        fprintf(stderr, "Failed to close CPLEX environment.\n");
        exit(1);
    }
    printf("6 ");
    return clusters;

}