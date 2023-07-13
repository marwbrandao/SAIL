#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h>
#include <limits.h>
#include <float.h>


#include "state.h"
#include "graph.h"


struct Cluster;
int _pop_ideal(int d) {
    switch (d)
    {
    case 1:
        return 80707;
        break;
    case 2:
        return 61494;
        break;
    case 3:
        return 77817;
        break;
    case 4:
        return 70771;
        break;
    case 5:
        return 85038;
        break;
    case 6:
        return 76019;
        break;
    case 7:
        return 68348;
        break;
    case 8:
        return 75360;
        break;
    case 9:
        return 75768;
        break;
    case 10:
        return 83049;
        break;
    case 11:
        return 80044;
        break;
    case 12:
        return 96391;
        break;
    case 13:
        return 79739;
        break;
    case 14:
        return 76178;
        break;
    case 15:
        return 81908;
        break;
    case 16:
        return 80306;
        break;
    case 17:
        return 73029;
        break;
    case 18:
        return 86991;
        break;    
    default:
        break;
    }
}

void popul_test1(TU **units, int n, int k, int ideal_pop) {
    int pop=0;
    for(int i = 0; i < n; i++) {
        pop += units[i]->voters;
    }
    printf("populacao total: %d\n", pop);
    pop = pop/k;
    printf("populacao ideal deste dist: %d\n", pop);

    int lower_marg = ideal_pop*.85;
    int upper_marg = ideal_pop*1.15;

    printf("populacao ideal do tiago: %d com margens de %d e %d\n", ideal_pop, lower_marg, upper_marg);
    
}

void population_bounds(TU **units, int margin, int *lower_bound, int *upper_bound, int k, int n, int ideal_population) {
    int bound = ((ideal_population * margin)/100);

    *lower_bound = (ideal_population - bound);
    *upper_bound = (ideal_population + bound);
}


int compactness(Cluster *cluster) {
    int shared_borders = 0;
    for (int i = 0; i < cluster->size; i++) {
        TU *unit = cluster->units[i];
        for (int j = 0; j < unit->num_neighbors; j++) {
            for (int k = 0; k < cluster->size; k++) {
                if (unit->neighbor_codes[j] == cluster->units[k]->code) {
               
                    if (unit->code < unit->neighbor_codes[j]) {
                        shared_borders += unit->border_sizes[j];
                    }
                    break;
                }
            }
        }
    }
    return shared_borders;
}

// dif entre as frnteiras de populaçao
int energy_population(TU **units, Cluster *cluster, int margin, int k, int n, int ideal_population) {
    int lower_bound, upper_bound;
    population_bounds(units, margin, &lower_bound, &upper_bound, k, n, ideal_population);
    //printf ("lower and upper = [%d, %d]\n", lower_bound, upper_bound);
    int total_difference = 0;
    int min_diff = 0;
    //printf("1-- total difference: %d\n", total_difference);
    for (int i = 0; i < k; i++) {
        int pop_cluster = 0;
        //printf("%d\n",cluster[i].size);
        for (int j = 0; j < cluster[i].size; j++) {
            pop_cluster = pop_cluster + cluster[i].units[j]->voters;
        }
        if (pop_cluster > lower_bound && pop_cluster < upper_bound){
            //min_diff = 0;
            continue;
        }
        //
        int lower_diff = abs(pop_cluster - lower_bound);
        int upper_diff = abs(pop_cluster - upper_bound);

        min_diff = (lower_diff < upper_diff) ? lower_diff : upper_diff;
        //printf("min diff = %d and population = %d\n", min_diff, pop_cluster);
        total_difference += (min_diff);
        //printf("2-- total difference: %d\n", total_difference);
    }
  
    return total_difference;
} //


int energy_compactness(Cluster *clusters, int k) {
    int total_shared_borders = 0;
    
    for (int i = 0; i < k; i++) {
        //printf("cluster %d\n", i);
        total_shared_borders += compactness(&clusters[i]);
    }
    //rintf("shared borders = %d\n", total_shared_borders);

    return total_shared_borders;
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

    }

    return clusters;
}


void reset_visited(Cluster *cluster) {
    for (int i = 0; i < cluster->size; i++) {
        cluster->units[i]->visited = 0;
    }
}

int has_neighbor_in_cluster(TU *unit, Cluster *cluster) {
    for (int i = 0; i < unit->num_neighbors; i++) {
        for (int j = 0; j < cluster->size; j++) {
            if (unit->neighbor_codes[i] == cluster->units[j]->code) {
                return 1;
            }
        }
    }
    return 0;
}

void dfs_check_neighbors(int unit_index, Cluster *cluster, int *visited) {
    TU *unit = cluster->units[unit_index];
    visited[unit_index] = 1;
    for (int i = 0; i < unit->num_neighbors; i++) {
        TU *neighbor = NULL;
        int neighbor_index = -1;
        for (int j = 0; j < cluster->size; j++) {
            if (cluster->units[j]->code == unit->neighbor_codes[i]) {
                neighbor = cluster->units[j];
                neighbor_index = j;
                break;
            }
        }
        if (neighbor && !visited[neighbor_index]) {
            dfs_check_neighbors(neighbor_index, cluster, visited);
        }
    }
}


void dfs_contiguity_check(int unit_index, Cluster *cluster, int *visited) {
    TU *unit = cluster->units[unit_index];
    visited[unit_index] = 1;
     //printf("Visiting unit %d (index: %d)\n", unit->code, unit_index);
    for (int i = 0; i < unit->num_neighbors; i++) {
        int neighbor_index = -1;
        for (int j = 0; j < cluster->size; j++) {
            if (cluster->units[j]->code == unit->neighbor_codes[i]) {
                neighbor_index = j;
                break;
            }
        }

        if (neighbor_index != -1 && !visited[neighbor_index]) {
            dfs_contiguity_check(neighbor_index, cluster, visited);
        }
    }
}

int are_neighbors_contiguous(TU *unit, Cluster *cluster) {
    int *visited = calloc(cluster->size, sizeof(int));
    int num_visited = 0;

    // Find the index of the unit in the cluster
    int unit_index = -1;
    for (int i = 0; i < cluster->size; i++) {
        if (cluster->units[i]->code == unit->code) {
            unit_index = i;
            break;
        }
    }

    // Choose another unit in the cluster as the starting point for DFS
    int start_index = (unit_index + 1) % cluster->size;
    //printf("Starting DFS from unit %d (index: %d)\n", cluster->units[start_index]->code, start_index);
    // Run DFS starting from the chosen unit
    dfs_contiguity_check(start_index, cluster, visited);

    // Count the number of visited units in the cluster
    for (int i = 0; i < cluster->size; i++) {
        if (visited[i]) {
            num_visited++;
        }
    }
    //printf("Number of visited units: %d\n", num_visited);
    //free(visited);
    return num_visited == cluster->size - 1;
}


void dfs_contiguity_exclude(int index, int exclude_index, Cluster *cluster, int *visited) {
    visited[index] = 1;

    for (int i = 0; i < cluster->size; i++) {
        if (i != exclude_index && !visited[i] && is_neighbor(cluster->units[index], cluster->units[i]) == 1)  {
            dfs_contiguity_exclude(i, exclude_index, cluster, visited);
        }
    }
}

int are_remaining_units_contiguous(Cluster *cluster, int exclude_index) {
    if (cluster->size <= 1 || cluster->size > INT_MAX / sizeof(int)) {
        return 0;
    }
    int *visited = calloc(cluster->size, sizeof(int));
    int num_visited = 0;

    // Find the starting index for DFS, skipping the exclude_index
    int start_index = (exclude_index == 0) ? 1 : 0;

    // Run DFS starting from the first unit in the cluster, excluding the unit with exclude_index
    dfs_contiguity_exclude(start_index, exclude_index, cluster, visited);

    // Count the number of visited units in the cluster, excluding the unit with exclude_index
    for (int i = 0; i < cluster->size; i++) {
        if (i != exclude_index && visited[i]) {
            num_visited++;
        }
    }

    // free(visited);
    return num_visited == cluster->size - 1;
}


int contains(int *array, int size, int value) {
    for (int i = 0; i < size; i++) {
        if (array[i] == value) {
            return 1;
        }
    }
    return 0;
}


void change_unit(Cluster *clusters, TU **units, int k, int n) {
    int total_population = 0;
    for (int i = 0; i < k; i++) {
        total_population += clusters[i].size;
    }

    int random_population = rand() % total_population;
    int cluster_idx = 0;

    for (int i = 0; i < k; i++) {
        random_population -= clusters[i].size;
        if (random_population <= 0) {
            cluster_idx = i;
            break;
        }
    }
    // int cluster_idx = rand() % k;

    Cluster *cluster = &clusters[cluster_idx];

    // If the cluster has only one unit, keep searching for another cluster
    while (cluster->size == 1) {
        cluster_idx = rand() % k;
        cluster = &clusters[cluster_idx];
    }

    // Find border units and their neighboring clusters
    // printf("here?");
        // Calculate the average population
    int avg_population = total_population / k;

    // Find border units and their neighboring clusters
    int *border_units = malloc(cluster->size * sizeof(int));
    int num_border_units = 0;
    double min_diff = DBL_MAX;
    int best_unit_idx = -1;

    for (int i = 0; i < cluster->size; i++) {
        TU *current_unit = cluster->units[i];
        for (int j = 0; j < current_unit->num_neighbors; j++) {
            TU *neighbor = NULL;
            for (int k = 0; k < n; k++) {
                if (units[k]->code == current_unit->neighbor_codes[j]) {
                    neighbor = units[k];
                    break;
                }
            }
            if (!neighbor) continue;

            if (neighbor->cluster_id != cluster_idx) {
                border_units[num_border_units++] = i;
                
                // Calculate the difference between the average population and the cluster's population after removing this unit
                double diff = abs((cluster->population - current_unit->voters) - avg_population);
                if (diff < min_diff) {
                    min_diff = diff;
                    best_unit_idx = i;
                }
                break;
            }
        }
    }

    double best_probability = 0.5; // You can adjust this value based on your needs
    double random_value_p = (double)rand() / (double)RAND_MAX;
    int selected_unit_idx;

    if(random_value_p <= best_probability) {
        // With 80% chance select the best unit
        selected_unit_idx = best_unit_idx;
    } else {
        // With 20% chance select a random border unit
        selected_unit_idx = border_units[rand() % num_border_units];
    }

    // The selected unit is the one that minimizes the difference
    //int selected_unit_idx = best_unit_idx;
    TU *selected_unit = cluster->units[selected_unit_idx];


    // int selected_unit_idx = -1;
    // TU *selected_unit = NULL;
    while (selected_unit_idx == -1) {
        int unit_idx = border_units[rand() % num_border_units];
        TU *unit = cluster->units[unit_idx];
        reset_visited(cluster);

        // Check if the remaining units in the current cluster are contiguous without the unit being moved
        if (are_remaining_units_contiguous(cluster, unit_idx)) {
            selected_unit_idx = unit_idx;
            selected_unit = unit;
        }
    }


     int neighboring_cluster_idx;
    // TU *neighboring_cluster_unit = NULL;
    // while (!neighboring_cluster_unit) {
    //     neighboring_cluster_idx = rand() % k;
    //     if (neighboring_cluster_idx != cluster_idx) {
    //         for (int i = 0; i < selected_unit->num_neighbors; i++) {
    //             int neighbor_code = selected_unit->neighbor_codes[i];
    //             for (int j = 0; j < n; j++) {
    //                 if (units[j]->code == neighbor_code && units[j]->cluster_id == neighboring_cluster_idx) {
    //                     neighboring_cluster_unit = units[j];
    //                     break;
    //                 }
    //             }
    //             if (neighboring_cluster_unit) break;
    //         }
    //     }
    // }

     int *neighboring_clusters = malloc(k * sizeof(int));
    int *neighboring_cluster_populations = malloc(k * sizeof(int));
    int num_neighboring_clusters = 0;



    for (int i = 0; i < selected_unit->num_neighbors; i++) {
        int neighbor_code = selected_unit->neighbor_codes[i];
        for (int j = 0; j < n; j++) {
            if (units[j]->code == neighbor_code) {
                int neighbor_cluster_id = units[j]->cluster_id;
                if (neighbor_cluster_id != cluster_idx && !contains(neighboring_clusters, num_neighboring_clusters, neighbor_cluster_id)) {
                    neighboring_clusters[num_neighboring_clusters] = neighbor_cluster_id;
                    neighboring_cluster_populations[num_neighboring_clusters] = clusters[neighbor_cluster_id].size;
                    num_neighboring_clusters++;
                }
                break;
            }
        }
    }

    // Calculate probabilities for each neighboring cluster based on their population
    double *probabilities = malloc(num_neighboring_clusters * sizeof(double));
    double sum_inverse_populations = 0;

    for (int i = 0; i < num_neighboring_clusters; i++) {
        sum_inverse_populations += 1.0 / neighboring_cluster_populations[i];
    }

    for (int i = 0; i < num_neighboring_clusters; i++) {
        probabilities[i] = (1.0 / neighboring_cluster_populations[i]) / sum_inverse_populations;
    }

    // Use the roulette wheel selection to choose a neighboring cluster index
    double random_value = (double)rand() / (double)RAND_MAX;
    double cumulative_probability = 0.0;
    int selected_neighboring_cluster_idx = 0;

    for (int i = 0; i < num_neighboring_clusters; i++) {
        cumulative_probability += probabilities[i];
        if (random_value <= cumulative_probability) {
            selected_neighboring_cluster_idx = i;
            break;
        }
    }

    // Update the neighboring_cluster_idx variable
    neighboring_cluster_idx = neighboring_clusters[selected_neighboring_cluster_idx];


    // Move the border unit to the randomly selected neighboring cluster
    Cluster *new_cluster = &clusters[neighboring_cluster_idx];
    new_cluster->units[new_cluster->size] = selected_unit;
    new_cluster->size++;
    selected_unit->cluster_id = neighboring_cluster_idx;

    // Remove unit from the current cluster
    for (int i = selected_unit_idx; i < cluster->size - 1; i++) {
        cluster->units[i] = cluster->units[i + 1];
    }
    cluster->size--;

    //free(border_units);
}



int is_contiguous_after_removal(Cluster *cluster, TU *unit_to_remove) {
    if (cluster->size <= 1) {
        return 0;
    }

    // Remove the unit from the cluster temporarily.
    int unit_idx = -1;
    for (int i = 0; i < cluster->size; i++) {
        if (cluster->units[i] == unit_to_remove) {
            unit_idx = i;
            break;
        }
    }
    if (unit_idx == -1) {
        return 0;
    }
    cluster->units[unit_idx] = NULL;

    // Perform DFS to check contiguity.
    TU *start_unit = NULL;
    for (int i = 0; i < cluster->size; i++) {
        if (cluster->units[i] != NULL) {
            start_unit = cluster->units[i];
            break;
        }
    }
    if (!start_unit) {
        return 0;
    }

    bool *visited = calloc(cluster->size, sizeof(bool));
    // DFS(start_unit, cluster, visited);

    // Check if all units in the cluster were visited.
    bool all_visited = true;
    for (int i = 0; i < cluster->size; i++) {
        if (cluster->units[i] != NULL && !visited[i]) {
            all_visited = 0;
            break;
        }
    }

    // Restore the removed unit.
    cluster->units[unit_idx] = unit_to_remove;

    free(visited);

    return all_visited;
}

void DFS(TU *unit, Cluster *cluster, bool *visited) {
    for (int i = 0; i < cluster->size; i++) {
        if (cluster->units[i] == unit) {
            visited[i] = true;
            break;
        }
    }

    for (int i = 0; i < unit->num_neighbors; i++) {
        TU *neighbor = NULL;
        for (int j = 0; j < cluster->size; j++) {
            if (cluster->units[j] && cluster->units[j]->code == unit->neighbor_codes[i]) {
                neighbor = cluster->units[j];
                break;
            }
        }

        if (neighbor) {
            int neighbor_idx = -1;
            for (int j = 0; j < cluster->size; j++) {
                if (cluster->units[j] == neighbor) {
                    neighbor_idx = j;
                    break;
                }
            }

            if (neighbor_idx != -1 && !visited[neighbor_idx]) {
                DFS(neighbor, cluster, visited);
            }
        }
    }
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

