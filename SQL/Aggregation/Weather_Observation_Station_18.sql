/*
Consider P1(a, b) and P2(c, d) to be two points on a 2D plane.

    – a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
    – b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
    – c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
    – d happens to equal the maximum value in Western Longitude (LONG_W in STATION).

Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.

The STATION table is described as follows:

    +-------------+--------------+
    | Field       | Type         |
    +-------------+--------------+
    | ID          | NUMBER       |
    | CITY        | VARCHAR2(21) |
    | STATE       | VARCHAR2(2)  |
    | LAT_N       | NUMBER       |
    | LONG_W      | NUMBER       |
    +-------------+--------------+

    where LAT_N is the northern latitude and LONG_W is the western longitude.

Note: What is Manhattan Distance?

Imagine you are in Manhattan. It (mostly) have a square street grid, which means that (almost) all streets are intersects 
(where they do so) at 90 degree angle. There is a BroadWay, but you are currently far away from it. You need to get from
point A to Point, does not matter where these 2 points are, but they are somewhere on Manhattan. You can not get where
you need to at the shortest path, because there are buildings, so you have walk around them. You want to get there in the
shortest way, still, so you do so, and you have make several turns on intersections:

    A (you are here)
    |
    |
    |
    |__________________________(this is you path)_______
                                                        |
                                                        |
                                                        |
                                                        |
                                                        |
                                                        |
                                                        |
                                                        |
                                                        |________ B (where you need to get)

This is a Manhattan distance - the shortest way possible, but on Manhattan.

Alternativelly you could get where you need this way:

    A (you are here)
    |
    |
    |
    |
    |
    |
    |
    |
    |
    |
    |
    |
    |____________________________________________________________ B (where you need to get)

This would be the same distance, but less turns to make.

To calculate Manhattan Distance having 2 points, you simply need to calulate difference between each 
planes (how much to go down, how much to go right) and summ these 2 numbers. 

*/

SELECT ROUND(
    (MAX(LAT_N) - MIN(LAT_N)) + 
    (MAX(LONG_W) - MIN(LONG_W)),
    4)
FROM STATION;
