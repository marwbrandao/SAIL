#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h>

#include "state.h"
#include "graph.h"

struct Cluster;

void population_bounds(TU **units, int margin, int *lower_bound, int *upper_bound, int k, int n) {
    int population = 0;

    for (int i = 0; i < n; i++) {
        population += units[i]->voters;
    }
    //printf("%d \n", population);

    int ideal_population = population / k;
    int bound = ((ideal_population * margin)/100);

    *lower_bound = (ideal_population - bound);
    *upper_bound = (ideal_population + bound);
}


int compactness(Cluster *cluster) {
    int shared_borders = 0;
    for (int i = 0; i < cluster->size; i++) {
        TU *unit = cluster->units[i];
        //printf("shared borders = %d\n",cluster->size);
        for (int j = 0; j < unit->num_neighbors; j++) {
            for (int k = 0; k < cluster->size; k++) {
                
                if (unit->neighbor_codes[j] == cluster->units[k]->code) {
                    shared_borders += unit->border_sizes[j];
                    break;
                }
            }
        }
    }
    printf("shared borders of here = %d\n", shared_borders);
    return shared_borders;
}

int energy_population(TU **units, Cluster *cluster, int margin, int k, int n) {
    int lower_bound, upper_bound;
    population_bounds(units, margin, &lower_bound, &upper_bound, k, n);
    
    int total_difference = 0;
    
    for (int i = 0; i < k; i++) {
        int pop_cluster = 0;
        //printf("%d\n",cluster[i].size);
        for (int j = 0; j < cluster[i].size; j++) {
            pop_cluster = pop_cluster + cluster[i].units[j]->voters;
        }

        int lower_diff = abs(pop_cluster - lower_bound);
        int upper_diff = abs(pop_cluster - upper_bound);

        // Choose the minimum difference between lower and upper bound
        int min_diff = (lower_diff < upper_diff) ? lower_diff : upper_diff;
        total_difference += min_diff;
    }
    printf("-- total difference: %d\n", total_difference);
    return total_difference;
}

int energy_compactness(Cluster *clusters, int k) {
    int total_shared_borders = 0;
    
    for (int i = 0; i < k; i++) {
        total_shared_borders += compactness(&clusters[i]);
    }
    printf("shared borders = %d\n", total_shared_borders);

    return total_shared_borders;
}

int energy(TU **units, Cluster *cluster, int margin, int k, int n) {
    int lower_bound, upper_bound;
    population_bounds(units, margin, &lower_bound, &upper_bound, k, n);
    
    int total_difference = 0;
    
    for (int i = 0; i < k; i++) {
        int pop_cluster = 0;

        for (int j = 0; j < cluster[i].size; j++) {
          
            pop_cluster = pop_cluster + cluster[i].units[j]->voters;
             
        }
        int difference = abs(pop_cluster - 80306);
        total_difference += difference;
    }

    return total_difference;
}
int energy2(TU **units, Cluster *cluster, int margin, int k, int n)
{
    int population = 0;
    //int margin = 15;
    int lower_bound, upper_bound;

    
    population_bounds(units, margin, &lower_bound, &upper_bound, k, n);
    int pop_cluster = 0;

    for (int i = 0; i < k; i++)
    {
        for (int j = 0; j < cluster[i].size; j++)
        {
            pop_cluster = pop_cluster + cluster[i].units[j]->voters;
        }
        if(pop_cluster > upper_bound || pop_cluster < lower_bound)
             return 0;
        if(pop_cluster <= upper_bound && pop_cluster >= lower_bound)
             continue;

    }

    return 1;
}


int is_neighbor (TU *unit1, TU *unit2) {
    for (int i = 0; i < unit1->num_neighbors; i++){
        if (unit1->neighbor_codes[i] == unit2->code)
            return 1;
    }
    return 0;
}


Cluster** first_cluster(TU **units, int k, int n) {
    srand(time(NULL));
    Cluster *clusters = malloc(k * sizeof(Cluster));
    for (int i = 0; i < k; i++)
    {
        clusters[i].units = malloc(n * sizeof(TU *));
        clusters[i].size = 0;
    }
    int l = 0;
    int unit_num;
    
    for (int i = 0; i < k; i++) {
        //unit_num = rand() % n;
        
        do {
            unit_num = rand() % n;
            if (units[unit_num]->assigned == false) {
                units[unit_num]->assigned = true; 
                units[unit_num]->cluster_id = i;
                clusters[i].units[0] = malloc(sizeof(TU));
                clusters[i].units[0] = units[unit_num];
                clusters[i].size = 1;
                l++;
            } else{
                clusters[i].size = 0;             
            }
        } while(units[unit_num]->assigned == false || clusters[i].size == 0);
    }
    

    for (int i = k; i < n; i++) {
        unit_num = rand() % n;
        while (units[unit_num]->assigned) {
            unit_num = rand() % n;
        }
        
        units[unit_num]->assigned = true;
        int cluster_id = rand() % k;
        int j = 0;
        while (j < clusters[cluster_id].size) {
            TU *unit = clusters[cluster_id].units[j];
            if (is_neighbor(units[unit_num], unit)) {
                clusters[cluster_id].units[clusters[cluster_id].size] = units[unit_num];
                clusters[cluster_id].size++;
                units[unit_num]->cluster_id = cluster_id;
                break;
            }
            j++;
        }
        if (j == clusters[cluster_id].size) {
            units[unit_num]->assigned = false;
            i--;
        }
        //printf("cluster %d size: %d\n",cluster_id, clusters[0].units[0]->code);
    }
    //printf("state - is segging here?, %d\n", clusters[1].size);
    return clusters;
}


void change_unit_x(Cluster *clusters, TU **units, int k) {
    int cluster_idx = rand() % k;
    //printf("old size %d\n", clusters[cluster_idx].size);
    Cluster *cluster = &clusters[cluster_idx];

    //printf("cluster_idx = %d\n", cluster_idx);
    // Choose a random unit from the selected cluster
    //printf("-- New Cluster 0 = %d\n", cluster->units[0]->code);
    //printf("-- New Cluster size = %d\n", cluster->size);
    int unit_idx = rand() % cluster->size;
    //printf("unit_idx = %d\n", unit_idx);
    TU *unit = cluster->units[unit_idx];

    // Check if unit is contiguous with at least one unit in other clusters
    bool is_contiguous = false;
    int new_cluster_idx = -1;
    for (int i = 0; i < k; i++) {
        if (i == cluster_idx) {
            continue;  // Skip current cluster
        }
        Cluster *other_cluster = &clusters[i];
        for (int j = 0; j < other_cluster->size; j++) {
            TU *other_unit = other_cluster->units[j];
            if (is_neighbor(unit, other_unit)) {
                is_contiguous = true;
                new_cluster_idx = i;
                break;
            }
        }
        if (is_contiguous) {
            break;
        }
    }

    // If unit is contiguous with at least one unit in another cluster, move it there
    if (is_contiguous) {
        Cluster *new_cluster = &clusters[new_cluster_idx];
        new_cluster->units[new_cluster->size] = unit;
        new_cluster->size++;
        unit->cluster_id = new_cluster_idx;

        // Remove unit from current cluster
        for (int i = unit_idx; i < cluster->size - 1; i++) {
            cluster->units[i] = cluster->units[i+1];
        }
        cluster->size--;
    }
}


void change_unit(Cluster *clusters, TU **units, int k, int n) {
    
    int cluster_idx = rand() % k;
    Cluster *cluster = &clusters[cluster_idx];
    //printf("aaawhat cluster %d is size: %d\n", cluster_idx, cluster->size);
    // printf("cluster %d: %d\n",cluster_idx, cluster[0].units[0]->voters);
    while (cluster->size == 1) {
        
        //printf("what cluster %d is size: %d\n", cluster_idx, cluster->size);
        cluster_idx = rand() % k;
        cluster = &clusters[cluster_idx];
        //printf("new what cluster %d is size: %d\n", cluster_idx, cluster->size);
        // return;
    }

    int unit_idx = rand() % cluster->size;
    TU *unit = cluster->units[unit_idx];

    bool is_contiguous = false;
    int new_cluster_idx = -1;

    // Shuffle the neighbor units to select a random neighbor.
    int num_neighbors = unit->num_neighbors;
    int *shuffled_indices = malloc(num_neighbors * sizeof(int));
    for (int i = 0; i < num_neighbors; i++) {
        shuffled_indices[i] = i;

    }
    for (int i = num_neighbors - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        int temp = shuffled_indices[i];
        shuffled_indices[i] = shuffled_indices[j];
        shuffled_indices[j] = temp;
    }

    for (int i = 0; i < num_neighbors; i++) {
        TU *neighbor = NULL;
        for (int j = 0; j < n; j++) {
            if (units[j]->code == unit->neighbor_codes[shuffled_indices[i]]) {
                neighbor = units[j];
                break;
            }
        }
        if (!neighbor) continue;

        int other_cluster_idx = neighbor->cluster_id;
        if (other_cluster_idx != cluster_idx) {
            is_contiguous = true;
            new_cluster_idx = other_cluster_idx;
            break;
        }
    }

    free(shuffled_indices);

    if (is_contiguous) {
       Cluster *new_cluster = &clusters[new_cluster_idx];
        new_cluster->units[new_cluster->size] = unit;
        new_cluster->size++;
        unit->cluster_id = new_cluster_idx;

        // Remove unit from current cluster
        for (int i = unit_idx; i < cluster->size - 1; i++) {
            cluster->units[i] = cluster->units[i+1];
        }
        cluster->size--;
    }
    else {
        printf("is here?\n");
    }
    // printf("first unit, %d\n", cluster[0].units[0]->voters);
}


Cluster** transitionBound(int ell /* Bound */, TU **units, int k, int n, FILE *fp_out)
{
    int neighbor; //its not being used
    srand(time(NULL));
    Cluster *clusters = malloc(k * sizeof(Cluster));

    for (int i = 0; i < k; i++)
    {
        clusters[i].units = malloc(n * sizeof(TU *));
        clusters[i].size = 0;
    }
    
    clusters = first_cluster (units, k, n);
    //printf("here?!\n");
    for (int i = 0; i < k; i++)
    {
        printf("Cluster %d with size %d: ", i, clusters[i].size);
        for (int j = 0; j < clusters[i].size; j++)
        {//
            printf("%d ", clusters[i].units[j]->code);
        }
        printf("\n");
    }
    //printf("old size %d\n", clusters[1].size);
    
    for(int p = 0; p<4;p++) {
        change_unit(clusters, units, k, n);
        printf("--------------\n");
        for (int i = 0; i < k; i++)
        {
            printf("Cluster %d with size %d: ", i, clusters[i].size);
            for (int j = 0; j < clusters[i].size; j++)
            {
                printf("%d ", clusters[i].units[j]->code);
            }
            printf("\n");
        }
    }
    
    //printf("old size %d\n", clusters[1].size);
    
    for (int i = 0; i < k; i++)
    {
        //printf("i = %d\n", i);
        fprintf(fp_out, "Cluster %d with size %d: ", i, clusters[i].size);
            for (int j = 0; j < clusters[i].size; j++)
            {
                //printf("j = %d\n", j);
                fprintf(fp_out, "%d ", clusters[i].units[j]->code);
            }
            fprintf(fp_out, "\n");
    }          
    
    fclose(fp_out);
    return clusters;    
}

Cluster** storeState(Cluster *clusters, int k, int n)
{
    Cluster *stored_state = malloc(k * sizeof(Cluster));
    for (int i = 0; i < k; i++)
    {
        stored_state[i].units = malloc(n * sizeof(TU *));
        stored_state[i].size = 0;
        for (int j = 0; j < clusters[i].size; j++) {
            stored_state[i].units[j] = clusters[i].units[j];
        }

    }
    return stored_state;
}



Cluster** transitionBound_old_random_clusters(int ell /* Bound */, TU **units, int k, int n)
{

    Cluster *clusters = malloc(k * sizeof(Cluster));

    for (int i = 0; i < k; i++)
    {
        clusters[i].units = malloc(n * sizeof(TU *));
        clusters[i].size = 0;
    }

    // Randomly assign units to the clusters
    for (int i = 0; i < n; i++)
    {
        int cluster_index = rand() % k; // Randomly select a cluster

        Cluster *cluster = &clusters[cluster_index]; // Get a pointer to the selected cluster

        // Check if the unit has already been assigned to a cluster
        int assigned = 0;

        //int has_neighbor_in_cluster = 0;
        for (int j = 0; j < i; j++)
        {
            if (units[i] == cluster->units[j])
            {
                assigned = 1;
                cluster->units[cluster->size] = units[i];
                cluster->size++;

                break;
            }
        }

        // If the unit has not already been assigned, add it to the cluster
        if (assigned == 0)
        {

            cluster->units[cluster->size] = units[i];
            assigned = 1;
            cluster->size++;
        }
        if (assigned == 1)
        {
            continue;
        }
        // Otherwise, try again with a different cluster
        else
        {
            i--;
        }
    }

    //printf("-----------------\n");
    for (int i = 0; i < k; i++)
    {
        //printf("Cluster %d: ", i);
        for (int j = 0; j < clusters[i].size; j++)
        {
            //printf("%d ", clusters[i].units[j]->code);
        }
        //printf("\n");
    }
    
    return clusters;
}