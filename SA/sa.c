#include <time.h>
#include <math.h>
#include <assert.h>
#include <bsd/stdlib.h>
#include <limits.h>
#include <ilcplex/cplex.h>

#define min(a,b) ((a) < (b) ? (a) : (b))

#include "ILP.h"
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

void print_best_clusters(Cluster *best_clusters, TU **units, int k, int n, FILE *output_file, int ideal_population)
{
  //int total_population = 0;
  //double max_population_deviation_percentage = 0.0;
  //double final_population_deviation = 0.0;
  //int total_deviation = 0;
  int max_deviation = 0;
  double deviation_percentage = 0.0;

  printf("ideal pop: %d\n", ideal_population);
  fprintf(output_file, "\nBest solution found:\n");
  printf("Best solution found:\n");
  for (int i = 0; i < k; i++)
  {
    int pop_cluster = 0;
    printf("%d:", i);
    fprintf(output_file, "%d:", i);
    for (int j = 0; j < best_clusters[i].size; j++)
    {
      pop_cluster = pop_cluster + best_clusters[i].units[j]->voters;
      int unit_code = best_clusters[i].units[j]->code / 1;
      printf("%d,", unit_code);
      fprintf(output_file, "%d,", unit_code);
    }
    printf(" --> população: %d", pop_cluster);
    printf("\n");
    fprintf(output_file, " --> população: %d", pop_cluster);
    fprintf(output_file, "\n");

    int deviation = abs(pop_cluster - ideal_population);
    printf("deviation: %d\n", deviation);
    if (deviation > max_deviation)
    {
      max_deviation = deviation;
    }

    deviation_percentage = ((double)max_deviation / ideal_population) * 100.0;
  }
  printf("final population deviation to theoretical best value: %lf%%\n", deviation_percentage);
  fprintf(output_file, "final population deviation to theoretical best value: %lf%%\n", deviation_percentage);

  printf("maximum deviation of population between electoral districts: %lf%%\n", deviation_percentage);
  fprintf(output_file, "maximum deviation of population between electoral districts: %lf%%\n", deviation_percentage);

  int energy__compactness = energy_compactness(best_clusters, k);
  printf("fronteiras internas: %d\n\n", energy__compactness);
  fprintf(output_file, "fronteiras internas: %d\n\n", energy__compactness);
}

int runSA(double Tstart, /* [in] starting temperature */
          double Tstop,  /* [in] stopping temperature */
          int batch,     /* [in] number of iterations in a batch */
          int steps,     /* [in] number of steps to execute */
          TU **units, int k, int n, int m, int ideal_pop)
{

  clock_t start, end;
  double cpu_time_used;

  start = clock();

  int max = 0;

  double temperature_population = Tstart;
  double temperature_compactness = Tstart;
  printf("temp start : %f\n", Tstart);

  int best_energy_population = INT_MAX;
  int best_energy_compactness = INT_MIN;
  long long Final_energy_population = LONG_MAX;
  int Final_energy_compactness = INT_MIN;
  Cluster *stored_state = NULL;
  int numIterations = 20;

  double ratio = Tstop / Tstart;
  double exponent = 1.0 / numIterations;
  double alpha = pow(ratio, exponent);

  int perfect_score = 0;
  int not_as_great_score = 0;

  printf("\nSA start!\n\n");

  srand(time(NULL));
  FILE *output_file = fopen("output.txt", "w");
  FILE *sa_graph_file = fopen("SA_graph.txt", "w");
  fprintf(output_file, "%d;%d;%d\n", k, n, steps);
  
  Cluster *clusters = first_cluster(units, k, n);
  Cluster *best_clusters = NULL;



  for (int i = 0; i < k; i++)
  { 
    int pop_cluster = 0;
    fprintf(output_file, "0,%d:", i);
    printf("Cluster %d with size %d: ", i, clusters[i].size);
    for (int j = 0; j < clusters[i].size; j++)
    {
      int unit_code = clusters[i].units[j]->code / 1;
      printf("%d ", clusters[i].units[j]->code);
      fprintf(output_file, "%d,", unit_code);
      pop_cluster = pop_cluster + clusters[i].units[j]->voters;
    }
    printf(" --> população: %d", pop_cluster);
    printf("\n");
    fprintf(output_file, "\n");
  }

  for (int s = 1; s <= numIterations; s++)
  { 

    ell = getEll(T, &R); // E(s)
    FILE *fp_out = fopen("cluster_info.txt", "w");
    change_unit(clusters, units, k, n);

    int energy__population = energy_population(units, clusters, m, k, n, ideal_pop);
    
     int energy__compactness = energy_compactness(clusters, k);

     printf("best energy pop: %d, energy pop: %d \nbest energy comp: %d, energy comp: %d\n", best_energy_population, energy__population, best_energy_compactness, energy__compactness);
    
    printf("temperature population: %f, temperature compactness: %f\n", temperature_population, temperature_compactness);


    double accept_prob_population = exp((best_energy_population - energy__population) / temperature_population);
    double accept_prob_compactness = exp((best_energy_compactness - energy__compactness) / temperature_compactness);

    printf("---- here:accpet prob pop: %f and ccpet prob comp: %f\n", accept_prob_population, accept_prob_compactness);

    double accept_prob = min(accept_prob_population, accept_prob_compactness);

    double random_number = (double)rand() / (double)RAND_MAX;
    if (random_number < accept_prob)
    {
      if (accept_prob != 1.0)
        not_as_great_score++; 

      if ((energy__compactness > Final_energy_compactness && energy__population <= Final_energy_population) ||
          (energy__compactness >= Final_energy_compactness && energy__population < Final_energy_population))
      {
        Final_energy_compactness = energy__compactness;
        Final_energy_population = energy__population;

        if (best_clusters == NULL)
        {
          best_clusters = malloc(k * sizeof(Cluster));
          for (int i = 0; i < k; i++)
          {
            best_clusters[i].units = malloc(n * sizeof(TU *));
            best_clusters[i].size = 0;
          }
        }
        for (int i = 0; i < k; i++)
        {
          best_clusters[i].size = clusters[i].size;
          memcpy(best_clusters[i].units, clusters[i].units, clusters[i].size * sizeof(TU *));
        }
      }
      
      if (accept_prob_population > random_number)
    {
        best_energy_population = energy__population;
    }

    if (accept_prob_compactness > random_number)
    {
        best_energy_compactness = energy__compactness;
    }

      int max_deviation = 0;
      double deviation_percentage = 0.0;

      for (int i = 0; i < k; i++)
      {
        int pop_cluster = 0;
        fprintf(output_file, "%d,%d:", s, i);
        for (int j = 0; j < clusters[i].size; j++)
        {
          pop_cluster = pop_cluster + clusters[i].units[j]->voters;
          int unit_code = clusters[i].units[j]->code / 1;
          fprintf(output_file, "%d,", unit_code);
        }
        fprintf(output_file, " --> população: %d", pop_cluster);
        fprintf(output_file, "\n");
        
        int deviation = abs(pop_cluster - ideal_pop);
        if (deviation > max_deviation)
        {
          max_deviation = deviation;
        }
      }
      deviation_percentage = ((double)max_deviation / ideal_pop) * 100.0;
      fprintf(output_file, "prob: %f and random: %f\n", accept_prob, random_number);
      fprintf(output_file, "fronteiras internas: %d\n\n", best_energy_compactness);
      
      fprintf(sa_graph_file, "%d,%f,%d,%f\n", s, deviation_percentage, best_energy_compactness, accept_prob);

      stored_state = storeState(clusters, k, n);
    }
    if (s % (numIterations/10) == 0)
{

  printf("Temperature Population: %f, Temperature Compactness: %f, T: %f\n", temperature_population, temperature_compactness, T);

  printf("----->iteration: %d, perfect: %d, not_perfect: %d\n", s, perfect_score, not_as_great_score);
  
  for (int i = 0; i < k; i++)
  {
    int pop_cluster = 0;
    printf("Cluster %d with size %d: ", i, clusters[i].size);
    
    for (int j = 0; j < clusters[i].size; j++)
    {
      pop_cluster += clusters[i].units[j]->voters;
    }
    
    printf(" --> population: %d\n", pop_cluster);
  }
  
  long long current_energy_population = energy_population(units, clusters, m, k, n, ideal_pop);
  int current_energy_compactness = energy_compactness(clusters, k);
  
  double current_accept_prob_population = exp((best_energy_population - current_energy_population) / temperature_population);
  double current_accept_prob_compactness = exp((best_energy_compactness - current_energy_compactness) / temperature_compactness);
  
  double current_accept_prob = min(current_accept_prob_population, current_accept_prob_compactness);
  
  printf("Borders: %d prob: %f\n\n", current_energy_compactness, current_accept_prob_compactness);
  printf("pop: %d prob: %f\n\n", current_energy_population, current_accept_prob_population);
}
    temperature_population *= alpha;
    temperature_compactness *= alpha;

  }

  if (best_clusters != NULL)
  {
    print_best_clusters(best_clusters, units, k, n, output_file, ideal_pop);
    for (int i = 0; i < k; i++)
    {
      free(best_clusters[i].units);
    }
    free(best_clusters);
  }
  fclose(output_file);

  printf("\n");
  printf("SA end!\n");
  end = clock();
  cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;

  printf("Time taken: %f seconds\n", cpu_time_used);

  return;
}