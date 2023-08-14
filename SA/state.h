#ifndef _STATE_H
#define _STATE_H
#include "graph.h"

typedef struct
{
    TU **units; // An array of pointers to units in the cluster
    int size;   // The number of units in the cluster
    int population;
    TU **border_units;  // The indices of the border units
    int num_border_units; // The number of border units 
    int id;
    bool blocked;
} Cluster;


int _pop_ideal(int d);
void popul_test1(TU **units, int n, int k, int ideal_pop);
int energy_population(TU **units, Cluster *cluster, int margin, int k, int n, int ideal_pop);
int energy_compactness(Cluster *clusters, int k);
/* The energy of the current state */
int
energy(TU** units, Cluster* clusters, int margin, int k, int n);
Cluster** first_cluster(TU **units, int k, int n);

Cluster **refined_first_cluster(TU **units, int k, int n, int ideal_population);
void redistribute_units_to_clusters(TU **units, Cluster *clusters, int k, int n, int ideal_population);
void change_unit1(Cluster *clusters, TU **units, int k, int n);
void change_unit(Cluster *clusters, TU **units, int k, int n, int ideal_pop);
/* Execute a random transition
   Within the bound ell */
Cluster** /* Return whether it was successfull */
transitionBound(int ell , TU** units, int k, int n, FILE *pf_out
		);


Cluster** storeState(Cluster *clusters, int k, int n);

#endif /* _STATE_H */
