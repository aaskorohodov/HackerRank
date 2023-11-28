/*
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note

    CITY.CountryCode and COUNTRY.Code are matching key columns.

Input Format

    The CITY and COUNTRY tables are described as follows:

        +-------------+-------------+
        | Field       | Type        |
        +-------------+-------------+
        | ID          | NUMBER      |
        | NAME        | VARCAR2(17) |
        | COUNTRYCODE | VARCAR2(17) |
        | DISTRICT    | VARCAR2(17) |
        | POPULATION  | NUMBER      |
        +-------------+-------------+


        +----------------+----------------+
        | Field          | Type           |
        +----------------+----------------+
        | CODE           | VARCAR2(3)     |
        | NAME           | VARCAR2(44)    |
        | CONTINENT      | VARCAR2(13)    |
        | REGION         | VARCAR2(25)    |
        | SURFACEAREA    | NUMBER         |
        | INDEPYEAR      | VARCAR2(5)     |
        | POPULTAION     | NUMBER         |
        | LIFEEXPECTANCY | VARCAR2(4)     |
        | GNP            | NUMBER         |
        | GNPOLD         | VARCAR2(9)     |
        | LOCALNAME      | VARCAR2(44)    |
        | GOVERNMENTFORM | VARCAR2(44)    |
        | HEADOFSTATE    | VARCAR2(32)    |
        | CAPITAL        | VARCAR2(4)     |
        | CODE2          | VARCAR2(2)     |
        +----------------+----------------+

*/

SELECT CITY.NAME 
FROM CITY, COUNTRY 
WHERE CITY.COUNTRYCODE = COUNTRY.CODE AND CONTINENT = 'Africa';
