#ifndef _STATE_H
#define _STATE_H
#include "graph.h"

typedef struct
{
    TU **units; // An array of pointers to units in the cluster
    int size;   // The number of units in the cluster
    int population;
} Cluster;
long long energy_population(TU **units, Cluster *cluster, int margin, int k, int n);
int energy_compactness(Cluster *clusters, int k);
/* The energy of the current state */
int
energy(TU** units, Cluster* clusters, int margin, int k, int n);
Cluster** first_cluster(TU **units, int k, int n);
void change_unit(Cluster *clusters, TU **units, int k, int n);
/* Execute a random transition
   Within the bound ell */
Cluster** /* Return whether it was successfull */
transitionBound(int ell , TU** units, int k, int n, FILE *pf_out
		);


Cluster** storeState(Cluster *clusters, int k, int n);

#endif /* _STATE_H */
