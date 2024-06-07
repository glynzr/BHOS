-- mysqlAnalytics db

-- 1
-- Try to display comparison of sales of the “current” year with the “previous” year.
select sales_employee,fiscal_year,sale, 
lag(sale,1,0) over(partition by sales_employee) as `prev_year`, 
sale-lag(sale,1,0) over(partition by sales_employee) as `difference` from sales;

-- 2
-- Using partition by fiscal_year, display min sale alongside with 
-- employee name and max sale alongside with employee name.

SELECT 
  sales_employee, 
  fiscal_year, 
  sale, 
  FIRST_VALUE(sales_employee) OVER (
    PARTITION BY fiscal_year
    ORDER BY sale
    ) `min_sale` ,
  FIRST_VALUE(sales_employee) OVER (
    PARTITION BY fiscal_year
    ORDER BY sale DESC
    ) `max_sale` 
FROM 
    sales;


-- Exercise #1:
-- Write a query that ranks the salary values in descending order of all contracts signed by employees numbered 
-- between 10500 and 10600 inclusive. Let equal salary values for one and the same employee bear the same rank. 
-- Also, allow gaps in the ranks obtained for their subsequent rows.
-- Use a join on the “employees” and “salaries” tables to obtain the desired result.
SELECT concat(employees.first_name,' ',employees.last_name) as `employee`,
salaries.salary,salaries.from_date,salaries.to_date,
rank() over (order by salary desc ) `rank`
from employees inner  join salaries 
using(emp_no) where emp_no>=10500 AND emp_no<=10600 ;



-- Exercise #2:
-- Write a query that ranks the salary values in descending order of the following contracts from the "employees" 
-- database:
-- - contracts that have been signed by employees numbered between 10500 and 10600 inclusive.
-- - contracts that have been signed at least 4 full-years after the date when the given employee was hired in 
-- the company for the first time.
-- In addition, let equal salary values of a certain employee bear the same rank. Do not allow gaps in the ranks 
-- obtained for their subsequent rows.
WITH dense as (
    SELECT concat(employees.first_name,' ',employees.last_name) as `employee`,
salaries.salary,salaries.from_date,salaries.to_date,
row_number() over (partition by salaries.emp_no order by from_date) as `contract_num`
from employees inner join salaries using(emp_no) where emp_no>=10500 and emp_no<=10600 
)
select employee,salary,from_date,to_date,
dense_rank() over(order by salary) as `salary_rank`
from dense where contract_num>=4;


-- Exercise #3:
-- Write a query that upon execution retrieves a result set containing all salary values that employee 10560 
-- has ever signed a contract for. Use a window function to rank all salary values from highest to lowest in 
-- a way that equal salary values bear the same rank and that gaps in the obtained ranks for subsequent rows 
-- are allowed.
select * ,
rank() over(order by  salary desc) as `salary_rank`
from salaries
where emp_no=10560;



-- Exercise #4:
-- Write a query that upon execution retrieves a result set containing all salary values that employee 10560 
-- has ever signed a contract for. Use a window function to rank all salary values from highest to lowest in 
-- a way that equal salary values bear the same rank and that gaps in the obtained ranks for subsequent rows 
-- are not allowed.
select * ,
dense_rank() over(order by  salary desc) as `salary_rank`
from salaries
where emp_no=10560;


-- Exercise #1:
-- Create a query that upon execution returns a result set containing the employee numbers, contract salary 
-- values, start, and end dates of the first ever contracts that each employee signed for the company.
-- To obtain the desired output, refer to the data stored in the "salaries" table.
select *,
count(salary) over (partition by emp_no) as `contrat_count`,
first_value(from_date) over(partition by emp_no order by from_date) as `first_start`,
first_value(to_date) over(partition by emp_no order by from_date) as `first_last`
 from salaries;



--  Exercise #2:
-- Write a query that upon execution, displays the number of salary contracts that each manager has ever signed
-- while working in the company.
select dept_manager.emp_no,
count(salary) over (partition by salaries.emp_no) as `contract count`
from dept_manager inner join salaries using(emp_no);




-- Exercise #1:
-- Write a query containing a window function to obtain all salary values that employee number 10560 has ever 
-- signed a contract for. Order and display the obtained salary values from highest to lowest.
select * ,
dense_rank() over(order by salary desc) as `salary rank`
from salaries where emp_no=10560;


-- Exercise #5:
-- Find out the second-lowest salary value each employee has ever signed a contract for. To obtain the desired 
-- output, use a subquery containing a window function, as well as a window specification introduced with the 
-- help of the WINDOW keyword. Moreover, obtain the desired result set without using a GROUP BY clause in the 
-- outer query.
select emp_no,from_date,to_date,salary from (
  select *,
row_number() over W  as `salary_row`
 from salaries WINDOW W as (partition by emp_no order by salary)
) as sub  where sub.salary_row=2;


-- Exercise #4:
-- Once more, find out the lowest salary value each employee has ever signed a contract for. To obtain the 
-- desired output, use a subquery containing a window function, as well as a window specification introduced 
-- with the help of the WINDOW keyword. Moreover, obtain the output without using a GROUP BY clause in the 
-- outer query. To obtain the desired result set, refer only to data from the “salaries” table.
select emp_no,salary from 
(
  select *,
first_value(salary) over  W  as `lowest_salary`
 from salaries WINDOW W as (partition by emp_no order by salary)
) as sub;


-- Exercise #3:
-- Once again, find out the lowest salary value each employee has ever signed a contract for. This time, to 
-- obtain the desired output, avoid using a window function. Just use an aggregate function and a subquery.
-- To obtain the desired result set, refer only to data from the “salaries” table.
select emp_no,min(salary) from salaries GROUP by emp_no;


-- Exercise #2:
-- Again, find out the lowest salary value each employee has ever signed a contract for. Once again, to obtain 
-- the desired output, use a subquery containing a window function. This time, however, introduce the window 
-- specification in the field list of the given subquery.
select * from (
  select *,
FIRST_VALUE(salary) over W  as `lowest_salary`
 from salaries WINDOW W as (partition by emp_no order by salary)
) as sub ;


-- Exercise #2:
-- Obtain a result set containing the salary values each manager has signed a contract for. To obtain the data, 
-- refer to the "employees" database.
-- Use window functions to add the following two columns to the final output:
-- - a column containing the row numbers associated to each manager, where their highest salary has been given 
-- a number equal to the number of rows in the given partition, and their lowest - the number 1.
-- - a column containing the row numbers associated to each manager, where their highest salary has been given 
-- the number of 1, and the lowest - a value equal to the number of rows in the given partition.
-- Let your output be ordered by the salary values associated to each manager in descending order.
select dept_manager.emp_no,salaries.from_date,salaries.to_date,salaries.salary,
row_number() over (partition by emp_no order by salary) as `row_number`
from dept_manager inner join salaries using(emp_no);



