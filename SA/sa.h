#ifndef _SA_H
#define _SA_H
#include "graph.h"

/* In this function the probabilities are complemented.
 Meaning the cp = 1 - p, for the p described in the paper. */
double /* A temperature value from calibration */
getTemperature(double cp, /* complement probability */
               int d /* Energy delta */
               );

/* Pick a random number internally and return the
   corresponding ell. */
int
getEll(double T, /* [in] the temperature */
       unsigned int *R /* [out] the random number that was obtained */
       );

/* The temperature is updated linearly. */
/* The total amount of iterations is batch*steps */
int
runSA(double Tstart, /* [in] starting temperature */
      double Tstop, /* [in] stopping temperature */
      int batch, /* [in] number of iterations in a batch */
      int steps, /* [in] number of steps to execute */
      TU** units, int k, int n, int m
      );

#endif /* _SA_H */
