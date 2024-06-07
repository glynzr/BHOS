--TASK 1

SELECT u.university_name, uyr.year, c.country_name,
    RANK() OVER(PARTITION BY uyr.year ORDER BY ur.score DESC) AS rank_using_rank,
    DENSE_RANK() OVER(PARTITION BY uyr.year ORDER BY ur.score DESC) AS rank_using_dense_rank,
    ROW_NUMBER() OVER(PARTITION BY uyr.year ORDER BY ur.score DESC) AS rank_using_row_number
FROM universities.university_ranking_year ur
JOIN universities.university u ON ur.university_id = u.id
JOIN universities.university_year uyr ON ur.university_id = uyr.university_id AND ur.year = uyr.year
JOIN universities.country c ON u.country_id = c.id
ORDER BY uyr.year, rank_using_rank;


--TASK 2

WITH UniversityRanking AS (
    SELECT 
        ur.university_id,
        ur.year,
        RANK() OVER(PARTITION BY ur.year ORDER BY ur.score DESC) AS rank_using_rank,
        DENSE_RANK() OVER(PARTITION BY ur.year ORDER BY ur.score DESC) AS rank_using_dense_rank,
        ROW_NUMBER() OVER(PARTITION BY ur.year ORDER BY ur.score DESC) AS rank_using_row_number
    FROM universities.university_ranking_year ur
),
UniversityInfo AS (
    SELECT 
        u.id AS university_id,
        u.university_name,
        uyr.year,
        c.country_name
    FROM universities.university u
    JOIN universities.university_year uyr ON u.id = uyr.university_id
    JOIN universities.country c ON u.country_id = c.id
)
SELECT 
    ui.university_name,
    ui.year,
    ui.country_name,
    ur.rank_using_rank,
    ur.rank_using_dense_rank,
    ur.rank_using_row_number
FROM UniversityInfo ui
JOIN UniversityRanking ur ON ui.university_id = ur.university_id AND ui.year = ur.year
ORDER BY ui.year, ur.rank_using_rank;


--TASK 3

WITH UniversityScores AS (
    SELECT 
        ur.university_id,
        u.university_name,
        c.country_name,
        ur.score,
        MIN(ur.score) OVER (PARTITION BY ur.university_id) AS min_score,
        MAX(ur.score) OVER (PARTITION BY ur.university_id) AS max_score,
        AVG(ur.score) OVER (PARTITION BY ur.university_id) AS avg_score
    FROM universities.university_ranking_year ur
    JOIN universities.university u ON ur.university_id = u.id
    JOIN universities.country c ON u.country_id = c.id
)
SELECT 
    university_name,
    country_name,
    min_score,
    max_score,
    avg_score
FROM UniversityScores
GROUP BY university_id;


--TASK 4

WITH InternationalStudents AS (
    SELECT university_id, pct_international_students
    FROM universities.university_year
),
AverageInternationalStudents AS (
    SELECT AVG(pct_international_students) AS avg_international_students
    FROM InternationalStudents
),
UniversitiesAboveAverage AS (
    SELECT
        u.id AS university_id,
        u.university_name,
        c.country_name,
        i.pct_international_students
    FROM universities.university u
    JOIN universities.country c ON u.country_id = c.id
    JOIN universities.university_year i ON u.id = i.university_id
    JOIN AverageInternationalStudents a ON 1=1
    WHERE i.pct_international_students > a.avg_international_students
)
SELECT university_name, country_name, pct_international_students
FROM UniversitiesAboveAverage;


--TASK 5

WITH StudentRank AS (
    SELECT 
        country_name,
        university_name,
        num_students,
        RANK() OVER (PARTITION BY country_name ORDER BY num_students DESC) AS student_rank
    FROM universities.university_year uy
    JOIN universities.university u ON uy.university_id = u.id
    JOIN universities.country c ON u.country_id = c.id
),
TotalStudentsByCountry AS (
    SELECT 
        country_name,
        SUM(num_students) AS total_students
    FROM universities.university_year uy
    JOIN universities.university u ON uy.university_id = u.id
    JOIN universities.country c ON u.country_id = c.id
    GROUP BY country_name
)
SELECT 
    sr.country_name,
    sr.university_name,
    sr.num_students,
    sr.student_rank,
    tsc.total_students
FROM StudentRank sr
JOIN TotalStudentsByCountry tsc ON sr.country_name = tsc.country_name;


--TASK 6

CREATE TEMPORARY TABLE gender_country as (
SELECT 
    country_id,
    SUM(num_students) AS total_students,
    SUM(CASE WHEN pct_female_students 
    IS NOT NULL THEN ROUND(num_students * pct_female_students / 100) ELSE 0 END) 
    AS total_female,
    SUM(num_students) - SUM(CASE WHEN pct_female_students IS NOT NULL THEN 
    ROUND(num_students * pct_female_students / 100) ELSE 0 END) 
    AS total_male
FROM universities.university_year 
JOIN universities.university ON university_id = id
GROUP BY country_id
);

SELECT 
    country_name,
   total_students,
    total_female,
   total_male
FROM gender_country 
INNER JOIN universities.country ON country_id =id;


--TASK 7

SELECT 
    year,
    SUM(num_students) AS total_students,
    ROUND(SUM(num_students * pct_international_students / 100)) AS total_international_students
FROM universities.university_year
GROUP BY year;


--TASK 8

SELECT
    university_name,
    year,
    FIRST_VALUE(score) OVER (PARTITION BY university_id ORDER BY year) AS first_score,
    LAST_VALUE(score) OVER (PARTITION BY university_id ORDER BY year ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_score,
    LAST_VALUE(score) OVER (PARTITION BY university_id ORDER BY year ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) - FIRST_VALUE(score) OVER (PARTITION BY university_id ORDER BY year) AS progress
FROM universities.university_ranking_year AS ury
JOIN universities.university AS u ON ury.university_id = u.id;
