/*
create database movies;
use movies;

CREATE TABLE movies(
id INT(5) AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(55),
category VARCHAR(25)
);

CREATE TABLE members(
id INT(5) AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
movie_id INT(5)
);
*/

/* ALTER TABLE members
    ADD CONSTRAINT fk_members_id
    FOREIGN KEY (movie_id) REFERENCES movies(id)
    ON UPDATE CASCADE ON DELETE SET NULL; */

/* INSERT INTO movies(title, category)
VALUES
('ASSASSINS CREED: EMBERS', 'Animations'),
('Real Steel(2012)',	'Animations'),
('Alvin and the Chipmunks', 'Animations'),
('The Adventures of Tin-Tin', 'Animations'),
('Safe (2012)', 'Action'),
('Safe House(2012)', 'Action'),
('GIA', '18+'),
('Deadline 2009', '18+'),
('The Dirty Picture', '18+'),
('Marley and me', 'Romance'); */

/* INSERT INTO members(first_name, last_name, movie_id)
VALUES
('Adam', 'Smith', 1),
('Rashid', 'Kumarbaz', 2),
('Susan', 'Davidson', 5),
('Jenny', 'Adrianna', 8),
('Jasmin',	'Sultan', 10); */

# INNER JOIN
/* SELECT members.`first_name` , members.`last_name` , movies.`title`
FROM members ,movies
WHERE movies.`id` = members.`movie_id`; */

# LEFT OUTER JOIN, 'main is movie'
/* SELECT A.`title` , B.`first_name` , B.`last_name`
FROM `movies` AS A
LEFT JOIN `members` AS B
ON B.`movie_id` = A.`id`
ORDER BY first_name; */

# RIGHT OUTER JOIN, 'main is members'
/* SELECT  A.`first_name` , A.`last_name`, B.`title`
FROM `members` AS A
RIGHT JOIN `movies` AS B
ON B.`id` = A.`movie_id` */


/* ALTER TABLE members ENGINE = InnoDB;
ALTER TABLE movies ENGINE = InnoDB; */