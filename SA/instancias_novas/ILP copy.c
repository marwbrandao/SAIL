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

CodeIndexMapping *create_code_index_mappings(TU **units, int n) {
    CodeIndexMapping *code_index_mappings = (CodeIndexMapping *) malloc(n * sizeof(CodeIndexMapping));
    for (int i = 0; i < n; i++) {
        code_index_mappings[i].code = units[i]->code;
        code_index_mappings[i].index = i;
    }
    return code_index_mappings;
}

int find_index_by_code(int code, CodeIndexMapping *code_index_mappings, int n) {
    for (int i = 0; i < n; i++) {
        if (code_index_mappings[i].code == code) {
            return code_index_mappings[i].index;
        }
    }
    return -1; 
}


void add_population_constraints(TU **units, int n, int k, CPXENVptr env, CPXLPptr lp, int ideal_population) {

    int lb = 0.75 * ideal_population;
    int ub = 1.25 * ideal_population;

    for (int cluster = 0; cluster < k; cluster++) {
        int *row_indices = (int *)malloc(n * sizeof(int));
        int *values = (int *)malloc(n * sizeof(int));

        for (int i = 0; i < n; i++) {
            char var_name[32];
            snprintf(var_name, sizeof(var_name), "y_%d_%d", i, cluster);
            values[i] = units[i]->voters;
            
            int col_index = CPXgetcolindex(env, lp, var_name, NULL);
            if (col_index < 0) {
                fprintf(stderr, "Failed to get column index for y_%d.\n", i);
                exit(1);
            }  
            row_indices[i] = col_index;
        }
        
        int status = CPXaddrows(env, lp, 0, 1, n, &lb, NULL, row_indices, values, &ub, NULL, NULL);
        // printf("Added constraint: %d <= ", lb);
        // for (int i = 0; i < n; i++) {
        //     printf("%d * y_%d_%d + ", values[i], i, cluster);
        // }
        // printf("<= %d \n", ub);
        if (status) {
            fprintf(stderr, "Failed to add population constraints for cluster %d.\n", cluster);
            exit(1);
        }
        
        free(row_indices);
        free(values);
    }
}

void add_compactness_constraints(TU **units, int n, CodeIndexMapping *code_index_mappings, int num_vars, CPXENVptr env, CPXLPptr lp) {
    int lb = 0.0;
    int ub = CPX_INFBOUND;
    int *row_indices = (int *)malloc(num_vars * sizeof(int));
    int *values = (int *)malloc(num_vars * sizeof(int));

    for (int i = 0, var_idx = 0; i < n; i++) {
        for (int j = 0; j < units[i]->num_neighbors; j++) {
            int neighbor_code = units[i]->neighbor_codes[j];
            int neighbor_index = find_index_by_code(neighbor_code, code_index_mappings, n);
            // printf("code: %d, index: %d\n", neighbor_code, neighbor_index);
            if (i < neighbor_index) {
                char var_name[32];
                snprintf(var_name, sizeof(var_name), "x_%d_%d", i, neighbor_index);

                int col_index = CPXgetcolindex(env, lp, var_name, NULL);
                if (col_index < 0) {
                    fprintf(stderr, "Failed to get column index for %s.\n", var_name);
                    exit(1);
                }

                row_indices[var_idx] = col_index;
                values[var_idx] = units[i]->border_sizes[j];
                var_idx++;
            }
        }
    }

    // Maximize the sum of internal borders between units in each cluster
    int status = CPXaddrows(env, lp, 0, 1, num_vars, &lb, NULL, row_indices, values, &ub, NULL, NULL);
    if (status) {
        fprintf(stderr, "Failed to add compactness constraints.\n");
        exit(1);
    }
    // printf("Compactness constraint:\n");
    // for (int i = 0; i < num_vars; i++) {
    //     printf("%d * x[%d] + ", values[i], row_indices[i]);
    // }
    // printf("<= %d\n", ub);

    free(row_indices);
    free(values);
}

// void create_flow_decision_variables(TU **units, int n, int k, CPXENVptr env, CPXLPptr lp, CodeIndexMapping *code_index_mappings) {
    
//     for (int i = 0; i < n; i++) {
//         for (int j = 0; j < units[i]->num_neighbors; j++) {
//             int neighbor_code = units[i]->neighbor_codes[j];
//             int neighbor_index = find_index_by_code(neighbor_code, code_index_mappings, n);
//             if (i < neighbor_index) {
//                 for (int cluster = 0; cluster < k; cluster++) {
                    
//                     // char var_name[32];
//                     // snprintf(var_name, sizeof(var_name), "f_%d_%d_%d", i, neighbor_index, cluster);

//                     char *var_name[1];
//                     var_name[0] = (char *)malloc(32 * sizeof(char));
//                     snprintf(var_name[0], 32, "x_%d_%d", i, neighbor_index);

//                     double lb = 0.0;
//                     double ub = CPX_INFBOUND;
//                     double obj_coef = 0.0;
 
//                     int col_index = CPXnewcols(env, lp, 1, &obj_coef, &lb, &ub, "C", &var_name);
//                     //int col_index = CPXnewcols(env, lp, 1, &obj_coef, &lb, &ub, "B", &var_name);
                    
//                     if (col_index < 0) {
//                         fprintf(stderr, "Failed to create decision variable %s.\n", var_name);
//                         exit(1);
//                     }
                    
//                 }
//             }
//         }
//     }
   
// }


void create_flow_decision_variables(TU **units, int n, int k, CPXENVptr env, CPXLPptr lp, CodeIndexMapping *code_index_mappings) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < units[i]->num_neighbors; j++) {
            int neighbor_code = units[i]->neighbor_codes[j];
            int neighbor_index = find_index_by_code(neighbor_code, code_index_mappings, n);
            if (i < neighbor_index) {
                for (int cluster = 0; cluster < k; cluster++) {
                    char *var_name[1];
                    var_name[0] = (char *)malloc(32 * sizeof(char));
                    snprintf(var_name[0], 32, "f_%d_%d_%d", i, neighbor_index, cluster); // Use f_ijk

                    double lb = 0.0;
                    double ub = 1.0; // binary variable
                    double obj_coef = 0.0;

                    int col_index = CPXnewcols(env, lp, 1, &obj_coef, &lb, &ub, "B", var_name); // binary variable
                    
                    if (col_index < 0) {
                        fprintf(stderr, "Failed to create decision variable %s.\n", var_name);
                        exit(1);
                    }
                }
            }
        }
    }
}
void add_contiguity_constraints(TU **units, int n, int k, CPXENVptr env, CPXLPptr lp, CodeIndexMapping *code_index_mappings) {
    for (int i = 0; i < n; i++) {
        for (int cluster = 0; cluster < k; cluster++) {
            int num_flow_vars = 2 * units[i]->num_neighbors;
            int *row_indices = (int *)malloc(num_flow_vars * sizeof(int));
            double *values = (double *)malloc(num_flow_vars * sizeof(double));

            for (int j = 0; j < units[i]->num_neighbors; j++) {
                int neighbor_code = units[i]->neighbor_codes[j];
                int neighbor_index = find_index_by_code(neighbor_code, code_index_mappings, n);

                if (i < neighbor_index) {
                    char var_name[32];

                    // f_{i, j, k}
                    snprintf(var_name, sizeof(var_name), "f_%d_%d_%d", i, neighbor_index, cluster);
                    int col_index = CPXgetcolindex(env, lp, var_name, NULL);
                    if (col_index < 0) {
                        fprintf(stderr, "Failed to get column index for %s.\n", var_name);
                        exit(1);
                    }

                    row_indices[2 * j] = col_index;
                    values[2 * j] = 1.0;

                    // f_{j, i, k}
                    snprintf(var_name, sizeof(var_name), "f_%d_%d_%d", neighbor_index, i, cluster);
                    col_index = CPXgetcolindex(env, lp, var_name, NULL);
                    if (col_index < 0) {
                        fprintf(stderr, "Failed to get column index for %s.\n", var_name);
                        exit(1);
                    }

                    row_indices[2 * j + 1] = col_index;
                    values[2 * j + 1] = -1.0;
                } else {
                    char var_name[32];

                                        // f_{j, i, k}
                    snprintf(var_name, sizeof(var_name), "f_%d_%d_%d", neighbor_index, i, cluster);
                    int col_index = CPXgetcolindex(env, lp, var_name, NULL);
                    if (col_index < 0) {
                        fprintf(stderr, "Failed to get column index for %s.\n", var_name);
                        exit(1);
                    }

                    row_indices[2 * j] = col_index;
                    values[2 * j] = 1.0;

                    // f_{i, j, k}
                    snprintf(var_name, sizeof(var_name), "f_%d_%d_%d", i, neighbor_index, cluster);
                    col_index = CPXgetcolindex(env, lp, var_name, NULL);
                    if (col_index < 0) {
                        fprintf(stderr, "Failed to get column index for %s.\n", var_name);
                        exit(1);
                    }

                    row_indices[2 * j + 1] = col_index;
                    values[2 * j + 1] = -1.0;
                }
            }

            char y_var_name[32];
            snprintf(y_var_name, sizeof(y_var_name), "y_%d_%d", i, cluster);
            int y_col_index = CPXgetcolindex(env, lp, y_var_name, NULL);
            if (y_col_index < 0) {
                fprintf(stderr, "Failed to get column index for %s.\n", y_var_name);
                exit(1);
            }

            double lb = 0.0;
            double ub = CPX_INFBOUND;
            int status = CPXaddrows(env, lp, 0, 1, num_flow_vars, &lb, NULL, row_indices, values, &ub, NULL, NULL);
            if (status) {
                fprintf(stderr, "Failed to add contiguity constraints for unit %d and cluster %d.\n", i, cluster);
                exit(1);
            }

            free(row_indices);
            free(values);
        }
    }
}

int get_var_index(CodeIndexMapping *code_index_mappings, int code, int cluster) {
    for (int i = 0; i < code_index_mappings->num_mappings; i++) {
        if (code_index_mappings->mappings[i].code == code) {
            return code_index_mappings->mappings[i].indices[cluster];
        }
    }
    return -1; // Error case: Code not found
}

int get_cluster_for_code(CodeIndexMapping *code_index_mappings, int code) {
    for (int i = 0; i < code_index_mappings->num_mappings; i++) {
        if (code_index_mappings->mappings[i].code == code) {
            return i;
        }
    }
    return -1; // Error case: Code not found
}

CodeIndexMapping *create_decision_variables(TU **units,int k, int n, CPXENVptr env, CPXLPptr lp, int ideal_pop  ) {
    CodeIndexMapping *code_index_mappings = create_code_index_mappings(units, n);
    
    int num_vars = 0;
    for (int i = 0; i < k; i++) {
        for (int j = 0; j < n; j++) {
            // Create decision variable x_ij
            char *var_name[1];
            var_name[0] = (char *)malloc(32 * sizeof(char));
            snprintf(var_name[0], 32, "x_%d_%d", i, j);

            int lb = 0.0;
            int ub = 1.0;
            double obj_coef = 0; // You can set the objective coefficient to 0 as it will be set later in the objective function

            int col_index = CPXnewcols(env, lp, 1, &obj_coef, &lb, &ub, "B", var_name);

            if (col_index < 0) {
                fprintf(stderr, "Failed to create decision variable x_%d_%d.\n", i, j);
                exit(1);
            }
            num_vars++;
            // Create decision variables b_i_j_j'
            for (int j_prime = 0; j_prime < n; j_prime++) {
                if (j != j_prime) {
                    char *b_var_name[1];
                    b_var_name[0] = (char *)malloc(32 * sizeof(char));
                    snprintf(b_var_name[0], 32, "b_%d_%d_%d", i, j, j_prime);

                    int b_col_index = CPXnewcols(env, lp, 1, &obj_coef, &lb, &ub, "B", b_var_name);

                    if (b_col_index < 0) {
                        fprintf(stderr, "Failed to create decision variable b_%d_%d_%d.\n", i, j, j_prime); 
                        exit(1);
                    }
                    num_vars++;
                }
            }
            
        }
    }
    printf("Total decision variables created: %d\n", num_vars);
    
    add_population_constraints(units, n, k, env, lp, ideal_pop);
    add_compactness_constraints(units, n, code_index_mappings, num_vars, env, lp);

    create_flow_decision_variables(units, n, k, env, lp, code_index_mappings);

   
    // free(code_index_mappings);

    
    return code_index_mappings;
}

void set_objective_function(TU **units, int n, int k, CPXENVptr env, CPXLPptr lp, CodeIndexMapping *code_index_mappings) {
    double *obj_coef = (double *) malloc(n * k * sizeof(double));
    int *obj_index = (int *) malloc(n * k * sizeof(int));

    int index = 0;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < k; j++) {
            obj_index[index] = get_var_index(code_index_mappings, units[i]->code, j);
            obj_coef[index] = 0;
            for (int p = 0; p < units[i]->num_neighbors; p++) {
                for (int q = 0; q < n; q++) {
                    if (units[q]->code == units[i]->neighbor_codes[p]) {
                        if (j == get_cluster_for_code(code_index_mappings, units[q]->code)) {
                            obj_coef[index] += units[i]->border_sizes[p];
                        }
                        break;
                    }
                }
            }
            index++;
        }
    }

    CPXchgobj(env, lp, n * k, obj_index, obj_coef);

    free(obj_coef);
    free(obj_index);
}

void print_code_index_mappings(CodeIndexMapping *code_index_mappings, int n) {
    for (int i = 0; i < n; i++) {
        printf("Code: %d, Index: %d, Num Mappings: %d\n", 
                code_index_mappings[i].code, 
                code_index_mappings[i].index, 
                code_index_mappings[i].num_mappings);
        for (int j = 0; j < code_index_mappings[i].num_mappings; j++) {
            printf("    Mapping %d, Code: %d\n", j, code_index_mappings[i].mappings[j].code);
            for (int k = 0; k < code_index_mappings[i].num_mappings; k++) {
                printf("        Index: %d\n", code_index_mappings[i].mappings[j].indices[k]);
            }
        }
    }
}


void runILP(TU **units, int k, int n, int m, int ideal_pop) {
    // Initialize CPLEX environment and problem
    CPXENVptr env = NULL;
    CPXLPptr lp = NULL;
    int status;
    
    env = CPXopenCPLEX(&status);
    if (env == NULL) {
        fprintf(stderr, "Could not open CPLEX environment.\n");
        exit(1);
    }

    lp = CPXcreateprob(env, &status, "districting");
    if (lp == NULL) {
        fprintf(stderr, "Could not create LP problem.\n");
        exit(1);
    }
    
    CodeIndexMapping *code_index_mappings = create_decision_variables(units,k, n, env, lp, ideal_pop);

    print_code_index_mappings(code_index_mappings, n);

    add_contiguity_constraints(units, n, k, env, lp, code_index_mappings);

    set_objective_function(units, n, k, env, lp, code_index_mappings);
        
    
  
    // Define your ILP model (objective function, variables, constraints) here

    // Solve the ILP
    status = CPXmipopt(env, lp);
    int solstat = CPXgetstat(env, lp);
    if (status != 0) {
        fprintf(stderr, "Failed to optimize the problem.\n");
        exit(1);
    }

    if (solstat == CPXMIP_OPTIMAL) {
        printf("Optimal solution found.\n");
    } else if (solstat == CPXMIP_INFEASIBLE) {
        printf("Problem is infeasible.\n");
    } else if (solstat == CPXMIP_UNBOUNDED) {
        printf("Problem is unbounded.\n");
    // } else if (solstat == CPXMIP_INFEASIBLE_OR_UNBOUNDED) {
    //     printf("Problem is either infeasible or unbounded.\n");
    } else if (solstat == CPXMIP_TIME_LIM_INFEAS) {
        printf("Time limit exceeded while trying to find a feasible solution.\n");
    } else if (solstat == CPXMIP_TIME_LIM_FEAS) {
        printf("Time limit exceeded while trying to prove optimality.\n");
    } else {
        printf("Optimization status: %d\n", solstat);
    }
    // Retrieve and process the solution
    double obj_val;
    double *solution = (double *) malloc(CPXgetnumcols(env, lp) * sizeof(double));

    int lpstat;
    double *pi = NULL;
    double *slack = NULL;
    double *dj = NULL;
    status = CPXsolution(env, lp, &lpstat, &obj_val, solution, pi, slack, dj);
    


    if (status != 0) {
        fprintf(stderr, "Failed to obtain the solution.\n");
        exit(1);
    }

    // printf("Objective value: %.2f\n", obj_val);
    // for (int i = 0; i < CPXgetnumcols(env, lp); i++) {
    //     printf("Variable %d: %.2f\n", i, solution[i]);
    // }

    // Free resources and close CPLEX
    free(solution);
    status = CPXfreeprob(env, &lp);
    if (status != 0) {
        fprintf(stderr, "Failed to free the problem.\n");
        exit(1);
    }

    status = CPXcloseCPLEX(&env);
    if (status != 0) {
        fprintf(stderr, "Failed to close CPLEX environment.\n");
        exit(1);
    }
}