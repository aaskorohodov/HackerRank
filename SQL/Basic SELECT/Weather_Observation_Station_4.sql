/*
Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

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

For example, if there are three records in the table with CITY values:

    1. 'New York'
    2. 'New York'
    3. 'Bengalaru'

there are 2 different city names:

    1. 'New York'
    2. 'Bengalaru'

The query returns 1, because:

    (total_number_of_records - number_of_unique_names) = (3 - 2) = 1.
*/

SELECT COUNT(CITY) - COUNT(DISTINCT CITY) AS Difference
FROM STATION
