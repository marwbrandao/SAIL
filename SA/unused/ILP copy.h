#ifndef _ILP_H
#define _ILP_H
#include "graph.h"
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

CodeIndexMapping *create_code_index_mappings(TU **units, int n);

int find_index_by_code(int code, CodeIndexMapping *code_index_mappings, int n);


CodeIndexMapping *create_decision_variables(TU **units,int k, int n, CPXENVptr env, CPXLPptr lp, int ideal_pop);

void runILP(TU **units, int k, int n, int m, int ideal_pop);

#endif /* _STATE_H */