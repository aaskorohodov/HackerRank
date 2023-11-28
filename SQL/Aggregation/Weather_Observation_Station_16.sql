/*
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. 
Round your answer to 4 decimal places.

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

*/

SELECT ROUND(LAT_N, 4)
FROM STATION
WHERE LAT_N > 38.7780
ORDER BY LAT_N ASC
LIMIT 1;

-- Alternative solution

SELECT ROUND(LAT_N, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MIN(LAT_N)
    FROM STATION
    WHERE LAT_N > 38.7880
    LIMIT 1  -- Just to be sure
    );
