#include <time.h>
#include <math.h>
#include <assert.h>
// #include <bsd/stdlib.h>
#include <limits.h>
#include <ilcplex/cplex.h>

#define min(a, b) ((a) < (b) ? (a) : (b))

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

void print_best_clusters(Cluster *best_clusters, TU **units, int k, int n, FILE *output_file, int ideal_population)
{

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
          TU **units, int k, int n, int m, int ideal_pop, int d)
{
  clock_t start, end;
  double cpu_time_used;
  start = clock();
  int max = 0;
  double Td = Tstop - Tstart;
  Td /= steps;
  unsigned int R;
  long long best_energy_population = 500.0;
  int best_energy_compactness = 0;
  long long Final_energy_population = LONG_MAX;
  int Final_energy_compactness = 0;
  Cluster *stored_state = NULL;
  double ratio = Tstop / Tstart;
  double exponent = 1.0 / steps;
  double alpha = pow(ratio, exponent);
  double a_it = 1.0;
  FILE *output_file = fopen("output.txt", "w");
  char filename[50];  // adjust size as needed
  sprintf(filename, "SA_graph_%d_comp-pop.csv", d);
  //FILE *sa_graph_file = fopen(filename, "w");
  // 
  printf("About to open file.\n");
  FILE *sa_graph_file = fopen(filename, "w");
  if (!sa_graph_file)
  {
    perror("fopen");
    exit(EXIT_FAILURE);
  }
  fprintf(output_file, "%d;%d;%d\n", k, n, steps);

  int perfect_score = 0;
  int not_as_great_score = 0;
  popul_test1(units, n, k, ideal_pop);

  // Uncomment to run only ILP
  printf("0 ");
  Cluster *clusters_ilp = runILP_only(units, k, n, m, ideal_pop);
  print_best_clusters(clusters_ilp, units, k, n, output_file, ideal_pop);
  
  return;

  srand(time(NULL));

  Cluster *clusters = first_cluster(units, k, n);
  Cluster *best_clusters = NULL;

  double startingValue = 0.2;
  double endingValue = 0.000001;
  int numIterations = 1000000;

  double increment = (endingValue - startingValue) / (numIterations - 1);

  int iteration;
  double value;
  double accept_prob = 0.0;
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
  printf("\nSA start!\n\n");
  for (int s = 1; s <= numIterations; s++)
  {
    FILE *fp_out = fopen("cluster_info.txt", "w");

    change_unit(clusters, units, k, n);

    
    // if(s == numIterations-1)
    //   print_best_clusters(clusters, units,  k,  n, output_file, ideal_pop);
      //printf("11HI!!\n");
    long long energy__population = energy_population(units, clusters, m, k, n, ideal_pop);

    int energy__compactness = energy_compactness(clusters, k);
    accept_prob = 0.0;
    
    // if (s % (numIterations / 5) == 0)
    // {
      
    //   if (perfect_score == 0)
    //   {
    //     if (best_clusters != NULL)
    //       clusters = runILP(units, k, n, m, ideal_pop, best_clusters);
    //     else
    //       clusters = runILP(units, k, n, m, ideal_pop, clusters);
    //     //printf("HI!!\n");
    //     // for (int i = 0; i < k; i++)
    //     // {
    //     //   int pop_cluster = 0;
    //     //   //printf("2HI!!\n");
    //     //   for (int j = 0; j < clusters[i].size; j++)
    //     //   {

    //     //     pop_cluster = pop_cluster + clusters[i].units[j]->voters;
    //     //     int unit_code = clusters[i].units[j]->code / 1;
    //     //   }
    //     //   printf(" --> população: %d", pop_cluster);
    //     //   printf("\n");
    //     // }
    //     //printf("3HI!!\n");
    //     energy__population = energy_population(units, clusters, m, k, n, ideal_pop);
    //     energy__compactness = energy_compactness(clusters, k);
        
    //     // if (energy_population(units, clusters, m, k, n, ideal_pop) == 0){
          
    //     //   if (best_clusters == NULL)
    //     //   {
    //     //     best_clusters = malloc(k * sizeof(Cluster));
    //     //     for (int i = 0; i < k; i++)
    //     //     {
    //     //       best_clusters[i].units = malloc(n * sizeof(TU *));
    //     //       best_clusters[i].size = 0;
    //     //     }
    //     //   }
          
    //     //   energy__population = energy_population(units, clusters, m, k, n, ideal_pop);
    //     //   energy__compactness = energy_compactness(clusters, k);
    //     //   printf(sa_graph_file, "%d,%d,2.0\n", s, energy__compactness);
    //     // //printf("HERE____ %d\n",best_clusters[0].size);
    //     //     for (int i = 0; i < k; i++)
    //     //   {
              
    //     //       best_clusters[i].size = clusters[i].size;
              
    //     //       memcpy(best_clusters[i].units, clusters[i].units, clusters[i].size * sizeof(TU *));
    //     //   } 
    //     //   printf("3HI!!\n");
    //     //   print_best_clusters(best_clusters, units, k, n, output_file, ideal_pop);
    //     //   if (best_energy_compactness < energy__compactness){
    //     //   best_energy_compactness = energy__compactness;
    //     //   best_energy_population = energy__population;
    //     //   }
    //     // }
    //     //printf("HERE!\n");
    //     //stored_state = storeState(clusters, k, n);
    //   }
    // }
    
    if (energy__compactness >= best_energy_compactness && energy__population == 0)
    {
      accept_prob = 1.0;
      print_best_clusters(clusters, units,  k,  n, output_file, ideal_pop);
      //fprintf(sa_graph_file, "%d,%d,1.0\n", s, energy__compactness);
      if (energy__compactness > best_energy_compactness)
        perfect_score++;
    }
    else if (energy__compactness > best_energy_compactness && energy__population > best_energy_population)
    {
      accept_prob = startingValue + (increment * (s - 1));
      not_as_great_score++;
    }
    else if (energy__compactness < best_energy_compactness && energy__population < best_energy_population)
    {

      if (energy__population == 0)
        //fprintf(sa_graph_file, "%d,%d,1.0\n", s, energy__compactness);
      accept_prob = startingValue + (increment * (s - 1));
      not_as_great_score++;
    }
    else
    {

      accept_prob = 0.0;
    }

    if (s % (numIterations / 5) == 0)
    {

      printf("----->iteration: %d, perfect: %d, not_perfect: %d\n", s, perfect_score, not_as_great_score);

      for (int i = 0; i < k; i++)
      {
        int pop_cluster = 0;

        printf("Cluster %d with size %d: ", i, clusters[i].size);
        for (int j = 0; j < clusters[i].size; j++)
        {
          pop_cluster = pop_cluster + clusters[i].units[j]->voters;
          int unit_code = clusters[i].units[j]->code / 1;
        }
        printf(" --> população: %d", pop_cluster);
        printf("\n");
        // fprintf(output_file, "\n");
      }
      printf("fronteiras: %d prob: %f\n\n", energy__compactness, accept_prob);
      perfect_score = 0;
      not_as_great_score = 0;
    }

    double random_number = (double)rand() / (double)RAND_MAX;
    if (random_number < accept_prob)
    {
      if ((energy__compactness > Final_energy_compactness && energy__population <= Final_energy_population) ||
          (energy__compactness >= Final_energy_compactness && energy__population < Final_energy_population))
      { //&& accept_prob == 1.0

        // retirei accept prob
        Final_energy_compactness = energy__compactness;
        Final_energy_population = energy__population;
        
        if(Final_energy_population == 0){
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
          best_energy_compactness = energy__compactness;
          best_energy_population = energy__population;
          print_best_clusters(best_clusters, units, k, n, output_file, ideal_pop);
        }   
      }
      else
      {
        // fprintf(sa_graph_file, "%d,%d,0.5\n", s, energy__compactness);
      }
      int max_deviation = 0;
      double deviation_percentage = 0.0;
      // int pop_cluster = 0;
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
      fprintf(sa_graph_file, "%f,%d,1.0\n", deviation_percentage, energy__compactness);
      fprintf(output_file, "prob: %f and random: %f\n", accept_prob, random_number);
      fprintf(output_file, "fronteiras internas: %d\n\n", best_energy_compactness);

      stored_state = storeState(clusters, k, n);
    }
    

    increment = (endingValue - startingValue) / (numIterations - 1);
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
  cpu_time_used = ((double)(end - start)) / CLOCKS_PER_SEC;

  printf("Time taken: %f seconds\n", cpu_time_used);

  return;
}