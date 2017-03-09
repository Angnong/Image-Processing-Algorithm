#Algorithms for Tracking#
1. Block matching
2. Particle Filter

## Block Matching ##
Two Dimensional Logarithmic Search
Algorithm describtion
>Start with search location at the center
Select an initial step size say, S = 8
Search for 4 locations at a distance of S from center on the X and Y axes
Find the location of point with least cost function
If a point other than center is the best matching point,
Select this point as the new center
Repeat steps 2 to 3
If the best matching point is at the center, set S = S/2
If S = 1, all 8 locations around the center at a distance S are searched
Set the motion vector as the point with least cost function

## Particle Filter ##


