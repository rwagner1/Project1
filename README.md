# MATLAB Spring 2014 – Research Plan

> * Group Name: giANTs
> * Group participants names: Giandrin Barandun, Raphaela Wagner
> * Project Title: Solving travelling salesman problem using ant colony systems


## General Introduction

The aim of this project is to analyse the navigation behaviour of ants. This is done by using an artificial ant colony system (ACS)
to solve the travelling salesman problem (TSP). The information can be used to examine interesting biological questions as 'how do 
ant colonies find the shortest path from a food source to their nest?' Apart from investigating biological systems the method can also 
be applied to neural networks and evolutionary computation.


## The Model

The used model consists of a number of artificial ants (agents) which are put randomly and complete tours in the network. The decision of the ant which city 
to choose next depends on a random parameter as well as on parameters for the distance between the two cities and the amount of 
pheromone on the edge deposited there by previous ants. For the ant having a memory of the visited cities it will never travel a city
twice. If an ant uses an edge the amount of pheromone on this edge is lowered to avoid a very strong edge (local trail updating).
After every turn the shortest found path gets rewarded with more pheromone (global trail updating). Parameters are: the number of ants, 
weight of length of an edge compared to the amount of pheromone on that edge, influence of the random variable and amount of pheromone change in 
local and global updating.


## Fundamental Questions

1. Analyse TSP model
	a) What is the average tour length obtained with the TSP model?
	b) Comparison of the results to SA, EN and SOM (from literature)
	c) Effect on varying the number cities?
	d) Effect on varying the amount of pheromone?
2. Using ACS on a lattice
	a) Analyse the evolution of the colony in an environment with objects (food and obstacles)
 

## Expected Results

The simple model taken from the biological ecosystem is expected to rapidly lead to a good solution of the TSP which is at least as good 
as or even better than those found by other methods like simulated annealing, neural nets, self organizing map or the genetic algorithm.


## References 

- Ant colonies for the travelling salesman problem, Dorigo M.; Gambardella L.M., 1996
- Trails and U-turns in the selection of a path by the ant Lasius niger, Beckers et al., 1992
- The self-organising clock pattern of Messor pergandei, Goss et al., 1989
- Effective heuristic algorithm for the traveling-salesman problem, Lin S.; Kernighan M.W., 1973



## Research Methods

Agent-Based Model

## Other

Different TSP-datasets from 'TSPlib'
