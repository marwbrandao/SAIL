#include <time.h>
#include <math.h>
#include <assert.h>
#include <bsd/stdlib.h>

#include "sa.h"
#include "state.h"
#include "graph.h"
#include "timer.h"

static int 
myRandom(void) 
{ 
  return random();
 } 

/* Used for defining calibration values */
double
getTemperature(double cp, /* complement probability */
               int ell /* Energy delta limit. -0.5 done internally */
               )
{
  assert(0 >= ell &&
	 "Invalid d to define T.");
  assert(0.5 > cp &&
	 "Invalid complement probability to define T.");

  double res = cp;
  res /= 1.0 - cp;
  res = log2(res);
  res /= ((double)ell) - 0.5;

  return res;
}

int // Energy delta
getEll(double T, /* [in] the temperature */
       unsigned int *pR /* [out] the random number that was obtained */
       )
{
  double c = 1.0;

  *pR = arc4random();
  // *pR = myRandom(); 
  //randvariavel 
  unsigned int R = *pR;

  if(0 != R){
    c = log2(-R);
    c -= log2(R);
    c /= T;
    c = round(c);
  }
  
  return (int) c;// deltaE
}

int
runSA(double Tstart, /* [in] starting temperature */
      double Tstop, /* [in] stopping temperature */
      int batch, /* [in] number of iterations in a batch */
      int steps, /* [in] number of steps to execute */
      TU** units, int k, int n, int m
      )
{
  printf("\nSA start!\n\n");
  
  int max = 0;
  double T = Tstart;
  double Td = Tstop-Tstart;
  Td /= steps;

  int ell = 1; /* Default value for greedy */
  unsigned int R;


  Cluster* clusters = first_cluster(units, k, n);
  max = energy(units, clusters, m, k, n);
  for (int i = 0; i < k; i++)
    {
        printf("Cluster %d with size %d: ", i, clusters[i].size);
        for (int j = 0; j < clusters[i].size; j++)
        {
            printf("%d ", clusters[i].units[j]->code);
        }
        printf("\n");
    }
  for(int i = 0; i < steps; i++){
  //  for(int j = 0; j < batch; j++){
    
      ell = getEll(T, &R); //E(s)
      FILE *fp_out = fopen("cluster_info.txt", "w");
       /* Calls change state function */  
  
      change_unit(clusters, units, k, n);

      printf("i = %d em %d--------------\n", i, steps);
      for (int i = 0; i < k; i++)
      {
        int pop_cluster = 0;
          printf("Cluster %d with size %d: ", i, clusters[i].size);
          for (int j = 0; j < clusters[i].size; j++)
          {
              printf("%d ", clusters[i].units[j]->code);
              pop_cluster = pop_cluster + clusters[i].units[j]->voters;
          }
          printf("with population %d ", pop_cluster);
          printf("\n");
      }
      //printf("max: %d\n", max);
      // if(max > energy(units, clusters, m, k, n)){
      //    printf("i = %d em %d--------------\n", i, steps);
      //   for (int i = 0; i < k; i++)
      // {
      //   int pop_cluster = 0;
      //     printf("Cluster %d with size %d: ", i, clusters[i].size);
      //     for (int j = 0; j < clusters[i].size; j++)
      //     {
      //         printf("%d ", clusters[i].units[j]->code);
      //         pop_cluster = pop_cluster + clusters[i].units[j]->voters;
      //     }
      //     printf("with population %d ", pop_cluster);
      //     printf("\n");
      // }
      //   max = energy(units, clusters, m, k, n);
      //   printf("\n MAX MAS MAX max: %d\n\n", max);
      //   Cluster* stored_state = storeState(clusters, k, n);

      // }

    T += Td;
  }
  
  printf("\n");
  printf("SA end!\n");

  return max;
}

// for (int i = 0; i < n; i++) {
  //       printf("Unit_sa %d: %d neighbors\n", units[i]->code, units[i]->num_neighbors);
  //       for (int j = 0; j < units[i]->num_neighbors; j++) {
  //           printf("Neighbor %d: border size %d\n", units[i]->neighbor_codes[j], units[i]->border_sizes[j]);
  //       }
  //   }