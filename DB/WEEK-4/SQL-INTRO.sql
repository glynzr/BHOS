-- SELECT * FROM country;

-- SELECT * FROM city;

-- creating of database
-- CREATE DATABASE mydata;
-- USE mydata;

-- creating of table
-- CREATE TABLE sample1 (
--    id int(5) auto_increment primary key,
--    name varchar(50) not null,
--    surname varchar(50),
--    email varchar(40)
-- );

-- inserting of datas into table
-- INSERT INTO sample1 (name, surname, email)
-- VALUES
-- ('Cavid', 'Isayev', 'cavid@gmail.com'),
-- ('Samira', 'Isayeva', 'Samira@gmail.com'),
-- ('Arzu', 'Musayeva', 'arzu@gmail.com');

-- INSERT INTO sample1 (surname, email)
-- VALUES
-- ('Cavidovich', 'cavid@gmail.com');

-- DROP TABLE sample1;

-- ALTER TABLE options
-- ALTER TABLE sample1
-- ADD age INT(3) AFTER surname;

-- ALTER TABLE sample1
-- DROP COLUMN age;

-- NOT NULL constraint -------------------------------
-- CREATE TABLE registration (
--    id int(5) auto_increment primary key,
--    name varchar(40) not null,
--    surname varchar(40),
--    age int(2)
-- );

-- CHECK constraint ----------------------------------
-- ALTER TABLE registration
-- ADD CHECK (age >= 18);

-- inserting of data
-- INSERT INTO registration(name, surname, age)
-- VALUES
-- ('ali', 'valiyev', 19),
-- ('vali', 'aliyev', 20);

-- update data
-- UPDATE registration
-- SET age = 21 WHERE surname = 'aliyev';

-- delete data
-- DELETE FROM registration
-- WHERE id >= 5;

-- INSERT INTO registration(name, surname, age)
-- VALUES
-- ('mali', 'valiyev', 19),
-- ('arzu', 'aliyev', 22),
-- ('alma', 'vali', 22),
-- ('armud', 'mammadov', 22),
-- ('mammad', 'malik', 22),
-- ('ahmad', 'sariyev', 22),
-- ('humbat', 'qarayev', 22);

-- simple sql queries --------------------------------
-- SELECT * FROM registration
-- WHERE age = 22;

-- LIKE operator
-- SELECT * FROM registration
-- WHERE age = 22 AND surname LIKE '%m%';

-- DELETE FROM registration
-- WHERE id >= 18;

-- LIMIT, OFFSET operators
-- SELECT * FROM registration
-- WHERE age = 22
-- LIMIT 2, 3;