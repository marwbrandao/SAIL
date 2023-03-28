#include <time.h>
#include <math.h>
#include <assert.h>
#include <bsd/stdlib.h>
#include <limits.h>

#include "sa.h"
#include "state.h"
#include "graph.h"
#include "timer.h"

// #define INT_MIN	-2147483648
// #define INT_MAX	+2147483647

static int
myRandom(void)
{
  return random();
}

/* Used for defining calibration values */
double
getTemperature(double cp, /* complement probability */
               int ell    /* Energy delta limit. -0.5 done internally */
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

int                     // Energy delta
getEll(double T,        /* [in] the temperature */
       unsigned int *pR /* [out] the random number that was obtained */
)
{
  double c = 1.0;

  *pR = arc4random();
  // *pR = myRandom();
  // randvariavel
  unsigned int R = *pR;

  if (0 != R)
  {
    c = log2(-R);
    c -= log2(R);
    c /= T;
    c = round(c);
  }

  return (int)c; // deltaE
}

int runSA(double Tstart, /* [in] starting temperature */
          double Tstop,  /* [in] stopping temperature */
          int batch,     /* [in] number of iterations in a batch */
          int steps,     /* [in] number of steps to execute */
          TU **units, int k, int n, int m)
{
  printf("\nSA start!\n\n");

  //printf("Temp start: %f Temp stop: %f\n", Tstart, Tstop);
  int max = 0;
  double T = Tstart;
  double Td = Tstop - Tstart;
  Td /= steps;

  int ell = 1; /* Default value for greedy */
  unsigned int R;
  srand(time(NULL));
  FILE *output_file = fopen("output.txt", "w");
  fprintf(output_file, "%d;%d;%d\n", k, n, steps);
  Cluster *clusters = first_cluster(units, k, n);
  for (int i = 0; i < k; i++)
      {
        //printf("Cluster %d with size %d: ", i, clusters[i].size);
        fprintf(output_file, "0,%d:",  i);
        for (int j = 0; j < clusters[i].size; j++)
        {
          int unit_code = clusters[i].units[j]->code / 1;
          //printf("%d ", clusters[i].units[j]->code);
          fprintf(output_file, "%d,", unit_code);
        }
        //printf("\n");~
        
        fprintf(output_file, "\n");
      }
  
  long long best_energy_population = LONG_MAX;
  int best_energy_compactness = INT_MIN;
  Cluster *stored_state = NULL;
  for (int i = 0; i < k; i++)
  {
    printf("Cluster %d with size %d: ", i, clusters[i].size);
    for (int j = 0; j < clusters[i].size; j++)
    {
      printf("%d ", clusters[i].units[j]->code);
    }
    printf("\n");
  }
  printf("Tstart: %f, Tstop: %f, steps: %d\n", Tstart, Tstop, steps);
  double ratio = Tstop / Tstart;
  printf("ratio: %f\n", ratio);
  double exponent = 1.0 / steps;
  printf("exponent: %f\n", exponent);
  double alpha = pow(ratio, exponent);
  printf("alpha: %f\n", alpha);
  // printf("Temp start: %f Temp stop: %f\n", Tstart, Tstop);
  // double alpha = pow(Tstop / Tstart, 1.0 / steps);
  // printf("alpha: %f\n", alpha);
  for (int s = 1; s <= steps; s++)
  {

    ell = getEll(T, &R); // E(s)
    FILE *fp_out = fopen("cluster_info.txt", "w");
    change_unit(clusters, units, k, n);

    long long energy__population = energy_population(units, clusters, m, k, n);
    int energy__compactness = energy_compactness(clusters, k);

    double accept_prob = 0.0;

    if (energy__compactness > best_energy_compactness && energy__population == 0)
    {
      accept_prob = 1.0;
    }
    else if (energy__compactness > best_energy_compactness && energy__population > best_energy_population)
    {
      accept_prob = exp(1.0 / T);
      //printf("compact\n");
      fprintf(output_file, "prob: %f compact\n", accept_prob);
    }
    else if (energy__compactness < best_energy_compactness && energy__population < best_energy_population)
    {
      accept_prob = exp(1.0 / T);
      fprintf(output_file, "prob: %f pop\n", accept_prob);
    }
    else
    {
      accept_prob = 0.0;
    }
    double random_number = (double)rand() / (double)RAND_MAX;
    if (random_number < accept_prob)
    {
      //printf("accept probabilty: %f and random number: %f\n", accept_prob, random_number);
      best_energy_compactness = energy__compactness;
      best_energy_population = energy__population;
      //printf("max_pop: %d and  max_compact: %d\n", energy__population, energy__compactness);
      //printf("i = %d em %d--------------\n", s, steps);
      for (int i = 0; i < k; i++)
      {
        int pop_cluster = 0;
        //printf("Cluster %d with size %d: ", i, clusters[i].size);
        fprintf(output_file, "%d,%d:", s, i);
        for (int j = 0; j < clusters[i].size; j++)
        {
          pop_cluster = pop_cluster + clusters[i].units[j]->voters;
          int unit_code = clusters[i].units[j]->code / 1;
          //printf("%d ", clusters[i].units[j]->code);
          fprintf(output_file, "%d,", unit_code);
        }
        //printf("\n");~
        fprintf(output_file, " --> população: %d", pop_cluster);
        fprintf(output_file, "\n");
      }
      fprintf(output_file, "prob: %f and random: %f\n", accept_prob, random_number);
      fprintf(output_file, "fronteiras internas: %d\n", best_energy_compactness);

      // if (stored_state != NULL)
      // {
      // }
      stored_state = storeState(clusters, k, n);
    }
    T *= alpha;

    
  }
  
  for (int i = 0; i < k; i++)
      {
        //printf("Cluster %d with size %d: ", i, clusters[i].size);
        
        for (int j = 0; j < clusters[i].size; j++)
        {
          int unit_code = clusters[i].units[j]->code / 1;
          //printf("%d ", clusters[i].units[j]->code);
          //fprintf(output_file, "%d,", unit_code);
        }
        //printf("\n");~
        
        fprintf(output_file, "\n");
      }
  fclose(output_file);

  printf("\n");
  printf("SA end!\n");

  return;
}