/*

Query a count of the number of cities in CITY having a Population larger than 100_000.

The CITY table is described as follows:

+-------------+--------------+
| Field       | Type         |
+-------------+--------------+
| ID          | NUMBER       |
| NAME        | VARCHAR2(17) |
| COUNTRYCODE | VARCHAR2(3)  |
| DISTRICT    | VARCHAR2(20) |
| POPULATION  | NUMBER       |
+-------------+--------------+

*/

SELECT COUNT(*)
FROM CITY
WHERE POPULATION > 100000;