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


void reset_visited(Cluster *cluster)
{
    for (int i = 0; i < cluster->size; i++)
    {
        cluster->units[i]->visited = 0;
    }
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
    return num_visited == cluster->size - 1;

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
        return;
    }
    current_cluster->border_units = (TU **)calloc(current_cluster->size, sizeof(TU *));
    int border_unit_count = 0;

 
    for (int i = 0; i < current_cluster->size; i++)
    {
        bool is_border_unit = false;
        for (int j = 0; j < current_cluster->units[i]->num_neighbors; j++)
        {
           
            for (int k = 0; k < neighbor_cluster->size; k++)
            {
                if (current_cluster->units[i]->neighbor_codes[j] == neighbor_cluster->units[k]->code)
                {
                    if (!is_border_unit)
                    {
                        current_cluster->border_units[border_unit_count++] = current_cluster->units[i];
                        is_border_unit = true;
                    }
                    break;
                }
            }
        }
      
    }   
    for (int i = 0; i < current_cluster->size; i++)
    {
        current_cluster->num_border_units = border_unit_count;
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

bool is_cluster_contiguous(Cluster *cluster, int exclude_index)
{
    if (cluster->size < 1) return false;

    int *visited = calloc(cluster->size, sizeof(int));
    int num_visited = 0;
    int start_index = (exclude_index == 0) ? 1 : 0;

    dfs_contiguity_exclude(start_index, exclude_index, cluster, visited);

    for (int i = 0; i < cluster->size; i++)
    {
        if (cluster->units[i]->unit_id != exclude_index && visited[i]) num_visited++;
    }

    free(visited);
    return num_visited == cluster->size - 1;
}

void change_unit(Cluster *clusters, TU **units, int k, int n, int ideal_population) {
    identify_border_units(units, clusters, n, k);

    int max_deviation_cluster_idx = select_cluster_with_max_deviation(clusters, k, ideal_population);
    
    Cluster *max_dev_cluster = &clusters[max_deviation_cluster_idx];
    int *neighboring_clusters = (int *)calloc(k, sizeof(int));

    populate_neighboring_clusters(neighboring_clusters, max_dev_cluster, units, k);

    int num_neighboring_clusters = count_non_zero(neighboring_clusters, k);
    if (num_neighboring_clusters == 0) {
        free(neighboring_clusters);
        return;
    }

    int neighboring_cluster_idx = choose_neighboring_cluster(neighboring_clusters, clusters, k);
    Cluster *neighboring_cluster = &clusters[neighboring_cluster_idx];

    if (max_dev_cluster->population > neighboring_cluster->population) {
        process_cluster(max_dev_cluster, neighboring_cluster, clusters, k);
    } else {
        process_cluster(neighboring_cluster, max_dev_cluster, clusters, k);
    }

    free(neighboring_clusters);
}

int select_cluster_with_max_deviation(Cluster *clusters, int k, int ideal_population) {
    if (rand() % 100 < 80) {
        int max_deviation = -1;
        int max_deviation_cluster_idx = -1;
        for (int i = 0; i < k; i++) {
            int deviation = compute_deviation(clusters[i], ideal_population);
            if (deviation > max_deviation) {
                max_deviation = deviation;
                max_deviation_cluster_idx = i;
            }
        }
        return max_deviation_cluster_idx;
    }

    int random_cluster_idx;
    do {
        random_cluster_idx = rand() % k;
    } while (clusters[random_cluster_idx].size <= 1);
    return random_cluster_idx;
}

void populate_neighboring_clusters(int *neighboring_clusters, Cluster *max_dev_cluster, TU **units, int k) {
    for (int i = 0; i < max_dev_cluster->num_border_units; i++) {
        int unit_id = max_dev_cluster->border_units[i]->unit_id;
        TU *unit = units[unit_id];
        for (int j = 0; j < unit->num_neighbors; j++) {
            int neighbor_cluster_idx = units[unit->neighbor_ids[j]]->cluster_id;
            if (neighbor_cluster_idx != max_dev_cluster->id && neighboring_clusters[neighbor_cluster_idx] == 0) {
                neighboring_clusters[neighbor_cluster_idx] = 1;
            }
        }
    }
}

int count_non_zero(int *array, int length) {
    int count = 0;
    for (int i = 0; i < length; i++) {
        if (array[i] != 0) {
            count++;
        }
    }
    return count;
}

int choose_neighboring_cluster(int *neighboring_clusters, Cluster *clusters, int k) {
    int neighboring_cluster_idx;
    do {
        neighboring_cluster_idx = rand() % k;
    } while (clusters[neighboring_cluster_idx].size <= 1 || neighboring_clusters[neighboring_cluster_idx] == 0);
    return neighboring_cluster_idx;
}

void process_cluster(Cluster *source_cluster, Cluster *target_cluster, Cluster *clusters, int k) {
    find_border_units(clusters, k, source_cluster->id, target_cluster->id);
    int border_unit_count = source_cluster->num_border_units;
    if (border_unit_count <= 0) {
        return;
    }

    int *contiguous_movements = NULL;
    int contiguous_movement_count = 0;
    for (int i = 0; i < border_unit_count; i++) {
        TU *border_unit = source_cluster->border_units[i];
        if (!border_unit) {
            continue;
        }

        int unit_index = find_unit_index_in_cluster(source_cluster, border_unit->unit_id);
        if (unit_index == -1) {
            continue;
        }

        int moved_unit_index_in_target = target_cluster->size;
        move_unit(source_cluster, target_cluster, unit_index);

        if (is_cluster_contiguous(source_cluster, border_unit->unit_id)) {
            contiguous_movements = realloc(contiguous_movements, (contiguous_movement_count + 1) * sizeof(int));
            contiguous_movements[contiguous_movement_count++] = i;
        }

        move_unit(target_cluster, source_cluster, moved_unit_index_in_target);
    }

    if (contiguous_movement_count > 0) {
        int random_index = rand() % contiguous_movement_count;
        int chosen_unit_index = contiguous_movements[random_index];
        TU *chosen_border_unit = source_cluster->border_units[chosen_unit_index];

        int unit_index = find_unit_index_in_cluster(source_cluster, chosen_border_unit->unit_id);
        move_unit(source_cluster, target_cluster, unit_index);
    }

    free(source_cluster->border_units);
    source_cluster->border_units = NULL;
    if (contiguous_movements) {
        free(contiguous_movements);
    }
}

int find_unit_index_in_cluster(Cluster *cluster, int unit_id) {
    for (int j = 0; j < cluster->size; j++) {
        if (cluster->units[j]->unit_id == unit_id) {
            return j;
        }
    }
    return -1;
}
