#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//#include <SE3StateSpace.h>

//#include "linkCutTree.h"
#include "graph.h"
#include "sa.h"
#include "state.h"
#include "timer.h"
//#include "state.h"

int
main(int argc,
     char **argv
     )
{
  double cp_start = 0.09;
  int d_start = -1;
  double cp_end = 0.01;
  int d_end = -1;
  int bp = 1; /* Batch size power of 2   4 */
  int sp = 1; /* Number of steps power of 2   10*/

  startTimer();

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wimplicit-fallthrough"
    switch(argc){
    case 8:
      sscanf(argv[7], "%d", &d_end);
    case 7:
      sscanf(argv[6], "%lf", &cp_end);
    case 6:
      sscanf(argv[5], "%d", &d_start);
    case 5:
      sscanf(argv[4], "%lf", &cp_start);
    case 4:
      sscanf(argv[3], "%d", &bp);
    case 3:
      sscanf(argv[2], "%d", &sp);
    }
#pragma GCC diagnostic pop  
    int d, k, n, m;
    char* filename = argv[1];
    TU** units = malloc(n * sizeof(TU*)); 

    units = graph(filename, &d, &k, &n, &m);

    int populacao_ideal = _pop_ideal(d);

    
    printf("SA(sp=%d) and pop: %d\n", 1<<sp, populacao_ideal);

    runSA(
	  getTemperature(cp_start, d_start),
	  getTemperature(cp_end, d_end),
	  1<<bp, /* Batch size */
	  1<<sp /* Number of steps */, units, k, n, m, populacao_ideal
    
	  );

    // runSA(
	  // getTemperature(cp_start, d_start),
	  // getTemperature(cp_end, d_end),
    // getTemperature(cp_start, d_start),
	  // getTemperature(cp_end, d_end),
	  // 1<<bp, /* Batch size */
	  // 1<<sp /* Number of steps */, units, k, n, m
    
	  // );
  free(units);

  return 0;
} 
