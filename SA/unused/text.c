#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Define a struct to represent a node in the graph
struct node {
    int voters;
    int be;
    int pcp;
    int psd;
    int ps;
};

// Define the adjacency list for the graph as an array of pointers to nodes
struct node* graph[14];

int main() {
    // Create the nodes for the graph and initialize their attributes
    struct node node_020100 = {8140, 382, 1491, 274, 1752};
    struct node node_020200 = {6240, 388, 299, 600, 1590};
    struct node node_020300 = {1903, 78, 213, 140, 372};
    struct node node_020400 = {1330, 49, 156, 80, 263};
    struct node node_020500 = {29040, 1549, 3589, 2460, 5501};
    struct node node_020600 = {6126, 365, 836, 337, 1387};
    struct node node_020700 = {3778, 141, 674, 197, 857};
    struct node node_020800 = {6542, 324, 735, 372, 1483};
    struct node node_020900 = {5998, 232, 901, 301, 1547};
    struct node node_021000 = {12258, 380, 1083, 653, 2352};
    struct node node_021100 = {19815, 1181, 1628, 1496, 4782};
    struct node node_021200 = {4324, 162, 319, 602, 1035};
    struct node node_021300 = {12745, 437, 2191, 759, 2236};
    struct node node_021400 = {4748, 165, 540, 273, 1004};
    
    // Add the nodes to the adjacency list for the graph
    graph[0] = &node_020100;
    graph[1] = &node_020200;
    graph[2] = &node_020300;
    graph[3] = &node_020400;
    graph[4] = &node_020500;
    graph[5] = &node_020600;
    graph[6] = &node_020700;
    graph[7] = &node_020800;
    graph[8] = &node_020900;
    graph[9] = &node_021000;
    graph[10] = &node_021100;
    graph[11] = &node_021200;
    graph[12] = &node_021300;
    graph[13] = &node_021400;
    
    // Test reading the graph by printing the attributes of the first node
    printf("Node 020100 has %d voters, %d votes for BE, %d votes for PCP, %d votes for PSD, %d votes for PS.\n", 
            graph[0]->voters, graph[0]->be, graph[0]->pcp, graph[0]->psd, graph[0]->ps);
    if (graph[0] == &node_020100) { // Check if node 020100 is in the adjacency list
    for (int i = 0; i < 14; i++) {
        if (graph[0] != graph[i] && graph[0]->voters > 0 && graph[i]->voters > 0) {
            if (graph[0]->be > graph[i]->be) {
                printf("Node 020100 is connected to node %d.\n", i+20100);
            }
        }
    }
}
    return 0;
}
