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

void add_population_constraints(TU **units, int n, int k, CPXENVptr env, CPXLPptr lp, int ideal_population)
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
            values[unit] = units[unit]->voters; // number of voters in this unit
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

void create_decision_variables(TU **units, int k, int n, CPXENVptr env, CPXLPptr lp)
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
}

void create_b_vars(TU **units, int k, int n, CPXENVptr env, CPXLPptr lp)
{
    for (int i = 0; i < k; i++)
    {
        for (int j = 0; j < n; j++)
        {
            for (int l = 0; l < units[j]->num_neighbors; l++)
            {
                int j_prime = units[j]->neighbor_ids[l];

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
                int j_prime = units[j]->neighbor_ids[l];     // Neighbor of j
                int border_size = units[j]->border_sizes[l]; // Border size with the neighbor

                // Retrieve the `b` variable for this cluster and unit pair
                char var_name[64];
                snprintf(var_name, sizeof(var_name), "b_%d_%d_%d", i, j, j_prime);

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
    int beg[1] = {0};
    double rhs[1] = {0.0};
    for (int i = 0; i < k; i++)
    {
        for (int j = 0; j < n; j++)
        {
            // printf("here_now %d\n", units[j]->num_neighbors);
            int num_neighbors = units[j]->num_neighbors;
            int *indices = malloc(sizeof(int) * (num_neighbors + 1));
            double *coefs = malloc(sizeof(double) * (num_neighbors + 1));
            int cnt = {num_neighbors + 1};
            // printf("here_now %d\n", units[j]->num_neighbors);
            //  Coefficient for x[i][j]
            indices[0] = get_var_index(i, j, env, lp);
            coefs[0] = -1.0;

            // Coefficients for b[i][j][j']
            for (int l = 0; l < num_neighbors; l++)
            {

                int j_prime = units[j]->neighbor_ids[l];
                // printf("here_now %d\n", j_prime);
                // printf("here_now %d\n", units[j]->num_neighbors);
                indices[l + 1] = get_b_var_index(i, j, j_prime, env, lp);
                coefs[l + 1] = 1.0;
            }

            // printf("%d\n", cnt);
            int status = CPXaddrows(env, lp, 0, 1, cnt, rhs, "G", beg, indices, coefs, NULL, NULL);
            if (status)
            {
                // printf("status %d\n", status);
                fprintf(stderr, "Failed to create contiguity constraint for cluster %d and unit %d.\n", i, j);
                exit(1);
            }

            free(indices);
            free(coefs);
        }
    }
}

void runILP(TU **units, int k, int n, int m, int ideal_pop)
{
    CPXENVptr env = NULL;
    CPXLPptr lp = NULL;
    int status;

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
    create_code_index(units, n);
    create_neighbor_index(units, n);
    create_decision_variables(units, k, n, env, lp);

    create_b_vars(units, k, n, env, lp);

    // print_code_index_mappings(code_index_mappings, n);
    // add_contiguity_constraints(units, n, k, env, lp);
    //  set_objective_function(units, n, k, env, lp);
    add_basic_constraints(env, lp, n, k);
    add_at_least_one_unit_per_cluster_constraints(env, lp, n, k);
    // add_unit_assignment_constraints(units, n, k, env, lp);
    add_population_constraints(units, n, k, env, lp, ideal_pop);
    create_contiguity_constraints(units, k, n, env, lp);
    // add_cluster_center_constraints(n, k, env, lp);
    // add_force_assignment_constraint(env, lp, n, k);
    add_objective_function(units, n, k, env, lp);

    status = CPXmipopt(env, lp);
    if (status)
    {
        fprintf(stderr, "Failed to optimize the ILP problem.\n");
        exit(1);
    }

    status = CPXwriteprob(env, lp, "model.lp", NULL);
    printf("here\n");
    if (status) {
        fprintf(stderr, "Failed to write problem to file.\n");
        exit(1);
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
        exit(1);
    }
    printf("Objective value: %.2f\n", objval);

    int num_vars = CPXgetnumcols(env, lp);
    double *solution = (double *)malloc(num_vars * sizeof(double));

    status = CPXgetx(env, lp, solution, 0, num_vars - 1);
    if (status)
    {
        fprintf(stderr, "Failed to get optimal solution.\n");
        exit(1);
    }

    // Print the optimal solution
    for (int i = 0; i < num_vars; i++)
    {
        char var_name[32];
        int storespace = 32; // Adjust as needed
        char **colname = (char **)malloc(sizeof(char *));
        char *namestore = (char *)malloc(storespace * sizeof(char));
        int surplus;
        status = CPXgetcolname(env, lp, colname, namestore, storespace, &surplus, i, i);

        if (status)
        {
            fprintf(stderr, "Failed to get variable name for column %d.\n", i);
            exit(1);
        }
        printf("%s: %.2f\n", *colname, solution[i]);
        free(colname);
        free(namestore);
    }

    free(solution);

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
}