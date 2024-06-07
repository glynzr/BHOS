DROP DATABASE IF EXISTS universities;
CREATE DATABASE universities;


DROP TABLE IF EXISTS universities.country;

CREATE TABLE universities.country (
  id INT NOT NULL AUTO_INCREMENT,
  country_name varchar(100) DEFAULT NULL,
  CONSTRAINT pk_country PRIMARY KEY (id)
);

DROP TABLE IF EXISTS universities.ranking_system;

CREATE TABLE universities.ranking_system (
  id INT NOT NULL AUTO_INCREMENT,
  system_name VARCHAR(100) DEFAULT NULL,
  CONSTRAINT pk_ranksys PRIMARY KEY (id)
);

DROP TABLE IF EXISTS universities.ranking_criteria;

CREATE TABLE universities.ranking_criteria (
  id INT NOT NULL AUTO_INCREMENT,
  ranking_system_id INT DEFAULT NULL,
  criteria_name VARCHAR(200) DEFAULT NULL,
  CONSTRAINT pk_rankcrit PRIMARY KEY (id),
  CONSTRAINT fk_rc_rs FOREIGN KEY (ranking_system_id) REFERENCES universities.ranking_system (id)
);

DROP TABLE IF EXISTS universities.university;

CREATE TABLE universities.university (
  id INT NOT NULL AUTO_INCREMENT,
  country_id INT DEFAULT NULL,
  university_name VARCHAR(200) DEFAULT NULL,
  CONSTRAINT pk_uni PRIMARY KEY (id),
  CONSTRAINT fk_uni_cnt FOREIGN KEY (country_id) REFERENCES universities.country (id)
);

DROP TABLE IF EXISTS universities.university_year;

CREATE TABLE universities.university_year (
  university_id INT DEFAULT NULL,
  year INT DEFAULT NULL,
  num_students INT DEFAULT NULL,
  student_staff_ratio DECIMAL(6,2) DEFAULT NULL,
  pct_international_students INT DEFAULT NULL,
  pct_female_students INT DEFAULT NULL,
  CONSTRAINT fk_uy_uni FOREIGN KEY (university_id) REFERENCES universities.university (id)
);

DROP TABLE IF EXISTS universities.university_ranking_year;

CREATE TABLE universities.university_ranking_year (
  university_id INT DEFAULT NULL,
  ranking_criteria_id INT DEFAULT NULL,
  year INT DEFAULT NULL,
  score INT DEFAULT NULL,
  CONSTRAINT fk_ury_rc FOREIGN KEY (ranking_criteria_id) REFERENCES universities.ranking_criteria (id),
  CONSTRAINT fk_ury_uni FOREIGN KEY (university_id) REFERENCES universities.university (id)
);

-- VARIANT B

-- TASK 1

-- Display number of students by using partition by country.
-- Display RANK()
-- Display university_name
-- Display total number of students by each country. 

SELECT 
country.country_name, 
university.university_name, 
university_year.num_students, 
university_year.year,
RANK() OVER (PARTITION BY country_id ORDER BY num_students DESC) AS country_rank
FROM university INNER JOIN country INNER JOIN university_year 
ON university.country_id = country.id 
AND university.id = university_year.university_id;

-- TASK 2

-- Find out MIN, MAX, AVG scores of each university using partitions. 
-- Display these results alongside with university_name and country_name.

SELECT
c.country_name,
u.university_name,
MIN(ur.score) AS min_score,
MAX(ur.score) AS max_score,
AVG(ur.score) AS avg_score
FROM university_ranking_year AS ur INNER JOIN university AS u INNER JOIN country AS c
ON ur.university_id = u.id AND u.country_id = c.id
GROUP BY c.country_name, u.university_name;
 
-- TASK 3

-- Display only universities, where number of female students is greater than
-- than average number of all female students: use
-- multiple common table expressions. 

WITH AvgFemale AS (
    SELECT AVG(pct_female_students) AS avg_female_students FROM university_year
),
FilteredUniversities AS (
    SELECT u.university_name, university_year.year, university_year.pct_female_students
    FROM university AS u INNER JOIN university_year INNER JOIN AvgFemale
    ON university_year.pct_female_students > AvgFemale.avg_female_students 
    AND u.id = university_year.university_id
)
SELECT university_name, year, pct_female_students FROM FilteredUniversities 
ORDER BY university_name, year;

-- TASK 4

-- Find out total number of female and male students for each country: 
-- Use temporary table while writing queries and convert result set into CSV format and create 
-- vertical bar chart. 

WITH StudentGenderCounts AS (
    SELECT
        c.country_name,
        ROUND(SUM(u.num_students * u.pct_female_students / 100)) AS female_students,
        ROUND(SUM(u.num_students * (100 - u.pct_female_students) / 100)) AS male_students
    FROM
        universities.university_year AS u
    INNER JOIN
        universities.university AS uni ON u.university_id = uni.id
    INNER JOIN
        universities.country AS c ON uni.country_id = c.id
    GROUP BY
        c.country_name
)
SELECT country_name, female_students, male_students
FROM StudentGenderCounts
ORDER BY country_name;   

-- TASK 5

-- Find out total number of all students and all international students by each academic year:
-- Convert result set into CSV format and create vertical or horizontal bar chart displaying total number of 
-- all students alongside with the international students by each academic year. 

WITH StudentCounts AS (
    SELECT
        year,
        SUM(num_students) AS total_students,
        ROUND(SUM(pct_international_students * num_students / 100)) AS international_students
    FROM
        universities.university_year
    GROUP BY
        year
)
SELECT year, total_students, international_students
FROM StudentCounts ORDER BY year;

-- TASK 6-7

WITH StudentStats AS (
    SELECT
        u.university_name,
        uy.year,
        FIRST_VALUE(uy.num_students) OVER (PARTITION BY u.university_name ORDER BY uy.year) AS first_student_count,
        LAST_VALUE(uy.num_students) OVER (PARTITION BY u.university_name ORDER BY uy.year ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_student_count
    FROM
        universities.university_year AS uy
    INNER JOIN
        universities.university AS u ON uy.university_id = u.id
)
SELECT
    university_name,
    year,
    first_student_count,
    last_student_count,
    (last_student_count - first_student_count) AS difference
FROM
    StudentStats;

-- TASK 8

WITH UniversityRankings AS (
    SELECT
        u.university_name,
        uy.year,
        c.country_name,
        RANK() OVER (PARTITION BY uy.year ORDER BY uy.num_students DESC) AS rank_by_year_rank,
        DENSE_RANK() OVER (PARTITION BY uy.year ORDER BY uy.num_students DESC) AS rank_by_year_dense_rank,
        ROW_NUMBER() OVER (PARTITION BY uy.year ORDER BY uy.num_students DESC) AS rank_by_year_row_number
    FROM
        universities.university_year uy
    JOIN
        universities.university u ON uy.university_id = u.id
    JOIN
        universities.country c ON u.country_id = c.id
)
SELECT
    university_name,
    year,
    country_name,
    rank_by_year_rank,
    rank_by_year_dense_rank,
    rank_by_year_row_number
FROM
    UniversityRankings;