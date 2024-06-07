-- INNER JOIN ----------------------------------------------------------
-- inner join or natural join ------------------------------------------
SELECT members.first_name, members.last_name, movies.title
FROM members, movies
WHERE movies.id = members.movie_id;

-- natural join: syntax-2
SELECT `members`.first_name, `members`.last_name, `movies`.title
FROM members, movies
WHERE `movies`.id = `members`.movie_id;

-- natural join: syntax-3
SELECT A.first_name, A.last_name, B.title
FROM members AS A, movies AS B
WHERE B.id = A.movie_id;

-- natural join: syntax-4
SELECT A.`first_name`, A.`last_name`, B.`title`
FROM members AS A, movies AS B
WHERE B.`id` = A.`movie_id`;

-- INNER JOIN: version-2
SELECT A.`first_name` , A.`last_name` , B.`title` 
FROM `members`AS A INNER JOIN `movies` AS B 
ON B.`id` = A.`movie_id`

-- result ------------------------------------------
+------------+-----------+-------------------------+
| first_name | last_name | title                   |
+------------+-----------+-------------------------+
| Adam       | Smith     | ASSASSINS CREED: EMBERS |
| Rashid     | Kumarbaz  | Real Steel(2012)        |
| Susan      | Davidson  | Safe (2012)             |
| Jenny      | Adrianna  | Deadline 2009           |
| Jasmin     | Sultan    | Marley and me           |
+------------+-----------+-------------------------+
5 rows in set (0.00 sec)

-- OUTER JOINS -------------------------------------------------------
-- LEFT JOIN ---------------------------------------------------------
-- main is `movie`
SELECT A.`first_name` , A.`last_name` , B.`title`
FROM `movies` AS B
LEFT JOIN `members` AS A
ON A.`movie_id` = B.`id`
ORDER BY A.`first_name`;

-- main is `members`
SELECT A.`first_name` , A.`last_name` , B.`title`
FROM `members` AS A
RIGHT JOIN `movies` AS B
ON A.`movie_id` = B.`id`
ORDER BY A.`first_name`;

-- rename column name
ALTER TABLE movies
RENAME COLUMN id TO movie_id;

-- use USING clause
SELECT A.`first_name` , A.`last_name` , B.`title` 
FROM `members`AS A INNER JOIN `movies` AS B 
USING(`movie_id`); 