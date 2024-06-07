-- MYSQl STRING FUNCTIONS -------------------------------------------------------------------

-- CONCATINATION OF STRINGS: CONCAT (column, anothercolumn) ---------------------------------
/*
SELECT CONCAT(division_name, ",", capital) AS capitals FROM administrative_divisions;
*/

-- CONCAT_WS('separator', column1, column2,...columnN)
/*
SELECT CONCAT_WS(' - ', division_name, capital) AS capitals FROM administrative_divisions;
*/

-- SUBSTRING --------------------------------------------------------------------------------
/*
SELECT CONCAT(
	SUBSTRING(division_name, 1, 10), "...") AS division_short
	FROM administrative_divisions;
*/
-- Using CONCAT WITH SUBSTRING
/*
SELECT CONCAT(
		SUBSTRING(division_name, 1, 10), "..."
	) AS division_short,
	CONCAT(
		SUBSTRING(capital, 1, 3), "..."
	) AS capital_short
FROM administrative_divisions;
*/

-- REPLACE --------------------------------------------------------------------------------
/*
SELECT 
	REPLACE(capital, 'A', 'AAA') AS newcol
FROM administrative_divisions;
*/

# UPPER CASE and LOWER CASE --------------------------------------------------------------
/*
SELECT CONCAT(
	'My favorite city is ', UPPER(capital)
) AS FAV_CITIES 
FROM administrative_divisions;
*/