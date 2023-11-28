/*
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 317.2345. 
Truncate your answer to 4 decimal places.

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

SELECT ROUND(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N >= 38.7880 AND LAT_N <= 137.2345;

-- Alternative solution

SELECT ROUND(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N BETWEEN 38.7880 AND 137.2345;

/*
Wrong solution

    SELECT ROUND(SUM(LAT_N), 4)
    FROM STATION
    WHERE 38.7880 < LAT_N < 137.2345

This solution would not work in MySQL (and several other dialects) because of how '38.7880 < LAT_N < 137.2345' is evaluated.
In MySQL, the engines firstly evaluetes '38.7880 < LAT_N' to true or false, and than compares result with 'rue/false < 137.2345'.

*/
