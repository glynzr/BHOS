
-- GROUP BY ----------------------------------------------------------------------------
SELECT division_name, capital, population, region FROM administrative_divisions
GROUP BY region;

-- GROUP BY ----------------------------------------------------------------------------
SELECT region, COUNT(*) FROM administrative_divisions
GROUP BY region;

-- In ARAN region we have 19 divisions, lets prove IT
SELECT division_name, capital, population, region FROM administrative_divisions
WHERE region = 'ARAN';

-- GROUP_CONCAT --------------------------------------------------------------------------
SELECT GROUP_CONCAT(division_name) AS divisions, region, COUNT(*) FROM administrative_divisions
GROUP BY  region;

-- SUM function --------------------------------------------------------------------------
SELECT region, SUM(population) FROM administrative_divisions
GROUP BY region;

-- LETS PROVE THE SUM : SELECT 'Yukhari-Karabakh' REGION
SELECT region, capital, population FROM administrative_divisions
WHERE region = 'Yukhari-Karabakh';

-- MIN, MAX, AVG functions ---------------------------------------------------------------
SELECT MAX(population), MIN(population), AVG(population) FROM administrative_divisions;

SELECT MAX(population), capital FROM administrative_divisions
WHERE region = 'Yukhari-Karabakh';

-- SUBQUERY 1 ---------------------------------------------------------------------------
-- get areas, which greater than average area of regions
-- Method-1
SELECT division_name, capital, area
FROM administrative_divisions
WHERE area > (SELECT AVG(area) FROM administrative_divisions);

-- Method-2
SELECT division_name, capital, area
FROM administrative_divisions
WHERE area BETWEEN 
    (SELECT AVG(area) FROM administrative_divisions)
    AND
    (SELECT MAX(area) FROM administrative_divisions);

-- SUBQUERY 2 ---------------------------------------------------------------------------
-- Method-1
SELECT region, COUNT(*)
FROM administrative_divisions
GROUP BY region
HAVING COUNT(*) >= 5;

-- Metod-2
SELECT tbl.region, tbl.count
FROM (SELECT region, count(*) AS count FROM administrative_divisions GROUP BY region) AS tbl
WHERE tbl.count >= 5;
