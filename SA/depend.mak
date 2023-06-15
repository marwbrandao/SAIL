graph.i: graph.c graph.h
state.i: state.c state.h graph.h
sa.i: sa.c ILP.h graph.h state.h sa.h timer.h
main.i: main.c graph.h sa.h state.h timer.h
ILP.i: ILP.c state.h graph.h ILP.h
timer.i: timer.c timer.h
