/* SELECT * FROM states GROUP BY join_year; */

/* SELECT * FROM states WHERE join_year = 1787; */

/* SELECT COUNT(*), join_year FROM states GROUP BY join_year; */

/* SELECT COUNT(*) FROM states; */

/* SELECT COUNT(*) FROM states WHERE join_year = 1788; */

/* SELECT MIN(population), MAX(population), AVG(population) FROM states; */

/* SELECT GROUP_CONCAT(name SEPARATOR ', ') AS STATES, join_year
FROM states GROUP BY join_year; */

/* SELECT SUM(population) FROM states; */

/* SELECT 
    SUM(
        IF(population > 5000000, 1, 0)
    ) AS big_states,
    SUM(
        IF(population <= 5000000, 1, 0)
    ) AS small_states
FROM states; */

/* SELECT
COUNT(*),
CASE
    WHEN population > 5000000 THEN 'big'
    WHEN population > 1000000 THEN 'medium'
    ELSE 'small' END
AS state_size
FROM states GROUP BY state_size; */

/* SELECT COUNT(*), join_year FROM states
GROUP BY join_year
WHERE COUNT(*) > 1; */

/* SELECT * FROM states WHERE population = (
    SELECT MAX(population) FROM states
); */

/* SELECT * FROM states WHERE join_year = (
    SELECT MAX(join_year) FROM states
); */

/* SELECT * FROM states WHERE join_year IN (
    SELECT join_year FROM states
    GROUP BY join_year
    HAVING COUNT(*) > 1
) ORDER BY join_year; */

(SELECT * FROM states WHERE name LIKE 'n%')
UNION
(SELECT * FROM states WHERE population > 10000000);