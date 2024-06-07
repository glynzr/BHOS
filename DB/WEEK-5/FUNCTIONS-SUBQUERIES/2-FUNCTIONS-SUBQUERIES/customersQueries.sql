# SELECT customerNumber, customerName, state, country FROM customers;

# COUNT OF customers by countries
/* SELECT country, COUNT(*) AS customers_count FROM customers
GROUP BY country; */

# TASK-1 : 'GET COUNT OF CUSTOMERS BY EACH COUNTRY WHERE "COUNT > 10" '
/* SELECT country, COUNT(*) AS customers_count FROM customers
GROUP BY country
HAVING COUNT(*) >= 10
ORDER BY COUNT(*); */


#  TASK-2 :"USING SIMPLE IF : to return N/A if the state is NULL"
/* SELECT 
    customerNumber,
    customerName,
    IF(state IS NULL, 'N/A', state) state,
    country
FROM
    customers; */


# TASK-3 : "to sort customers by states if the state is not NULL,  or sort the country in case the state is NULL"
# "USING ORDER BY WITH CASE"
/* SELECT 
    customerNumber,
    customerName,
    IF(state IS NULL, 'N/A', state) state,
    country
FROM
    customers
ORDER BY (
    CASE 
        WHEN state IS NULL THEN country
        ELSE state
    END
); */

# "Solution with IF statement"
/* SELECT 
    customerNumber,
    customerName,
    IF(state IS NULL, 'N/A', state) state,
    country
FROM
    customers
ORDER BY (
    IF(state IS NULL, country, state)
); */


# TASK-4 : "Select customers and creditLimit, name creditLimit AS 'HIGH' IF > 20000.00 ELSE 'LOW' "
/* SELECT 
    customerNumber,
    customerName,
    IF(creditLimit > 20000.00, 'HIGH', 'LOW') creditLimit,
    country
FROM
    customers; */

# " Append to DIFFERENT COLUMN : customerType "
/* SELECT 
    customerNumber,
    customerName,
    creditLimit,
    IF(creditLimit > 20000.00, 'HIGH', 'LOW') customerType,
    country
FROM
    customers
ORDER BY country; */

# "Several cases : 2 and more cases"
/* SELECT 
    customerNumber,
    customerName,
    creditLimit,
    country,
    CASE
        WHEN creditLimit >= 90000.00 THEN 'HIGH'
        WHEN creditLimit > 50000.00 && creditLimit < 90000.00 THEN 'MID'
        ELSE 'LOW'
    END AS customerType
FROM
    customers
ORDER BY country; */


# SUBQUERIES ---------------------------------------------------------------------------------------------

# TASK-5 : "Find customers whose creditLimit are greater than the average of creditLimit, using a subquery"
/* SELECT 
    customerName, 
    country, 
    creditLimit
FROM
    customers
WHERE
    creditLimit > ( SELECT AVG(creditLimit) FROM customers ); */


# TASK-6 : SIMPLE
/* SELECT 
    customerName, 
    country, 
    creditLimit
FROM
    customers
WHERE
    creditLimit = ( SELECT MAX(creditLimit) FROM customers ); */


