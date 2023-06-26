#include <time.h>
#include <math.h>
#include <assert.h>
#include <bsd/stdlib.h>
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

// int                     // Energy delta
// getEll(double T,        /* [in] the temperature */
//        unsigned int *pR /* [out] the random number that was obtained */
// )
// {
//   double c = 1.0;

//   *pR = arc4random();
//   // *pR = myRandom();
//   // randvariavel
//   unsigned int R = *pR;

//   if (0 != R)
//   {
//     c = log2(-R);
//     c -= log2(R);
//     c /= T;
//     c = round(c);
//   }

//   return (int)c; // deltaE
// }

void print_best_clusters(Cluster *best_clusters, TU **units, int k, int n, FILE *output_file, int ideal_population)
{
  // int total_population = 0;
  // double max_population_deviation_percentage = 0.0;
  // double final_population_deviation = 0.0;
  // int total_deviation = 0;
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
  // double T = Tstart;
  double Td = Tstop - Tstart;
  Td /= steps;
  // int ell = 1; /* Default value for greedy */
  unsigned int R;
  long long best_energy_population = LONG_MAX;
  int best_energy_compactness = INT_MIN;
  long long Final_energy_population = LONG_MAX;
  int Final_energy_compactness = INT_MIN;
  Cluster *stored_state = NULL;

  double ratio = Tstop / Tstart;

  double exponent = 1.0 / steps;

  double alpha = pow(ratio, exponent);

  double a_it = 1.0;

  // double r_it = (0.000001/1.0)*exp(1/2000000)

  int perfect_score = 0;
  int not_as_great_score = 0;
  popul_test1(units, n, k, ideal_pop);

  // return;

  // Cluster *clusters = runILP(units, k, n, m, ideal_pop);

  // return;

  srand(time(NULL));
  FILE *output_file = fopen("output.txt", "w");
  FILE *sa_graph_file = fopen("SA_graph.csv", "w");
  fprintf(output_file, "%d;%d;%d\n", k, n, steps);

  Cluster *clusters = first_cluster(units, k, n);
  Cluster *best_clusters = NULL;

  double startingValue = 1.0;
  double endingValue = 0.000001;
  int numIterations = 10;

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
    // if (s == 10)
    //   printf("hi\n");

    // ell = getEll(T, &R); // E(s)
    FILE *fp_out = fopen("cluster_info.txt", "w");
    change_unit(clusters, units, k, n);

    if (s % (numIterations / 10) == 0)
    {
      if (perfect_score == 0)
      {

        // double accept_prob = 0.0;
        //  accept_prob = 1.0;
        clusters = runILP(units, k, n, m, ideal_pop, clusters);
        // energy__population = energy_population(units, clusters, m, k, n, ideal_pop);

        // energy__compactness = energy_compactness(clusters, k);

        for (int i = 0; i < k; i++)
        {
          //printf("hii\n");
          int pop_cluster = 0;
          //printf("..Cluster %d with size %d: ", i, clusters[i].size);

          for (int j = 0; j < clusters[i].size; j++)
          {

            pop_cluster = pop_cluster + clusters[i].units[j]->voters;
            int unit_code = clusters[i].units[j]->code / 1;
          }
          printf(" --> população: %d", pop_cluster);
          printf("\n");
        }
      }
    }

    long long energy__population = energy_population(units, clusters, m, k, n, ideal_pop);

    int energy__compactness = energy_compactness(clusters, k);
    // if (s == 100000)
    //   printf("pop: %f\n", energy__compactness);
    accept_prob = 0.0;
    // double accept_prob2 = 1/log(T/100000);
    // fprintf(output_file,"here---%f\n", accept_prob2);
    if (energy__compactness > best_energy_compactness && energy__population == 0)
    {
      // printf("%d > %d\n", energy__compactness, best_energy_compactness);
      accept_prob = 1.0;
      // accept_prob = 1.0;
      perfect_score++;
      // print_best_clusters(clusters, units, k, n, output_file, ideal_pop);
    }
    else if (energy__compactness > best_energy_compactness && energy__population > best_energy_population)
    {
      // accept_prob = 1/log(T);
      accept_prob = startingValue + (increment * (s - 1));
      // accept_prob=a_it*(1-r_it)*exp(2000000);
      not_as_great_score++;
    }
    else if (energy__compactness < best_energy_compactness && energy__population < best_energy_population)
    {
      // accept_prob = 1/log(T*1000000);
      // printf("%f\n", accept_prob);

      accept_prob = startingValue + (increment * (s - 1));
      // accept_prob=a_it*(1-r_it)*exp(2000000);
      not_as_great_score++;
    }
    else
    {

      accept_prob = 0.0;
    }
    // if (s%100000==0)
    // printf("%d ", s);
    if (s % (numIterations / 10) == 0)
    {
      // printf("%d ", s);
      printf("----->iteration: %d, perfect: %d, not_perfect: %d\n", s, perfect_score, not_as_great_score);
      accept_prob = startingValue + (increment * (s - 1));
      for (int i = 0; i < k; i++)
      {
        int pop_cluster = 0;
        // fprintf(output_file, "0,%d:", i);
        printf("Cluster %d with size %d: ", i, clusters[i].size);
        for (int j = 0; j < clusters[i].size; j++)
        {
          pop_cluster = pop_cluster + clusters[i].units[j]->voters;
          int unit_code = clusters[i].units[j]->code / 1;
          // printf("%d ", clusters[i].units[j]->code);
          //  fprintf(output_file, "%d,", unit_code);
        }
        printf(" --> população: %d", pop_cluster);
        printf("\n");
        // fprintf(output_file, "\n");
      }
      printf("fronteiras: %d prob: %f\n\n", energy__compactness, accept_prob);
      perfect_score = 0;
      not_as_great_score = 0;
    }

    // for (int i = 0; i < k; i++)
    //   {
    //     int pop_cluster = 0;
    //     //printf("%d,%d:", s, i);
    //     fprintf(output_file, "%d,%d:", s, i);
    //     for (int j = 0; j < clusters[i].size; j++)
    //     {
    //       pop_cluster = pop_cluster + clusters[i].units[j]->voters;
    //       int unit_code = clusters[i].units[j]->code / 1;
    //       //printf("%d,", unit_code);
    //       fprintf(output_file, "%d,", unit_code);
    //     }

    //     //printf("\n");
    //     fprintf(output_file, " --> população: %d", pop_cluster);
    //     fprintf(output_file, "\n");
    //   }
    //   //fprintf(output_file, "prob: %f and random: %f\n", accept_prob, random_number);
    //   fprintf(output_file, "fronteiras internas: %d\n\n", best_energy_compactness);

    double random_number = (double)rand() / (double)RAND_MAX;
    if (random_number < accept_prob)
    {
      if ((energy__compactness > Final_energy_compactness && energy__population <= Final_energy_population) ||
          (energy__compactness >= Final_energy_compactness && energy__population < Final_energy_population) )
      { //&& accept_prob == 1.0

      //retirei accept prob
        Final_energy_compactness = energy__compactness;
        Final_energy_population = energy__population;

        if (accept_prob == 1.0) // New condition to check if score is perfect
        {
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
        best_energy_compactness = energy__compactness;
        best_energy_population = energy__population;
        fprintf(sa_graph_file, "%d,%d,%f\n", s, best_energy_compactness, accept_prob);
      }
      else
      {
        fprintf(sa_graph_file, "%d,%d,0.5\n", s, energy__compactness);
      }
      // long long tempop = 1.0 - best_energy_population;

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
        // printf("deviation: %d\n", deviation);
        if (deviation > max_deviation)
        {
          max_deviation = deviation;
        }
      }
      deviation_percentage = ((double)max_deviation / ideal_pop) * 100.0;
      fprintf(output_file, "prob: %f and random: %f\n", accept_prob, random_number);
      fprintf(output_file, "fronteiras internas: %d\n\n", best_energy_compactness);

      // fprintf(sa_graph_file, "%d,%f,%f\n", s, deviation_percentage, T);

      stored_state = storeState(clusters, k, n);
    }
    // T *= alpha;
    //  T =+ Td;
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