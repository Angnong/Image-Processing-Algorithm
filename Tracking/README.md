#Algorithms for Tracking#
1. Block matching
2. Particle Filter

## Block Matching ##
Two Dimensional Logarithmic Search
Algorithm describtion
>1. Start with search location at the center
>
>2. Select an initial step size say, S = 8
>
>3. Search for 4 locations at a distance of S from center on the X and Y axes
>
>4. Find the location of point with least cost function
>
>5. If a point other than center is the best matching point,
>
>   Select this point as the new center
>
>   Repeat steps 2 to 3
>
>6. If the best matching point is at the center, set S = S/2
>
>7. If S = 1, all 8 locations around the center at a distance S are searched
>
>8. Set the motion vector as the point with least cost function

## Particle Filter ##


