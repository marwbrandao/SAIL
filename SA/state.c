#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <limits.h>
#include <float.h>

#include "state.h"
#include "graph.h"

struct Cluster;
int _pop_ideal(int d)
{
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

void create_code_index1(TU **units, int n)
{
    for (int i = 0; i < n; i++)
    {
        // code_index_mappings[i].code = units[i]->code;
        units[i]->unit_id = i;
    }
}

int find_id_by_code1(TU **units, int n, int code)
{
    for (int i = 0; i < n; i++)
    {
        if (units[i]->code == code)
        {
            return i;
        }
    }

    // Return -1 if no unit with the given code is found
    return -1;
}

void create_neighbor_index1(TU **units, int n)
{
    for (int i = 0; i < n; i++)
    {
        int num_neighbors = units[i]->num_neighbors;
        units[i]->neighbor_ids = (int *)malloc(num_neighbors * sizeof(int));

        for (int j = 0; j < num_neighbors; j++)
        {
            int neighbor_code = units[i]->neighbor_codes[j];
            // printf("here\n");
            units[i]->neighbor_ids[j] = find_id_by_code(units, n, neighbor_code);
        }
    }
}

void popul_test1(TU **units, int n, int k, int ideal_pop)
{
    int pop = 0;
    for (int i = 0; i < n; i++)
    {
        pop += units[i]->voters;
    }
    printf("populacao total: %d\n", pop);
    pop = pop / k;
    printf("populacao ideal deste dist: %d\n", pop);

    int lower_marg = ideal_pop * .85;
    int upper_marg = ideal_pop * 1.15;

    printf("populacao ideal do tiago: %d com margens de %d e %d\n", ideal_pop, lower_marg, upper_marg);
}

void population_bounds(TU **units, int margin, int *lower_bound, int *upper_bound, int k, int n, int ideal_population)
{
    int bound = ((ideal_population * margin) / 100);

    *lower_bound = (ideal_population - bound);
    *upper_bound = (ideal_population + bound);
}

int compactness(Cluster *cluster)
{
    int shared_borders = 0;
    for (int i = 0; i < cluster->size; i++)
    {
        TU *unit = cluster->units[i];
        for (int j = 0; j < unit->num_neighbors; j++)
        {
            for (int k = 0; k < cluster->size; k++)
            {
                if (unit->neighbor_codes[j] == cluster->units[k]->code)
                {

                    if (unit->code < unit->neighbor_codes[j])
                    {
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
int energy_population(TU **units, Cluster *cluster, int margin, int k, int n, int ideal_population)
{
    int lower_bound, upper_bound;
    population_bounds(units, margin, &lower_bound, &upper_bound, k, n, ideal_population);
    // printf ("lower and upper = [%d, %d]\n", lower_bound, upper_bound);
    int total_difference = 0;
    int min_diff = 0;
    // printf("1-- total difference: %d\n", total_difference);
    for (int i = 0; i < k; i++)
    {
        int pop_cluster = 0;
        // printf("%d\n",cluster[i].size);
        for (int j = 0; j < cluster[i].size; j++)
        {
            pop_cluster = pop_cluster + cluster[i].units[j]->voters;
        }
        if (pop_cluster > lower_bound && pop_cluster < upper_bound)
        {
            // min_diff = 0;
            continue;
        }
        //
        int lower_diff = abs(pop_cluster - lower_bound);
        int upper_diff = abs(pop_cluster - upper_bound);

        min_diff = (lower_diff < upper_diff) ? lower_diff : upper_diff;
        // printf("min diff = %d and population = %d\n", min_diff, pop_cluster);
        total_difference += (min_diff);
        // printf("2-- total difference: %d\n", total_difference);
    }

    return total_difference;
} //

int energy_compactness(Cluster *clusters, int k)
{
    int total_shared_borders = 0;

    for (int i = 0; i < k; i++)
    {
        // printf("cluster %d\n", i);
        total_shared_borders += compactness(&clusters[i]);
    }
    // rintf("shared borders = %d\n", total_shared_borders);

    return total_shared_borders;
}

int is_neighbor(TU *unit1, TU *unit2)
{
    for (int i = 0; i < unit1->num_neighbors; i++)
    {
        //printf("Checking %d if unit %d is neighbor with unit %d\n", unit1->code, unit1->neighbor_codes[i], unit2->code);
        if (unit1->neighbor_codes[i] == unit2->code)
        {
            //printf("Unit %d is a neighbor of unit %d\n", unit2->code, unit1->code); // add debug print
            return 1;
        }
    }
    return 0;
}

void calculate_population(Cluster *cluster)
{
    cluster->population = 0;
    for (int i = 0; i < cluster->size; i++)
    {
        cluster->population += cluster->units[i]->voters;
    }
    printf("cluster population: %d\n", cluster->population);
}

void calculate_border_units(TU **units, Cluster *cluster, int n)
{
    cluster->border_units = malloc(n * sizeof(int));
    cluster->num_border_units = 0;
    printf("1cluster border units: %d\n", cluster->num_border_units);
    for (int i = 0; i < cluster->size; i++)
    {
        TU *unit = cluster->units[i];
        printf("2cluster border units: %d\n", cluster->num_border_units);
        for (int j = 0; j < unit->num_neighbors; j++)
        {
            printf("3cluster border units: %d, %d\n", cluster->num_border_units, unit->neighbor_codes[j]);
            TU *neighbor = malloc(n * sizeof(Cluster));
            neighbor = units[unit->neighbor_codes[j]];
            printf("4cluster border units: %d\n", cluster->num_border_units);
            if (neighbor->cluster_id != cluster->id)
            {
                printf("5cluster border units: %d\n", cluster->num_border_units);
                cluster->border_units[cluster->num_border_units] = unit->unit_id;
                printf("6cluster border units: %d\n", cluster->num_border_units);
                cluster->num_border_units++;
                printf("7cluster border units: %d\n", cluster->num_border_units);
                break;
            }
        }
    }
    printf("cluster border units: %d\n", cluster->num_border_units);
}

Cluster **first_cluster(TU **units, int k, int n)
{
    srand(time(NULL));
    Cluster *clusters = malloc(k * sizeof(Cluster));
    create_code_index1(units, n);
    for (int i = 0; i < k; i++)
    {
        clusters[i].units = malloc(n * sizeof(TU *));
        clusters[i].size = 0;
    }
    int l = 0;
    int unit_num;

    for (int i = 0; i < k; i++)
    {
        // unit_num = rand() % n;

        do
        {
            unit_num = rand() % n;
            if (units[unit_num]->assigned == false)
            {
                units[unit_num]->assigned = true;
                units[unit_num]->cluster_id = i;
                clusters[i].units[0] = malloc(sizeof(TU));
                clusters[i].units[0] = units[unit_num];
                clusters[i].size = 1;
                clusters[i].id = i;
                l++;
            }
            else
            {
                clusters[i].size = 0;
            }
        } while (units[unit_num]->assigned == false || clusters[i].size == 0);
    }

    for (int i = k; i < n; i++)
    {
        unit_num = rand() % n;
        while (units[unit_num]->assigned)
        {
            unit_num = rand() % n;
        }

        units[unit_num]->assigned = true;
        int cluster_id = rand() % k;
        int j = 0;
        while (j < clusters[cluster_id].size)
        {
            TU *unit = clusters[cluster_id].units[j];
            if (is_neighbor(units[unit_num], unit))
            {
                clusters[cluster_id].units[clusters[cluster_id].size] = units[unit_num];
                clusters[cluster_id].size++;
                units[unit_num]->cluster_id = cluster_id;
                break;
            }
            j++;
        }
        if (j == clusters[cluster_id].size)
        {
            units[unit_num]->assigned = false;
            i--;
        }
    }
    for (int i = 0; i < k; i++)
    {

        calculate_population(&clusters[i]);
        // calculate_border_units(units, &clusters[i], n);
    }

    create_neighbor_index1(units, n);
    printf("unit %d\n", units[1]->num_neighbors);
    return clusters;
}

void reset_visited(Cluster *cluster)
{
    for (int i = 0; i < cluster->size; i++)
    {
        cluster->units[i]->visited = 0;
    }
}

int has_neighbor_in_cluster(TU *unit, Cluster *cluster)
{
    for (int i = 0; i < unit->num_neighbors; i++)
    {
        for (int j = 0; j < cluster->size; j++)
        {
            if (unit->neighbor_codes[i] == cluster->units[j]->code)
            {
                return 1;
            }
        }
    }
    return 0;
}

void dfs_check_neighbors(int unit_index, Cluster *cluster, int *visited)
{
    TU *unit = cluster->units[unit_index];
    visited[unit_index] = 1;
    for (int i = 0; i < unit->num_neighbors; i++)
    {
        TU *neighbor = NULL;
        int neighbor_index = -1;
        for (int j = 0; j < cluster->size; j++)
        {
            if (cluster->units[j]->code == unit->neighbor_codes[i])
            {
                neighbor = cluster->units[j];
                neighbor_index = j;
                break;
            }
        }
        if (neighbor && !visited[neighbor_index])
        {
            dfs_check_neighbors(neighbor_index, cluster, visited);
        }
    }
}

void dfs_contiguity_check(int unit_index, Cluster *cluster, int *visited)
{
    printf("AHm\n");
    TU *unit = cluster->units[unit_index];
    visited[unit_index] = 1;
    // printf("Visiting unit %d (index: %d)\n", unit->code, unit_index);d
    for (int i = 0; i < unit->num_neighbors; i++)
    {
        int neighbor_index = -1;
        for (int j = 0; j < cluster->size; j++)
        {
            if (cluster->units[j]->code == unit->neighbor_codes[i])
            {
                neighbor_index = j;
                break;
            }
        }

        if (neighbor_index != -1 && !visited[neighbor_index])
        {
            dfs_contiguity_check(neighbor_index, cluster, visited);
        }
    }
}

int are_neighbors_contiguous(TU *unit, Cluster *cluster)
{
    int *visited = calloc(cluster->size, sizeof(int));
    int num_visited = 0;

    // Find the index of the unit in the cluster
    int unit_index = -1;
    for (int i = 0; i < cluster->size; i++)
    {
        if (cluster->units[i]->code == unit->code)
        {
            unit_index = i;
            break;
        }
    }

    // Choose another unit in the cluster as the starting point for DFS
    int start_index = (unit_index + 1) % cluster->size;
    printf("Starting DFS from unit %d (index: %d)\n", cluster->units[start_index]->code, start_index);
    //  Run DFS starting from the chosen unit

    dfs_contiguity_check(start_index, cluster, visited);

    // Count the number of visited units in the cluster
    for (int i = 0; i < cluster->size; i++)
    {
        if (visited[i])
        {
            num_visited++;
        }
    }
    // printf("Number of visited units: %d\n", num_visited);
    // free(visited);
    return num_visited == cluster->size - 1;
}

void dfs_contiguity_exclude(int index, int exclude_index, Cluster *cluster, int *visited)
{
    visited[index] = 1;
    //printf("first Visited unit: %d\n", cluster->units[index]->code); // add debug print

    if (cluster->size - 1 == 1)
    {
        //printf("Only one unit remaining. It's technically contiguous (to itself).\n");
        return;
    }

    for (int i = 0; i < cluster->size; i++)
    {
        // printf("unit %d checking to see if its differernt that %d\n", cluster->units[index]->code, cluster->units[i]->code);
        if (cluster->units[i]->unit_id != exclude_index && !visited[i] && is_neighbor(cluster->units[index], cluster->units[i]) == 1)
        {
            dfs_contiguity_exclude(i, exclude_index, cluster, visited);
        }
    }
}

int are_remaining_units_contiguous(Cluster *cluster, int exclude_index)
{

    //printf("\nChecking contiguity of cluster %d. Excluding unit: %d\n", cluster->id, exclude_index);
    //printf("cluster size: %d\n", cluster->size);
    if (cluster->size < 1 || cluster->size > INT_MAX / sizeof(int))
    {
        //printf("Invalid cluster size. Returning...\n");
        return 0;
    }
    int *visited = calloc(cluster->size, sizeof(int));
    int num_visited = 0;

    // Find the starting index for DFS, skipping the exclude_index
    int start_index = (exclude_index == 0) ? 1 : 0;

    //printf("Starting DFS from index: %d\n", start_index);

    // Run DFS starting from the first unit in the cluster, excluding the unit with exclude_index
    dfs_contiguity_exclude(start_index, exclude_index, cluster, visited);

    // Count the number of visited units in the cluster, excluding the unit with exclude_index
    for (int i = 0; i < cluster->size; i++)
    {
        // printf("visited %d\n", visited[i]);
        if (cluster->units[i]->unit_id != exclude_index && visited[i])
        {
            //return 0;
            num_visited++;
            // printf("-Visited unit: %d\n", cluster->units[i]->code);
        }
        
    }

     //printf("Number of visited units: %d\n", num_visited);
     //printf("Expected number of visited units: %d\n", cluster->size - 1);

    free(visited);
    return num_visited == cluster->size ;
}

int contains(int *array, int size, int value)
{
    for (int i = 0; i < size; i++)
    {
        if (array[i] == value)
        {
            return 1;
        }
    }
    return 0;
}

double population_difference(Cluster *cluster, int ideal_population)
{
    return fabs(cluster->population - ideal_population);
}

int get_cluster_with_largest_deviation(Cluster *clusters, int k, int ideal_population)
{
    double largest_deviation = 0;
    int cluster_index = -1;
    for (int i = 0; i < k; i++)
    {
        double deviation = population_difference(&clusters[i], ideal_population);
        if (deviation > largest_deviation)
        {
            largest_deviation = deviation;
            cluster_index = i;
        }
    }
    return cluster_index;
}

int get_smallest_neighbour_cluster(Cluster *clusters, int k, TU *unit, int current_cluster_index)
{
    int min_population = INT_MAX;
    int min_cluster_index = -1;
    // printf("ayo  %d\n", unit->num_neighbors);
    for (int i = 0; i < unit->num_neighbors; i++)
    {
        // printf("ayo1\n");
        int neighbor_cluster_id = unit->neighbor_ids[i];
        // printf("ayo12\n");
        if (neighbor_cluster_id != current_cluster_index && clusters[neighbor_cluster_id].population < min_population)
        {
            // printf("ayo2\n");
            min_population = clusters[neighbor_cluster_id].population;
            min_cluster_index = neighbor_cluster_id;
        }
    }
    printf("Smallest Neighbor Cluster Index: %d\n", min_cluster_index);
    return min_cluster_index;
}

int get_largest_neighbour_cluster(Cluster *clusters, int k, TU *unit, int current_cluster_index)
{
    int max_population = INT_MIN;
    int max_cluster_index = -1;
    for (int i = 0; i < unit->num_neighbors; i++)
    {
        int neighbor_cluster_id = unit->neighbor_ids[i];
        if (neighbor_cluster_id != current_cluster_index && clusters[neighbor_cluster_id].population > max_population)
        {
            max_population = clusters[neighbor_cluster_id].population;
            max_cluster_index = neighbor_cluster_id;
        }
    }
    printf("Biggest Neighbor Cluster Index: %d\n", max_cluster_index);
    return max_cluster_index;
}

// Helper function to get cluster sizes
int *get_cluster_sizes(Cluster *clusters, int num_clusters)
{
    int *cluster_sizes = malloc(num_clusters * sizeof(int));
    for (int i = 0; i < num_clusters; i++)
    {
        cluster_sizes[i] = clusters[i].size;
    }
    return cluster_sizes;
}

// Helper function to calculate deviations from ideal_population
double *calculate_deviations(int *cluster_sizes, int num_clusters, int ideal_population)
{
    double *deviations = malloc(num_clusters * sizeof(double));
    for (int i = 0; i < num_clusters; i++)
    {
        deviations[i] = abs(cluster_sizes[i] - ideal_population);
    }
    return deviations;
}

// create_code_index(units, n);
// create_neighbor_index(units, n);
// void move_unit(Cluster *from_cluster, Cluster *to_cluster, int unit_idx) {
//     if (unit_idx >= from_cluster->size) {
//         fprintf(stderr, "Unit index out of bounds.\n");
//         return;
//     }
//     printf("unit_idx: %d\n", unit_idx);
//     TU *unit = from_cluster->units[unit_idx];
//     printf("from_cluster size: %d\n", from_cluster->size);
//     printf("1Unit %d moved from Cluster %d to Cluster %d\n", unit->unit_id, from_cluster->id, to_cluster->id);

//     // Add the unit to the destination cluster
//     to_cluster->units = realloc(to_cluster->units, (to_cluster->size + 1) * sizeof(TU *));
//     printf("21Unit %d moved from Cluster %d to Cluster %d\n", unit->unit_id, from_cluster->id, to_cluster->id);
//     if (!to_cluster->units) {
//         fprintf(stderr, "Failed to allocate memory for units in cluster.\n");
//         return;
//     }
//     to_cluster->units[to_cluster->size] = unit;
//     printf("22Unit %d moved from Cluster %d to Cluster %d\n", unit->unit_id, from_cluster->id, to_cluster->id);
//     printf("23Unit %d moved from Cluster %d to Cluster %d\n", unit->unit_id, from_cluster->id, to_cluster->id);
//     to_cluster->size++;
//     printf("2Unit %d moved from Cluster %d to Cluster %d\n", unit->unit_id, from_cluster->id, to_cluster->id);

//     // Remove the unit from the source cluster by moving the last unit in the array to its place
//     from_cluster->units[unit_idx] = from_cluster->units[from_cluster->size - 1];
//     from_cluster->size--;

//     // Update the cluster_id in the unit
//     unit->cluster_id = to_cluster->id;

//     printf("3Unit %d moved from Cluster %d to Cluster %d\n", unit->unit_id, from_cluster->id, to_cluster->id);

//     free(to_cluster->units);
// }

double *calculate_probabilities(double *deviations, int k)
{
    double total_deviation = 0;
    for (int i = 0; i < k; i++)
    {
        total_deviation += deviations[i];
    }

    double *probabilities = malloc(sizeof(double) * k);
    for (int i = 0; i < k; i++)
    {
        probabilities[i] = deviations[i] / total_deviation;
    }

    return probabilities;
}

int choose_cluster_index(double *cumulative_probabilities, int k)
{
    double random_value = ((double)rand()) / RAND_MAX;
    for (int i = 0; i < k; i++)
    {
        if (random_value <= cumulative_probabilities[i])
        {
            return i;
        }
    }
    return k - 1;
}

double *cumulative_probabilities(double *deviations, int k)
{
    double *probabilities = calculate_probabilities(deviations, k);
    double *cumulative_probabilities = malloc(sizeof(double) * k);
    cumulative_probabilities[0] = probabilities[0];
    for (int i = 1; i < k; i++)
    {
        cumulative_probabilities[i] = cumulative_probabilities[i - 1] + probabilities[i];
    }
    free(probabilities);
    return cumulative_probabilities;
}

void get_border_units(Cluster *cluster, TU **all_units)
{
    // Clean up the old border units if any
    if (cluster->border_units != NULL)
    {
        free(cluster->border_units);
        cluster->border_units = NULL;
        cluster->num_border_units = 0;
    }

    cluster->border_units = (int *)calloc(cluster->size, sizeof(int));
    int border_count = 0;

    for (int i = 0; i < cluster->size; i++)
    {
        TU *unit = cluster->units[i];
        for (int j = 0; j < unit->num_neighbors; j++)
        {

            TU *neighbor = all_units[unit->neighbor_ids[j]]; // Use all_units instead of cluster->units

            if (neighbor->cluster_id != unit->cluster_id)
            { // Check against unit's cluster_id instead of i
                cluster->border_units[border_count++] = i;
                // printf("huh %d\n", cluster->border_units[border_count - 1]);
                break;
            }
        }
    }

    cluster->border_units = (int *)realloc(cluster->border_units, border_count * sizeof(int));
    cluster->num_border_units = border_count;
}

void calculate_cluster_population(Cluster *cluster)
{
    int total_population = 0;
    for (int i = 0; i < cluster->size; i++)
    {
        TU *unit = cluster->units[i];
        total_population += unit->voters;
    }
    cluster->population = total_population;
}

// void change_unit(Cluster *clusters, TU **units, int k, int n)
// {
//     int total_population = 0;
//     for (int i = 0; i < k; i++)
//     {
//         total_population += clusters[i].population;
//     }
//     //create_code_index(units, n);
//     //create_neighbor_index(units, n);
//     int ideal_population = total_population / k;
//     int *cluster_sizes = get_cluster_sizes(clusters, k);
//     double *deviations = calculate_deviations(cluster_sizes, k, ideal_population);
//     double *cumulative_probabilities_res = cumulative_probabilities(deviations, k);

//     int chosen_cluster_index = choose_cluster_index(cumulative_probabilities_res, k);
//     Cluster *chosen_cluster = &clusters[chosen_cluster_index];
//     //printf("Chosen Cluster Index: %d\n", chosen_cluster_index);
//     get_border_units(chosen_cluster, units);
//     calculate_cluster_population(chosen_cluster);

//     // If the chosen cluster is larger than ideal, move a unit to the smallest neighboring cluster
//     // Else, move a unit from the largest neighboring cluster

//     if (chosen_cluster->population > ideal_population)
//     {
//         int smallest_neighbour_cluster_index = 0;
//         // select and move a unit if it doesn't break contiguity
//         int selected_unit_idx = -1;
//         while (selected_unit_idx == -1)
//         {
//             int unit_idx = chosen_cluster->border_units[rand() % chosen_cluster->num_border_units];
//             TU *unit = chosen_cluster->units[unit_idx];
//             reset_visited(chosen_cluster);

//             // Check if the remaining units in the current cluster are contiguous without the unit being moved
//             if (are_remaining_units_contiguous(chosen_cluster, unit_idx))
//             {
//                 selected_unit_idx = unit_idx;
//             }
//             //printf("Selected Unit Index: %d\n", selected_unit_idx);

//         }
//         TU *selected_unit = chosen_cluster->units[selected_unit_idx];
//         smallest_neighbour_cluster_index = get_smallest_neighbour_cluster(clusters, k, selected_unit, chosen_cluster_index);
//         //printf("Smallest Neighbour Cluster Index: %d\n", smallest_neighbour_cluster_index);

//         move_unit(chosen_cluster, &clusters[smallest_neighbour_cluster_index], selected_unit_idx);
//         printf("Unit moved from Chosen Cluster to Smallest Neighbour Cluster.\n");
//     }
//     else
//     {
//         int largest_neighbour_cluster_index = 0;
//         // select and move a unit if it doesn't break contiguity
//         Cluster *largest_neighbour_cluster = &clusters[largest_neighbour_cluster_index];
//         int selected_unit_idx = -1;
//         while (selected_unit_idx == -1)
//         {
//             int unit_idx = chosen_cluster->border_units[rand() % chosen_cluster->size];
//             TU *unit = largest_neighbour_cluster->units[unit_idx];
//             reset_visited(largest_neighbour_cluster);

//             // Check if the remaining units in the current cluster are contiguous without the unit being moved
//             if (are_remaining_units_contiguous(largest_neighbour_cluster, unit_idx))
//             {
//                 selected_unit_idx = unit_idx;
//             }

//         }

//         TU *selected_unit = chosen_cluster->units[selected_unit_idx];

//         largest_neighbour_cluster_index = get_largest_neighbour_cluster(clusters, k, selected_unit, chosen_cluster_index);
//         printf("Largest Neighbour Cluster Index: %d\n", largest_neighbour_cluster_index);

//         move_unit(largest_neighbour_cluster, chosen_cluster, selected_unit_idx);
//         printf("Unit moved from Largest Neighbour Cluster to Chosen Cluster.\n");
//     }

//     create_neighbor_index1(units, n);
//     free(cluster_sizes);
//     free(deviations);
//     free(cumulative_probabilities_res);
// // }

void change_unit1(Cluster *clusters, TU **units, int k, int n)
{
    int total_population = 0;
    for (int i = 0; i < k; i++)
    {
        total_population += clusters[i].size;
    }

    int random_population = rand() % total_population;
    int cluster_idx = 0;

    for (int i = 0; i < k; i++)
    {
        random_population -= clusters[i].size;
        if (random_population <= 0)
        {
            cluster_idx = i;
            break;
        }
    }
    // int cluster_idx = rand() % k;

    Cluster *cluster = &clusters[cluster_idx];

    // If the cluster has only one unit, keep searching for another cluster
    while (cluster->size == 1)
    {
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

    for (int i = 0; i < cluster->size; i++)
    {
        TU *current_unit = cluster->units[i];
        for (int j = 0; j < current_unit->num_neighbors; j++)
        {
            TU *neighbor = NULL;
            for (int k = 0; k < n; k++)
            {
                if (units[k]->code == current_unit->neighbor_codes[j])
                {
                    neighbor = units[k];
                    break;
                }
            }
            if (!neighbor)
                continue;

            if (neighbor->cluster_id != cluster_idx)
            {
                border_units[num_border_units++] = i;

                // Calculate the difference between the average population and the cluster's population after removing this unit
                double diff = abs((cluster->population - current_unit->voters) - avg_population);
                if (diff < min_diff)
                {
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

    if (random_value_p <= best_probability)
    {
        // With 80% chance select the best unit
        selected_unit_idx = best_unit_idx;
    }
    else
    {
        // With 20% chance select a random border unit
        selected_unit_idx = border_units[rand() % num_border_units];
    }

    // The selected unit is the one that minimizes the difference
    // int selected_unit_idx = best_unit_idx;
    TU *selected_unit = cluster->units[selected_unit_idx];

    // int selected_unit_idx = -1;
    // TU *selected_unit = NULL;
    while (selected_unit_idx == -1)
    {
        int unit_idx = border_units[rand() % num_border_units];
        TU *unit = cluster->units[unit_idx];
        reset_visited(cluster);

        // Check if the remaining units in the current cluster are contiguous without the unit being moved
        if (are_remaining_units_contiguous(cluster, unit_idx))
        {
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

    for (int i = 0; i < selected_unit->num_neighbors; i++)
    {
        int neighbor_code = selected_unit->neighbor_codes[i];
        for (int j = 0; j < n; j++)
        {
            if (units[j]->code == neighbor_code)
            {
                int neighbor_cluster_id = units[j]->cluster_id;
                if (neighbor_cluster_id != cluster_idx && !contains(neighboring_clusters, num_neighboring_clusters, neighbor_cluster_id))
                {
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

    for (int i = 0; i < num_neighboring_clusters; i++)
    {
        sum_inverse_populations += 1.0 / neighboring_cluster_populations[i];
    }

    for (int i = 0; i < num_neighboring_clusters; i++)
    {
        probabilities[i] = (1.0 / neighboring_cluster_populations[i]) / sum_inverse_populations;
    }

    // Use the roulette wheel selection to choose a neighboring cluster index
    double random_value = (double)rand() / (double)RAND_MAX;
    double cumulative_probability = 0.0;
    int selected_neighboring_cluster_idx = 0;

    for (int i = 0; i < num_neighboring_clusters; i++)
    {
        cumulative_probability += probabilities[i];
        if (random_value <= cumulative_probability)
        {
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
    for (int i = selected_unit_idx; i < cluster->size - 1; i++)
    {
        cluster->units[i] = cluster->units[i + 1];
    }
    cluster->size--;

    // free(border_units);
}

int is_contiguous_after_removal(Cluster *cluster, TU *unit_to_remove)
{
    if (cluster->size <= 1)
    {
        return 0;
    }

    // Remove the unit from the cluster temporarily.
    int unit_idx = -1;
    for (int i = 0; i < cluster->size; i++)
    {
        if (cluster->units[i] == unit_to_remove)
        {
            unit_idx = i;
            break;
        }
    }
    if (unit_idx == -1)
    {
        return 0;
    }
    cluster->units[unit_idx] = NULL;

    // Perform DFS to check contiguity.
    TU *start_unit = NULL;
    for (int i = 0; i < cluster->size; i++)
    {
        if (cluster->units[i] != NULL)
        {
            start_unit = cluster->units[i];
            break;
        }
    }
    if (!start_unit)
    {
        return 0;
    }

    bool *visited = calloc(cluster->size, sizeof(bool));
    // DFS(start_unit, cluster, visited);

    // Check if all units in the cluster were visited.
    bool all_visited = true;
    for (int i = 0; i < cluster->size; i++)
    {
        if (cluster->units[i] != NULL && !visited[i])
        {
            all_visited = 0;
            break;
        }
    }

    // Restore the removed unit.
    cluster->units[unit_idx] = unit_to_remove;

    free(visited);

    return all_visited;
}

void DFS(TU *unit, Cluster *cluster, bool *visited)
{
    for (int i = 0; i < cluster->size; i++)
    {
        if (cluster->units[i] == unit)
        {
            visited[i] = true;
            break;
        }
    }

    for (int i = 0; i < unit->num_neighbors; i++)
    {
        TU *neighbor = NULL;
        for (int j = 0; j < cluster->size; j++)
        {
            if (cluster->units[j] && cluster->units[j]->code == unit->neighbor_codes[i])
            {
                neighbor = cluster->units[j];
                break;
            }
        }

        if (neighbor)
        {
            int neighbor_idx = -1;
            for (int j = 0; j < cluster->size; j++)
            {
                if (cluster->units[j] == neighbor)
                {
                    neighbor_idx = j;
                    break;
                }
            }

            if (neighbor_idx != -1 && !visited[neighbor_idx])
            {
                DFS(neighbor, cluster, visited);
            }
        }
    }
}

Cluster **transitionBound(int ell /* Bound */, TU **units, int k, int n, FILE *fp_out)
{
    int neighbor; // its not being used
    srand(time(NULL));
    Cluster *clusters = malloc(k * sizeof(Cluster));

    for (int i = 0; i < k; i++)
    {
        clusters[i].units = malloc(n * sizeof(TU *));
        clusters[i].size = 0;
    }

    clusters = first_cluster(units, k, n);
    // printf("here?!\n");
    for (int i = 0; i < k; i++)
    {
        printf("Cluster %d with size %d: ", i, clusters[i].size);
        for (int j = 0; j < clusters[i].size; j++)
        { //
            printf("%d ", clusters[i].units[j]->code);
        }
        printf("\n");
    }

    for (int p = 0; p < 4; p++)
    {
        // change_unit(clusters, units, k, n);
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
        // printf("i = %d\n", i);
        fprintf(fp_out, "Cluster %d with size %d: ", i, clusters[i].size);
        for (int j = 0; j < clusters[i].size; j++)
        {
            // printf("j = %d\n", j);
            fprintf(fp_out, "%d ", clusters[i].units[j]->code);
        }
        fprintf(fp_out, "\n");
    }

    fclose(fp_out);
    return clusters;
}

Cluster **storeState(Cluster *clusters, int k, int n)
{
    Cluster *stored_state = malloc(k * sizeof(Cluster));
    for (int i = 0; i < k; i++)
    {
        stored_state[i].units = malloc(n * sizeof(TU *));
        stored_state[i].size = 0;
        for (int j = 0; j < clusters[i].size; j++)
        {
            stored_state[i].units[j] = clusters[i].units[j];
        }
    }
    return stored_state;
}

// TODO
void identify_border_units(TU **units, Cluster *clusters, int num_units, int k)
{
    for (int c = 0; c < k; c++)
    {
        Cluster *cluster = &clusters[c];
        TU **border_units = (TU **)malloc(num_units * sizeof(TU *));
        int num_border_units = 0;

        for (int i = 0; i < cluster->size; i++)
        {
            TU *current_unit = cluster->units[i];
            for (int j = 0; j < current_unit->num_neighbors; j++)
            {
                // Get the neighbor using the neighbor_ids directly
                TU *neighbor = units[current_unit->neighbor_ids[j]];
                if (neighbor->cluster_id != cluster->id)
                {
                    border_units[num_border_units++] = current_unit;
                    break;
                }
            }
        }

        cluster->border_units = border_units;
        cluster->num_border_units = num_border_units;

        // printf("Cluster %d has %d border units:\n", cluster->id, cluster->num_border_units);
        for (int i = 0; i < num_border_units; i++)
        {
            // printf("Unit index: %d (Unit code: %d)\n", cluster->border_units[i]->unit_id, cluster->border_units[i]->code);
        }
        // printf("\n");
    }
}

int *identify_neighboring_clusters(TU **units, Cluster *cluster, int num_units)
{
    int *neighboring_clusters = (int *)malloc(cluster->size * sizeof(int));
    int num_neighboring_clusters = 0;

    for (int i = 0; i < cluster->num_border_units; i++)
    {
        TU *current_unit = cluster->border_units[i];
        for (int j = 0; j < current_unit->num_neighbors; j++)
        {
            TU *neighbor = NULL;
            for (int k = 0; k < num_units; k++)
            {
                if (units[k]->code == current_unit->neighbor_codes[j])
                {
                    neighbor = units[k];
                    break;
                }
            }
            if (!neighbor)
                continue;

            if (neighbor->cluster_id != cluster->id && !contains(neighboring_clusters, num_neighboring_clusters, neighbor->cluster_id))
            {
                neighboring_clusters[num_neighboring_clusters++] = neighbor->cluster_id;
            }
        }
    }

    return neighboring_clusters; // Return this list for now as it's not a constant property of the cluster
}

void update_cluster(Cluster *cluster, TU **units, int num_units, int k)
{
    if (cluster->border_units)
    {
        free(cluster->border_units);
    }

    identify_border_units(units, cluster, num_units, k);
    // You could also update neighboring clusters here if they were a property of the cluster
}
// Function to compute the deviation for a cluster
int compute_deviation(Cluster cluster, int ideal_population)
{
    // printf("compute: %d\n ", abs(cluster.population - ideal_population));
    return abs(cluster.population - ideal_population);
}

// Function to determine if a cluster is overpopulated
bool is_cluster_overpopulated(Cluster cluster, int ideal_population)
{
    return cluster.population > ideal_population;
}

void find_border_units(Cluster *clusters, int num_clusters, int current_cluster_id, int neighbor_cluster_id)
{
    Cluster *current_cluster = NULL, *neighbor_cluster = NULL;

    // Find the current and neighbor clusters
    for (int i = 0; i < num_clusters; i++)
    {
        if (clusters[i].id == current_cluster_id)
        {
            current_cluster = &clusters[i];
        }
        else if (clusters[i].id == neighbor_cluster_id)
        {
            neighbor_cluster = &clusters[i];
        }
    }

    // If either cluster was not found, there's nothing to do
    if (!current_cluster || !neighbor_cluster)
    {
        // printf("Cluster not found.\n");
        return;
    }

    // Print all units in the current cluster
    // printf("Units in the current cluster (Cluster %d): [", current_cluster_id);
    for (int i = 0; i < current_cluster->size; i++)
    {
        // printf("%d ", current_cluster->units[i]->code);
    }
    // printf("]\n");

    // Print all units in the neighbor cluster
    // printf("Units in the neighbor cluster (Cluster %d): [", neighbor_cluster_id);
    for (int i = 0; i < neighbor_cluster->size; i++)
    {
        // printf("%d ", neighbor_cluster->units[i]->code);
    }
    // printf("]\n");

    // The size of the border_units array is the number of border units in the cluster
    current_cluster->border_units = (TU **)calloc(current_cluster->size, sizeof(TU *));
    int border_unit_count = 0;

    // printf("Finding border units between Cluster %d and Cluster %d\n", current_cluster->id, neighbor_cluster->id);
    // printf("Cluster %d size: %d\n", current_cluster_id, current_cluster->size);
    // printf("Cluster %d size: %d\n", neighbor_cluster_id, neighbor_cluster->size);

    for (int i = 0; i < current_cluster->size; i++)
    {
        // printf("Evaluating unit %d with code %d in Cluster %d: [", current_cluster->units[i]->unit_id, current_cluster->units[i]->code, current_cluster_id);
        bool is_border_unit = false;
        for (int j = 0; j < current_cluster->units[i]->num_neighbors; j++)
        {
            // printf("%d ", current_cluster->units[i]->neighbor_codes[j]);
            //  If the unit has a neighbor in the neighbor_cluster, add it to the border_units array
            for (int k = 0; k < neighbor_cluster->size; k++)
            {
                if (current_cluster->units[i]->neighbor_codes[j] == neighbor_cluster->units[k]->code)
                {
                    if (!is_border_unit)
                    {
                        current_cluster->border_units[border_unit_count++] = current_cluster->units[i];
                        // printf(" (Unit %d is a border unit)", current_cluster->units[i]->unit_id);
                        is_border_unit = true;
                    }
                    break;
                }
            }
        }
        // printf("]\n");
    }

    // printf("Neighbors of units in Cluster %d: \n", current_cluster_id);
    for (int i = 0; i < current_cluster->size; i++)
    {
        // printf("Neighbors of unit %d: [", current_cluster->units[i]->unit_id);
        for (int j = 0; j < current_cluster->units[i]->num_neighbors; j++)
        {
            // printf("%d ", current_cluster->units[i]->neighbor_codes[j]);
        }
        // printf("Neighbors of units in Cluster %d: \n", neighbor_cluster_id);
        for (int i = 0; i < neighbor_cluster->size; i++)
        {
            // printf("Neighbors of unit %d: [", neighbor_cluster->units[i]->unit_id);
            for (int j = 0; j < neighbor_cluster->units[i]->num_neighbors; j++)
            {
                // printf("%d ", neighbor_cluster->units[i]->neighbor_codes[j]);
            }
            // printf("]\n");
        }

        current_cluster->num_border_units = border_unit_count;
        // printf("Border unit count %d.\n", border_unit_count);
        //  Printing the list of border units found
        // printf("Border units between Cluster %d and Cluster %d: [", current_cluster->id, neighbor_cluster->id);
        for (int k = 0; k < border_unit_count; k++)
        {
            //    printf("%d ", current_cluster->border_units[k]->code);
        }
        // printf("]\n");
    }
}
// Function to move a unit from one cluster to another
void move_unit(Cluster *from_cluster, Cluster *to_cluster, int unit_index)
{
    // Check if unit_index is valid
    if (unit_index < 0 || unit_index >= from_cluster->size)
    {
        // printf("Invalid unit_index: %d\n", unit_index);
        return; // Return early if unit_index is not valid
    }

    TU *unit_to_move = from_cluster->units[unit_index];

    // Update the from_cluster
    from_cluster->population -= unit_to_move->voters;
    from_cluster->size--;
    for (int i = unit_index; i < from_cluster->size; i++)
    {
        from_cluster->units[i] = from_cluster->units[i + 1];
    }

    // Update the to_cluster
    to_cluster->units[to_cluster->size++] = unit_to_move;
    to_cluster->population += unit_to_move->voters;

    // Update the unit's cluster_id
    unit_to_move->cluster_id = to_cluster->id;
}

// Function to check if a cluster is contiguous
// Function to check if a cluster is contiguous
bool is_cluster_contiguous(Cluster *cluster, int exclude_index)
{
    // Using the function you provided
    return are_remaining_units_contiguous(cluster, exclude_index);
}

void print_cluster(Cluster *cluster)
{
    printf("Cluster ID: %d\n", cluster->id);
    printf("Number of Units: %d\n", cluster->size);
    printf("Population: %d\n", cluster->population);
    printf("Number of Border Units: %d\n", cluster->num_border_units);

    for (int i = 0; i < cluster->size; i++)
    {
        TU *unit = cluster->units[i];
        printf("Unit ID: %d\n", unit->unit_id);
        printf("Code: %d\n", unit->code);
        printf("Number of Codes: %d\n", unit->num_code);
        printf("Voters: %d\n", unit->voters);
        printf("Number of Neighbors: %d\n", unit->num_neighbors);

        printf("Neighbor Codes: ");
        for (int j = 0; j < unit->num_neighbors; j++)
        {
            printf("%d ", unit->neighbor_codes[j]);
        }
        printf("\n");

        printf("Border Sizes: ");
        for (int j = 0; j < unit->num_neighbors; j++)
        {
            printf("%d ", unit->border_sizes[j]);
        }
        printf("\n");

        printf("Assigned: %s\n", unit->assigned ? "True" : "False");
        printf("Cluster ID: %d\n", unit->cluster_id);
        printf("Visited: %d\n", unit->visited);

        printf("Neighbor IDs: ");
        for (int j = 0; j < unit->num_neighbors; j++)
        {
            printf("%d ", unit->neighbor_ids[j]);
        }
        printf("\n\n");
    }

    printf("Border Units: ");
    for (int i = 0; i < cluster->num_border_units; i++)
    {
        printf("%d ", cluster->border_units[i]->unit_id);
    }
    printf("\n\n");
}

TU *find_unit_in_cluster(Cluster *cluster, int unit_id)
{
    for (int i = 0; i < cluster->size; i++)
    {
        if (cluster->units[i]->unit_id == unit_id)
        {
            return cluster->units[i];
        }
    }
    return NULL; // return NULL if no unit with such unit_id is found
}

void change_unit(Cluster *clusters, TU **units, int k, int n, int ideal_population)
{
    identify_border_units(units, clusters, n, k);

    int max_deviation = -1;
    int max_deviation_cluster_idx = -1;
    int random_cluster_idx;

    int rand_num = rand() % 100;

    if (rand_num < 50)
    {
        int max_deviation = -1;
        for (int i = 0; i < k; i++)
        {
            int deviation = compute_deviation(clusters[i], ideal_population);
            if (deviation > max_deviation)
            {
                max_deviation = deviation;
                max_deviation_cluster_idx = i;
            }
        }
        //printf("Biggest deviation: %d in cluster %d\n", max_deviation, max_deviation_cluster_idx);
    }
    else
    {
        do
        {
            max_deviation_cluster_idx = rand() % k;
        } while (clusters[max_deviation_cluster_idx].size <= 1);
        //printf("Randomly selected cluster: %d\n", max_deviation_cluster_idx);
    }

    Cluster *max_dev_cluster = &clusters[max_deviation_cluster_idx];
    // printf("cluster %d with population %d with size %d\n", max_dev_cluster->id, max_dev_cluster->population, max_dev_cluster->size);
    //printf("cluster %d with population %d with size %d\n", max_dev_cluster->id, max_dev_cluster->population, max_dev_cluster->size);
    int neighboring_cluster_idx;

    if (is_cluster_overpopulated(*max_dev_cluster, ideal_population))
    {

        int min_population = INT_MAX;
        // do
        // {
        //     max_deviation_cluster_idx = rand() % k;
        // } while (clusters[max_deviation_cluster_idx].size <= 1);
        // max_dev_cluster = &clusters[max_deviation_cluster_idx];

        for (int i = 0; i < max_dev_cluster->num_border_units; i++)
        {

            int unit_id = max_dev_cluster->border_units[i]->unit_id;
            TU *unit = find_unit_in_cluster(max_dev_cluster, unit_id);

            for (int j = 0; j < unit->num_neighbors; j++)
            {
                int neighbor_cluster_idx = units[unit->neighbor_ids[j]]->cluster_id;
                if (neighbor_cluster_idx != max_deviation_cluster_idx && clusters[neighbor_cluster_idx].population < min_population && clusters[neighbor_cluster_idx].size > 1)
                {
                    min_population = clusters[neighbor_cluster_idx].population;
                    neighboring_cluster_idx = neighbor_cluster_idx;
                }
            }
        }
        //printf("Selected neighboring cluster with minimum population: %d\n", neighboring_cluster_idx);
    }
    else
    {
        int max_population = -1;
        for (int i = 0; i < max_dev_cluster->num_border_units; i++)
        {
            int unit_id = max_dev_cluster->border_units[i]->unit_id;
            TU *unit = find_unit_in_cluster(max_dev_cluster, unit_id);

            for (int j = 0; j < unit->num_neighbors; j++)
            {
                int neighbor_cluster_idx = units[unit->neighbor_ids[j]]->cluster_id;
                if (neighbor_cluster_idx != max_deviation_cluster_idx && clusters[neighbor_cluster_idx].population > max_population)
                {
                    max_population = clusters[neighbor_cluster_idx].population;
                    neighboring_cluster_idx = neighbor_cluster_idx;
                }
            }
        }
        //printf("Selected neighboring cluster with maximum population: %d\n", neighboring_cluster_idx);
    }

    int *neighboring_clusters = calloc(k, sizeof(int));
    if (!neighboring_clusters)
    {
        perror("Failed to allocate memory for neighboring_clusters");
        //printf("Failed to allocate memory for neighboring_clusters");
        return;
    }

    int num_neighboring_clusters = 0;

    for (int i = 0; i < max_dev_cluster->num_border_units; i++)
    {
        int unit_id = max_dev_cluster->border_units[i]->unit_id;
        TU *unit = find_unit_in_cluster(max_dev_cluster, unit_id);

        for (int j = 0; j < unit->num_neighbors; j++)
        {
            int neighbor_cluster_idx = units[unit->neighbor_ids[j]]->cluster_id;
            if (neighbor_cluster_idx != max_deviation_cluster_idx && neighbor_cluster_idx < k)
            {
                int already_added = 0;
                for (int x = 0; x < num_neighboring_clusters; x++)
                {
                    if (neighboring_clusters[x] == neighbor_cluster_idx)
                    {
                        already_added = 1;
                        break;
                    }
                }
                if (!already_added)
                {
                    neighboring_clusters[num_neighboring_clusters] = neighbor_cluster_idx;
                    num_neighboring_clusters++;
                }
            }
        }
    }

    Cluster *neighboring_cluster_ = malloc(k * sizeof(Cluster));
    if (!neighboring_cluster_)
    {
        perror("Failed to allocate memory for neighboring_cluster_");
       // printf("Failed to allocate memory for neighboring_cluster_");
        return;
    }
    for (int i = 0; i < k; i++)
    {
        neighboring_cluster_[i].units = malloc(n * sizeof(TU *));
        neighboring_cluster_[i].size = 0;
    }
    rand_num = rand() % 100;
    if (rand_num < 50)
    {
        int rand_neighbor_index;
        if (num_neighboring_clusters > 0)
        {
            rand_neighbor_index = rand() % num_neighboring_clusters;
            do
            {
                rand_neighbor_index = rand() % num_neighboring_clusters;

            } while (clusters[rand_neighbor_index].size <= 1 && clusters[rand_neighbor_index].id == max_dev_cluster->id);
        }

        else
        {
           // printf("return\n");
            return;
        }

        neighboring_cluster_idx = neighboring_clusters[rand_neighbor_index];
       // printf("Random number %d and the selected neighbor: %d\n", rand_num, neighboring_cluster_idx);
    }

    // do
    //         {
    //            neighboring_cluster_idx = rand() % num_neighboring_clusters;
    //            if (num_neighboring_clusters == 1)
    //             return;
    //         } while (clusters[neighboring_cluster_idx].size <= 1 || max_dev_cluster->id == clusters[neighboring_cluster_idx].id);

    neighboring_cluster_ = &clusters[neighboring_cluster_idx];
    // printf("cluster neighbor %d with population %d with size %d\n", neighboring_cluster_->id, neighboring_cluster_->population, neighboring_cluster_->size);
    //  if (neighboring_cluster_idx >= k || neighboring_cluster_idx < 0)
    //  {
    //      return;
    //  }

    int contiguous_movement_count = 0;
    int *contiguous_movements = NULL;

   // printf("cluster one: %d and cluster two: %d\n", max_dev_cluster->id, neighboring_cluster_->id);
    if (is_cluster_overpopulated(*max_dev_cluster, ideal_population))
    {
        find_border_units(clusters, k, max_dev_cluster->id, neighboring_cluster_->id);
        int border_unit_count = max_dev_cluster->num_border_units;
        if (border_unit_count <= 0)
        {
           // printf("no border!?\n");
            return;
        }

        for (int i = 0; i < border_unit_count; i++)
        {
            TU *border_unit = max_dev_cluster->border_units[i];
            if (border_unit == NULL)
            {
                continue;
            }
            //printf("Border unit id: %d\n", border_unit->code); // Printing the border unit id

            int unit_index = -1;
            for (int j = 0; j < max_dev_cluster->size; j++)
            {
                if (max_dev_cluster->units[j]->unit_id == border_unit->unit_id)
                {
                    unit_index = j;
                    break;
                }
            }
            if (unit_index == -1)
            {
                continue;
            }
            // printf("Moving unit %d with population %d from Cluster %d to Cluster %d\n", border_unit->unit_id, border_unit->voters, max_dev_cluster->id, neighboring_cluster_->id);

            // Store the index where the unit will be placed in neighboring_cluster_
            int moved_unit_index_in_neighboring_cluster = neighboring_cluster_->size;

            move_unit(max_dev_cluster, neighboring_cluster_, unit_index);

            if (is_cluster_contiguous(max_dev_cluster, border_unit->unit_id))
            {

                // Store the index of the contiguous movement
                contiguous_movements = realloc(contiguous_movements, (contiguous_movement_count + 1) * sizeof(int));
                contiguous_movements[contiguous_movement_count] = i;
                //printf("Storing contiguous movement index: %d\n", i); // debug print
                contiguous_movement_count++;
            }
            // Undo the movement for the next check
            move_unit(neighboring_cluster_, max_dev_cluster, moved_unit_index_in_neighboring_cluster);
        }

        // Choose a random contiguous movement
        if (contiguous_movement_count > 0)
        {
           // printf("ayo1");
            int random_index = rand() % contiguous_movement_count;
            int chosen_unit_index = contiguous_movements[random_index];
           // printf("Randomly chosen index from contiguous movements: %d\n", random_index); // debug print
           // printf("Chosen contiguous movement unit index: %d\n", chosen_unit_index); // debug print
            TU *chosen_border_unit = max_dev_cluster->border_units[chosen_unit_index];
           // printf("Chosen border unit for movement: %d\n", chosen_border_unit->unit_id);

            // Move the chosen unit again
            int unit_index = -1;
            for (int j = 0; j < max_dev_cluster->size; j++)
            {
                if (max_dev_cluster->units[j]->unit_id == chosen_border_unit->unit_id)
                {
                    unit_index = j;
                    // printf("??\n");
                    break;
                }
            }
           // printf("Moving unit %d from cluster %d to cluster %d\n", chosen_border_unit->unit_id, max_dev_cluster->id, neighboring_cluster_->id);
            
            move_unit(max_dev_cluster, neighboring_cluster_, unit_index);
        }

        if (max_dev_cluster->border_units != NULL)
        {
            free(max_dev_cluster->border_units);
            max_dev_cluster->border_units = NULL;
        }

        // Free the allocated memory
        if (contiguous_movements != NULL)
        {
            free(contiguous_movements);
        }
    }
    else
    {
        find_border_units(clusters, k, neighboring_cluster_->id, max_dev_cluster->id);
        int border_unit_count = neighboring_cluster_->num_border_units;
        if (border_unit_count <= 0)
        {
           // printf("no border!?\n");
            return;
        }

        for (int i = 0; i < border_unit_count; i++)
        {
            TU *border_unit = neighboring_cluster_->border_units[i];
            if (border_unit == NULL)
            {
                continue;
            }
            //printf("Border unit id: %d\n", border_unit->code); // Printing the border unit id

            int unit_index = -1;
            for (int j = 0; j < neighboring_cluster_->size; j++)
            {
                if (neighboring_cluster_->units[j]->unit_id == border_unit->unit_id)
                {
                    unit_index = j;
                    break;
                }
            }
            if (unit_index == -1)
            {
                continue;
            }

            // Move the unit and check if the cluster is still contiguous
            move_unit(neighboring_cluster_, max_dev_cluster, unit_index);

            if (is_cluster_contiguous(neighboring_cluster_, border_unit->cluster_id))
            {
                
                // Store the index of the contiguous movement
                contiguous_movements = realloc(contiguous_movements, (contiguous_movement_count + 1) * sizeof(int));
                //printf("-->Storing contiguous movement index: %d\n", i);
                contiguous_movements[contiguous_movement_count] = i;
                contiguous_movement_count++;
            }

            // Undo the movement for the next check
            move_unit(max_dev_cluster, neighboring_cluster_, max_dev_cluster->size - 1);
        }

        // Choose a random contiguous movement
        if (contiguous_movement_count > 0)
        {
           // printf("ayo1");
            int random_index = rand() % contiguous_movement_count;
            int chosen_unit_index = contiguous_movements[random_index];
            TU *chosen_border_unit = neighboring_cluster_->border_units[chosen_unit_index];
           // printf("Chosen border unit for movement: %d\n", chosen_border_unit->unit_id);

            // Move the chosen unit again
            int unit_index = -1;
            for (int j = 0; j < neighboring_cluster_->size; j++)
            {
                if (neighboring_cluster_->units[j]->unit_id == chosen_border_unit->unit_id)
                {
                    unit_index = j;
                    break;
                }
            }
           // printf("Moving unit %d from cluster %d to cluster %d\n", chosen_border_unit->unit_id, max_dev_cluster->id, neighboring_cluster_->id);

            move_unit(neighboring_cluster_, max_dev_cluster, unit_index);
        }

        if (neighboring_cluster_->border_units != NULL)
        {
            free(neighboring_cluster_->border_units);
            neighboring_cluster_->border_units = NULL;
        }

        // Free the allocated memory
        if (contiguous_movements != NULL)
        {
            free(contiguous_movements);
        }
    }
   // printf("??\n");
}

void change_unit333(Cluster *clusters, TU **units, int k, int n, int ideal_population)
{
    // Compute the ideal population
    // int total_population = 0;
    // for (int i = 0; i < k; i++) {
    //    total_population += clusters[i].population;
    //}
    // int ideal_population = total_population / k;

    identify_border_units(units, clusters, n, k);
    // printf("Ideal Population: %d\n", ideal_population);
    // print_cluster(clusters);
    //  Compute the deviations and find the cluster with the maximum deviation
    int max_deviation = -1;
    int max_deviation_cluster_idx = -1;
    int random_cluster_idx;

    // Generate a random number between 0 and 99
    int rand_num = rand() % 100;

    // 80% chance to select based on max deviation
    if (rand_num < 50)
    {
        // Compute the deviations and find the cluster with the maximum deviation
        int max_deviation = -1;
        for (int i = 0; i < k; i++)
        {
            int deviation = compute_deviation(clusters[i], ideal_population);
            // printf("from cluster %d with population %d with deviation %d\n", clusters[i].id, clusters[i].population, deviation);
            if (deviation > max_deviation)
            {
                max_deviation = deviation;
                max_deviation_cluster_idx = i;
            }
        }
    }
    else
    { // 20% chance to select randomly
        // Randomly pick a cluster
        do
        {
            max_deviation_cluster_idx = rand() % k;
        } while (clusters[max_deviation_cluster_idx].size <= 1);
    }

    // Cluster *selected_cluster = (rand_num < 80) ? &clusters[max_deviation_cluster_idx] : &clusters[random_cluster_idx];

    Cluster *max_dev_cluster = &clusters[max_deviation_cluster_idx];
    // printf("\n<3 random number %d, with cluster: %d, with population %d\n\n", rand_num, max_dev_cluster->id, max_dev_cluster->population);
    //  while (max_dev_cluster->size == 1) {
    //      random_cluster_idx = rand() % k;
    //      max_dev_cluster = &clusters[random_cluster_idx];
    //  }
    // printf("Selected cluster ID: %d, Number of units: %d\n", max_dev_cluster->id, max_dev_cluster->size); // Print the number of units in the selected cluster
    // printf("selescted cluster population %d\n ", max_dev_cluster->population);

    int neighboring_cluster_idx;

    if (is_cluster_overpopulated(*max_dev_cluster, ideal_population))
    {
        // Find the neighboring cluster with the minimum population
        // printf("is over!\n");
        int min_population = INT_MAX;
        do
        {
            max_deviation_cluster_idx = rand() % k;
        } while (clusters[max_deviation_cluster_idx].size <= 1);
        max_dev_cluster = &clusters[max_deviation_cluster_idx];
        // printf("\n\n***** Start Debugging *****\n\n");
        // printf("Max Deviation Cluster ID: %d\n", max_dev_cluster->id);
        // printf("Number of border units: %d\n", max_dev_cluster->num_border_units);

        // Debugging prints for border units
        for (int i = 0; i < max_dev_cluster->num_border_units; i++)
        {
            // printf("Border Unit %d: %d\n", i, max_dev_cluster->border_units[i]->unit_id);
        }

        // End Debuggin
        for (int i = 0; i < max_dev_cluster->num_border_units; i++)
        {

            int unit_id = max_dev_cluster->border_units[i]->unit_id;
            TU *unit = find_unit_in_cluster(max_dev_cluster, unit_id);

            // printf("Border Unit: %d\n", unit->unit_id);
            //  Before the loop
            if (unit == NULL)
            {
                // printf("unit is NULL\n");
            }
            else
            {
                // printf("unit is not NULL, unit->num_neighbors: %d\n", unit->num_neighbors);
            }
            for (int j = 0; j < unit->num_neighbors; j++)
            {
                int neighbor_cluster_idx = units[unit->neighbor_ids[j]]->cluster_id;
                // printf("Neighbor Cluster: %d\n", neighbor_cluster_idx);
                if (neighbor_cluster_idx != max_deviation_cluster_idx && clusters[neighbor_cluster_idx].population < min_population && clusters[neighbor_cluster_idx].size > 1)
                {
                    min_population = clusters[neighbor_cluster_idx].population;
                    neighboring_cluster_idx = neighbor_cluster_idx;
                }
            }
        }
        // printf("neighbor with small population: %d, with population %d\n\n", clusters[neighboring_cluster_idx].id, clusters[neighboring_cluster_idx].population);
    }
    else
    {
        // printf("is under!\n");
        //  Find the neighboring cluster with the maximum population
        int max_population = -1;
        for (int i = 0; i < max_dev_cluster->num_border_units; i++)
        {
            int unit_id = max_dev_cluster->border_units[i]->unit_id;
            TU *unit = find_unit_in_cluster(max_dev_cluster, unit_id);

            // printf("Border Unit: %d\n", unit_idx);
            for (int j = 0; j < unit->num_neighbors; j++)
            {
                int neighbor_cluster_idx = units[unit->neighbor_ids[j]]->cluster_id;
                // printf("Neighbor Cluster: %d\n", neighbor_cluster_idx);
                if (neighbor_cluster_idx != max_deviation_cluster_idx && clusters[neighbor_cluster_idx].population > max_population)
                {
                    max_population = clusters[neighbor_cluster_idx].population;
                    neighboring_cluster_idx = neighbor_cluster_idx;
                }
            }
        }
        // printf("neighbor with big population: %d, with population %d\n\n", clusters[neighboring_cluster_idx].id, clusters[neighboring_cluster_idx].population);
    }

    // printf("Neighboring Cluster Index: %d\n", neighboring_cluster_idx);

    int *neighboring_clusters = calloc(k, sizeof(int));
    if (!neighboring_clusters)
    {
        perror("Failed to allocate memory for neighboring_clusters");
        return;
    }

    int num_neighboring_clusters = 0;

    for (int i = 0; i < max_dev_cluster->num_border_units; i++)
    {
        int unit_id = max_dev_cluster->border_units[i]->unit_id;
        TU *unit = find_unit_in_cluster(max_dev_cluster, unit_id);

        for (int j = 0; j < unit->num_neighbors; j++)
        {
            int neighbor_cluster_idx = units[unit->neighbor_ids[j]]->cluster_id;
            if (neighbor_cluster_idx != max_deviation_cluster_idx && neighbor_cluster_idx < k)
            {
                int already_added = 0;
                for (int x = 0; x < num_neighboring_clusters; x++)
                {
                    if (neighboring_clusters[x] == neighbor_cluster_idx)
                    {
                        already_added = 1;
                        break;
                    }
                }
                if (!already_added)
                {
                    neighboring_clusters[num_neighboring_clusters] = neighbor_cluster_idx;
                    num_neighboring_clusters++;
                }
            }
        }
    }

    Cluster *neighboring_cluster_ = malloc(k * sizeof(Cluster));
    if (!neighboring_cluster_)
    {
        perror("Failed to allocate memory for neighboring_cluster_");
        return;
    }
    // create_code_index1(units, n);
    for (int i = 0; i < k; i++)
    {
        neighboring_cluster_[i].units = malloc(n * sizeof(TU *));
        neighboring_cluster_[i].size = 0;
    }

    // printf("Pip\n");
    rand_num = rand() % 100;
    if (rand_num < 20)
    {
        // printf("ayoo?, %d\n", rand_num);
        int rand_neighbor_index;

        if (num_neighboring_clusters > 0)
        {
            rand_neighbor_index = rand() % num_neighboring_clusters;
            do
            {
                rand_neighbor_index = rand() % num_neighboring_clusters;
                printf("Randomly selected cluster index: %d\n", rand_neighbor_index);

            } while (clusters[rand_neighbor_index].size <= 1);
        }
        else
        {
            printf("No neighboring clusters found.\n");
            // num_neighboring_clu is zero. Decide what to do in this case.
            // Maybe set rand_neighbor_index to a default value or handle the error in some way.
            return;
        }
        // printf("num_neighboring_clusters: %d, rand_neighbor_index: %d\n", num_neighboring_clusters, rand_neighbor_index);

        // Get the cluster index directly from the neighboring_clusters array
        neighboring_cluster_idx = neighboring_clusters[rand_neighbor_index];
        // printf("Selected neighboring_cluster_idx: %d\n", neighboring_cluster_idx);

        if (neighboring_cluster_idx < k && neighboring_cluster_idx >= 0)
        {
            // printf("hey\n");
            // printf("neigh: %d\n", clusters[neighboring_cluster_idx].id);
            // neighboring_cluster_ = &clusters[neighboring_cluster_idx];
        }
        else
        {
            // printf("Invalid neighboring_cluster_idx: %d\n", neighboring_cluster_idx);
        }
    }
    do
    {
        neighboring_cluster_idx = rand() % num_neighboring_clusters;
        if (num_neighboring_clusters == 1)
        {
            printf("just one neighbour\n");
            return;
        }
    } while (clusters[neighboring_cluster_idx].size <= 1 && max_dev_cluster->id != clusters[neighboring_cluster_idx].id);

    neighboring_cluster_ = &clusters[neighboring_cluster_idx];
    // printf("neighbour %d, \n", neighboring_cluster_->id);
    // printf("Neighboring cluster ID: %d, Number of units: %d\n", neighboring_cluster_->id, neighboring_cluster_->size); // Print the number of units in the neighboring cluster

    if (neighboring_cluster_idx >= k || neighboring_cluster_idx < 0)
    {
        printf("Invalid neighboring_cluster_idx: %d\n", neighboring_cluster_idx);
        return;
    }

    // Find the border units between the two clusters
    find_border_units(clusters, k, max_dev_cluster->id, neighboring_cluster_->id);
    int border_unit_count = max_dev_cluster->num_border_units;
    // printf("border units number = %d\n", border_unit_count);
    if (border_unit_count <= 0)
    {
        printf("No border units found.\n");
        return;
    }

    // Try to move each border unit from the max deviation cluster to the neighboring cluster
    for (int i = 0; i < border_unit_count; i++)
    {
        TU *border_unit = max_dev_cluster->border_units[i];

        // Check if border_unit is a valid index for units
        if (border_unit == NULL)
        {
            // printf("Invalid border unit pointer at index: %d\n", i);
            continue;
        }
        int unit_index = -1;
        for (int j = 0; j < max_dev_cluster->size; j++)
        {
            if (max_dev_cluster->units[j]->unit_id == border_unit->unit_id)
            {
                unit_index = j;
                break;
            }
        }
        // If unit_index is still -1, the border unit was not found in from_cluster->units
        if (unit_index == -1)
        {
            // printf("Border unit with unit_id %d not found in Cluster %d\n", border_unit->unit_id, max_dev_cluster->id);
            continue;
        }

        move_unit(max_dev_cluster, neighboring_cluster_, border_unit->unit_id);

        // printf("Moving unit %d with population %d from Cluster %d to Cluster %d\n", border_unit->unit_id, border_unit->voters, max_dev_cluster->id, neighboring_cluster_->id);

        // Check if the border_unit is a valid index after the move
        if (border_unit < 0 || border_unit >= max_dev_cluster->size)
        {
            // printf("Invalid border unit index after move: %d\n", border_unit->unit_id);
            continue;
        }

        if (is_cluster_contiguous(max_dev_cluster, border_unit))
        {
            // If the cluster remains contiguous, we're done
            // printf("Cluster %d remains contiguous after moving unit %d\n", max_dev_cluster->id, border_unit->unit_id);
            break;
        }
        else
        {
            // If the cluster is not contiguous, undo the move and try the next unit
            move_unit(neighboring_cluster_, max_dev_cluster, neighboring_cluster_->size - 1);
            // printf("Cluster %d is not contiguous after moving unit %d. Undoing move.\n", max_dev_cluster->id, border_unit->unit_id);
        }
    }

    // printf("\n");

    // Free the memory allocated for border_units
    if (max_dev_cluster->border_units != NULL)
    {
        free(max_dev_cluster->border_units);
        // Set it to NULL to avoid dangling pointer
        max_dev_cluster->border_units = NULL;
    }
    else
    {
        // printf("No memory to free for border_units.\n");
    }
}

// int calculate_total_population(Cluster *clusters, int k) {
//     int total_population = 0;
//     for (int i = 0; i < k; i++) {
//         total_population += clusters[i].size;
//     }
//     return total_population;
// }

// double *calculate_cluster_probabilities(Cluster *clusters, int k, int total_population) {
//     double *probabilities = malloc(k * sizeof(double));
//     double sum_inverse_populations = 0;

//     for (int i = 0; i < k; i++) {
//         double cluster_population_diff = abs(clusters[i].size - total_population / k);
//         sum_inverse_populations += 1.0 / cluster_population_diff;
//     }

//     for (int i = 0; i < k; i++) {
//         double cluster_population_diff = abs(clusters[i].size - total_population / k);
//         probabilities[i] = (1.0 / cluster_population_diff) / sum_inverse_populations;
//     }

//     return probabilities;
// }

// int select_cluster(double *probabilities, int k) {
//     double random_value = (double)rand() / (double)RAND_MAX;
//     double cumulative_probability = 0.0;
//     int cluster_idx = 0;

//     for (int i = 0; i < k; i++) {
//         cumulative_probability += probabilities[i];
//         if (random_value <= cumulative_probability) {
//             cluster_idx = i;
//             break;
//         }
//     }

//     return cluster_idx;
// }

// int* identify_border_units(TU **units, Cluster *cluster, int n) {
//     int *border_units = malloc(cluster->size * sizeof(int));
//     int num_border_units = 0;

//     for (int i = 0; i < cluster->size; i++) {
//         TU *current_unit = cluster->units[i];
//         for (int j = 0; j < current_unit->num_neighbors; j++) {
//             TU *neighbor = NULL;
//             for (int k = 0; k < n; k++) {
//                 if (units[k]->code == current_unit->neighbor_codes[j]) {
//                     neighbor = units[k];
//                     break;
//                 }
//             }
//             if (!neighbor) continue;

//             if (neighbor->cluster_id != cluster->id) {
//                 border_units[num_border_units++] = i;
//                 break;
//             }
//         }
//     }

//     return border_units;
// }

// int select_unit_to_move(Cluster *cluster, int avg_population, int* border_units) {
//     double min_diff = DBL_MAX;
//     int best_unit_idx = -1;

//     for (int i = 0; i < num_border_units; i++) {
//         TU *current_unit = cluster->units[border_units[i]];

//         // Calculate the difference between the average population and the cluster's population after removing this unit
//         double diff = abs((cluster->population - current_unit->voters) - avg_population);
//         if (diff < min_diff) {
//             min_diff = diff;
//             best_unit_idx = border_units[i];
//         }
//     }

//     double best_probability = 0.5; // You can adjust this value based on your needs
//     double random_value_p = (double)rand() / (double)RAND_MAX;
//     int selected_unit_idx;

//     if(random_value_p <= best_probability) {
//         // With 80% chance select the best unit
//         selected_unit_idx = best_unit_idx;
//     } else {
//         // With 20% chance select a random border unit
//         selected_unit_idx = border_units[rand() % num_border_units];
//     }

//     return selected_unit_idx;
// }

// // This function assumes that you already have a function named contains() that checks if a given value is in an array
// int* identify_neighboring_clusters(TU **units, TU *selected_unit, Cluster *clusters, int n, int k) {
//     int *neighboring_clusters = malloc(k * sizeof(int));
//     int num_neighboring_clusters = 0;

//     for (int i = 0; i < selected_unit->num_neighbors; i++) {
//         int neighbor_code = selected_unit->neighbor_codes[i];
//         for (int j = 0; j < n; j++) {
//             if (units[j]->code == neighbor_code) {
//                 int neighbor_cluster_id = units[j]->cluster_id;
//                 if (neighbor_cluster_id != clusters->id && !contains(neighboring_clusters, num_neighboring_clusters, neighbor_cluster_id)) {
//                     neighboring_clusters[num_neighboring_clusters++] = neighbor_cluster_id;
//                 }
//                 break;
//             }
//         }
//     }

//     return neighboring_clusters;
// }

// int select_new_cluster(int *neighboring_clusters, Cluster *clusters, int num_neighboring_clusters) {
//     double *probabilities = malloc(num_neighboring_clusters * sizeof(double));
//     double sum_inverse_populations = 0;

//     for (int i = 0; i < num_neighboring_clusters; i++) {
//         sum_inverse_populations += 1.0 / clusters[neighboring_clusters[i]].size;
//     }

//     for (int i = 0; i < num_neighboring_clusters; i++) {
//         probabilities[i] = (1.0 / clusters[neighboring_clusters[i]].size) / sum_inverse_populations;
//     }

//     double random_value = (double)rand() / (double)RAND_MAX;
//     double cumulative_probability = 0.0;
//     int selected_neighboring_cluster_idx = 0;

//     for (int i = 0; i < num_neighboring_clusters; i++) {
//         cumulative_probability += probabilities[i];
//         if (random_value <= cumulative_probability) {
//             selected_neighboring_cluster_idx = i;
//             break;
//         }
//     }

//     int selected_cluster_idx = neighboring_clusters[selected_neighboring_cluster_idx];
//     free(probabilities);

//     return selected_cluster_idx;
// }

// void move_unit(Cluster *cluster, Cluster *new_cluster, TU *selected_unit, int selected_unit_idx) {
//     // Add selected unit to the new cluster
//     new_cluster->units[new_cluster->size] = selected_unit;
//     new_cluster->size++;
//     selected_unit->cluster_id = new_cluster->id;

//     // Remove selected unit from the current cluster
//     for (int i = selected_unit_idx; i < cluster->size - 1; i++) {
//         cluster->units[i] = cluster->units[i + 1];
//     }
//     cluster->size--;
// }

// void change_unit(Cluster *clusters, TU **units, int k, int n) {
//     int total_population = calculate_total_population(clusters, k);
//     double *probabilities = calculate_cluster_probabilities(clusters, k, total_population);
//     int selected_cluster_idx = select_cluster(probabilities, k);

//     Cluster *selected_cluster = &clusters[selected_cluster_idx];

//     int* border_units = identify_border_units(units, selected_cluster, n);
//     //int num_border_units = num_of_border_units;  // Let's assume that we also get the number of border units

//     int selected_unit_idx = select_unit_to_move(selected_cluster, total_population / k, border_units, num_border_units);
//     TU *selected_unit = selected_cluster->units[selected_unit_idx];

//     int* neighboring_clusters = identify_neighboring_clusters(units, selected_unit, clusters, n, k);
//     //int num_neighboring_clusters = num_of_neighboring_clusters;  // Let's assume that we also get the number of neighboring clusters

//     int new_cluster_idx = select_new_cluster(neighboring_clusters, clusters, num_neighboring_clusters);
//     Cluster *new_cluster = &clusters[new_cluster_idx];

//     move_unit(selected_cluster, new_cluster, selected_unit, selected_unit_idx);

//     free(probabilities);
//     free(border_units);
//     free(neighboring_clusters);
// }
