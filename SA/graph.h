
#ifndef GRAPH_H
#define GRAPH_H

#include <stdio.h>
#include <stdbool.h>


typedef struct TU{
    int code;
    int num_code;
    int voters;
    int num_neighbors;
    int* neighbor_codes;
    int* border_sizes;
    bool assigned; 
    int cluster_id;
} TU;

TU** graph (char* fp, int* d, int* k, int* n, int* m);

void free_units(TU** units);


#endif /* GRAPH_H */