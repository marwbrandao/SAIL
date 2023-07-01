#ifndef _ILP_H
#define _ILP_H
#include "graph.h"
#include "state.h"
typedef struct {
    int code;
    int *indices;
} Mapping;

typedef struct {
    int code;
    int index;
    int num_mappings;
    Mapping *mappings;
} CodeIndexMapping;

void create_code_index(TU **units, int n);

// int find_index_by_code(int code, CodeIndexMapping *code_index_mappings, int n);
void create_flow_decision_variables(TU **units, int n, int k, CPXENVptr env, CPXLPptr lp);

int create_decision_variables(TU **units,int k, int n, CPXENVptr env, CPXLPptr lp);

void add_fixed_cluster_constraints(CPXENVptr env, CPXLPptr lp, TU** units, Cluster* clusters, int num_units, int num_clusters, int ideal_pop);

Cluster** runILP(TU **units, int k, int n, int m, int ideal_pop, Cluster* clusters);

Cluster **runILP_only(TU **units, int k, int n, int m, int ideal_pop);

#endif /* _STATE_H */