#include <stdlib.h>
#include <string.h>
//#include <bsd/stdlib.h>
/* #include <stdio.h> */
#include "graph.h"


#include <stdbool.h>

#define MAX_TUS 10
#define MAX_NEIGHBORS 6

struct TU;

// Reads the files, d -> is the number of the district, k -> is the number of clusters, n -> number of TUs, m -> margin of population 
TU** graph(char* filename, int* d, int* k, int* n, int* m) {

    char line[256];
    
    sscanf(filename, "d%d_k%d_n%d_m%d.data", d, k, n, m);    
    FILE* fp = fopen(filename, "r");
    TU** units = malloc((*n) * sizeof(*units));
    int l = 0;
    while (fgets(line, 256, fp) != NULL) {
        int count = 0;
        TU* unit = malloc(sizeof(TU));

        for (int i = 0; i < strlen(line); i++) {
            if (line[i] == ':') {
                count++;
            }
        }

        sscanf(line, "'%d':", &unit->code);
        sscanf(strstr(line, "'voters':") + strlen("'voters':"), "%d,", &unit->voters);
        
        char* next_field = strstr(line, ",") + strlen(",")+ 1;
        
        unit->num_neighbors = count - 2;
        unit->neighbor_codes = malloc(unit->num_neighbors * sizeof(int));
        unit->border_sizes = malloc(unit->num_neighbors * sizeof(int));
        unit->assigned = false;
        
        char* end = strchr(next_field, '}');
        for (int i = 0; i < unit->num_neighbors; i++) {       
             
            sscanf(next_field, "'%d':", &unit->neighbor_codes[i]);      
            next_field = strchr(next_field, ':') + 1;
            sscanf(next_field, "%d", &unit->border_sizes[i]);
            if (i == unit->num_neighbors-1) {
                continue;
             }
            else {
                next_field = strchr(next_field, ',') + 1;
                next_field = strchr(next_field, ' ') + 1;
                continue;
            }
        }

        units[l] = unit;
        l++;
    }

    return units;
}

void free_units(TU** units) {
    for (int i = 0; i < 10; i++) {
        free(units[i]->neighbor_codes);
        free(units[i]->border_sizes);
        free(units[i]);
    }
    free(units);
}