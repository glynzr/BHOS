-- 1. Display ranking of each university by year using below window functions:
-- a. Use RANK(), DENSE_RANK(), ROW_NUMBER();
-- b. Display university_name, year, and country_name.
select country.country_name,university.university_name,university_ranking_year.year,
university_ranking_year.score,
rank() over (partition by year order by score desc) as `rank`,
DENSE_RANK() over(partition by year order by score desc) as `dense_rank`,
ROW_NUMBER() over(partition by year order by score desc) as `row`
from university inner join country on country.id=university.country_id
inner join university_ranking_year on university.id=university_ranking_year.university_id;


-- 2. Write previous task [1] joining CTE (common table expression) with Permanent
-- tables.
with cte_1 as (
    select country.country_name,university.university_name,university_ranking_year.year,
university_ranking_year.score,
rank() over (partition by year order by score desc) as `rank`,
DENSE_RANK() over(partition by year order by score desc) as `dense_rank`,
ROW_NUMBER() over(partition by year order by score desc) as `row`
from university inner join country on country.id=university.country_id
inner join university_ranking_year on university.id=university_ranking_year.university_id
)
select * from cte_1;


-- 3. Find out MIN, MAX and AVG scores of each university using partitions. Display
-- these results alongside with university_name and country_name.
select  distinct university.university_name,country.country_name,
min(score) over (partition by university_name ) as `min_score`,
max(score) over (partition by university_name ) as `max_score`,
avg(score) over (partition by university_name ) as `avg_score`
from university inner join country on country.id=university.country_id
inner join university_ranking_year on university_ranking_year.university_id=university.id;

-- 7. Find out total number of all students and all international students by each
-- academic year:
-- a. Convert result set into CSV format and create Vertical or Horizontal Bar
-- chart displaying total number of all students alongside with all international
-- students by each academic year.
select distinct year,
sum(num_students) over (partition by year) as `total_stud`,
sum(round(num_students*pct_international_students/100)) over (partition by year) as `total_int_stud`
from university_year;

-- 6. Find out total number of female and male students for each country:
-- a. Use Temporary table, when writing queries;
-- b. Convert result set into CSV file format and create Vertical Bar Chart (male
-- and female results in one bar).
create temporary table female_male
select country.country_name,sum(round(university_year.num_students*university_year.pct_female_students/100)) as `female`,sum(num_students)-sum(round(university_year.num_students*university_year.pct_female_students/100)) as `male`
from university inner join country on university.country_id=country.id
inner join university_year on university_year.university_id=university.id group by country_name;
select * from female_male;


-- 4. Display only universities, where number of international students is greater than
-- average number of all international students:
-- a. Use multiple CTE’s.
with c as (
    select university.university_name,
    sum(round(university_year.num_students*pct_international_students/100)) as `int_stud`
from university inner join university_year on  
university.id=university_year.university_id 
group by university_name
), e as (
    select avg(round(university_year.num_students*pct_international_students/100)) as `avg_int_stud`
     from university_year
)
select * from c where c.int_stud> (select avg_int_stud from e);


-- 5. Display number of students by using partition by country:
-- a. display RANK();
-- b. display university_name;
-- c. display total number of all students by each country;
with total as (
    select distinct country.country_name,
sum(university_year.num_students) over (partition by country_name) as `total_stud`
from country inner join university on country.id=university.country_id
inner join university_year on university_year.university_id=university.id
),
uni as (
    select university.university_name,country.country_name
    from university inner join country on university.country_id=country.id
)
select total.country_name,total.total_stud,
rank() over (order by  total_stud desc ) as `rank`,uni.university_name
from total inner join uni using(country_name)
order by total_stud desc;


-- 8. Using window functions, find out the first value and the last value of scores of
-- each university and calculate progress of students (difference between first and
-- last):
-- a. Display all results alongside university_name and year.
select distinct university.university_name,
first_value(score) over (partition by university_name order by year) as `first_score`,
first_value(score) over (partition by university_name order by year desc) as `last_score`,
first_value(score) over (partition by university_name order by year desc)-first_value(score) over (partition by university_name order by year) as `progress`
from university_ranking_year inner join university 
on university.id=university_ranking_year.university_id;