# 'FOREIGN KEY RESTRICTION TYPES AND IMPLEMENTATION'------------------------
/* CREATE DATABASE papers;
USE papers;

CREATE TABLE students(
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50)
);

CREATE TABLE paper(
    title VARCHAR(100) PRIMARY KEY,
    grade INT,
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id)
    ON DELETE CASCADE 
    ON UPDATE CASCADE 
); 

# insert VALUES 
INSERT INTO students (firstName) VALUES 
    ('Roya'), 
    ('Emiliya'), 
    ('Ilkay'), 
    ('Sevilay'), 
    ('Lisa');
     
INSERT INTO paper (student_id, title, grade ) VALUES
    (1, 'My First Book Report', 60),
    (1, 'My Second Book Report', 75),
    (3, 'Introduction to Programming', 94),
    (3, 'The history of Ottoman Empiry', 98),
    (4, 'Magical Realism', 89); */

/* # UPDATE RECORD
UPDATE students
SET id = 10
WHERE firstName = 'Sevilay'; */

/* # DELETE RECORD
DELETE FROM students
WHERE firstName = 'Roya'; */

# 'CHANGING RESTRICTION TYPE'----------------------------------------
/* ALTER TABLE paper
ADD CONSTRAINT 
FOREIGN KEY(student_id) REFERENCES students(id)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT; */

/* # update
UPDATE students
SET id = 33
WHERE firstName = 'Ilkay'; */
/* 
# DELETE 
DELETE FROM students
WHERE firstName = 'Ilkay'; */


# 'ALTER TABLE paper : Deletion all constraints are must!'-----------
/* ALTER TABLE paper
DROP CONSTRAINT fk_studID; 
ALTER TABLE paper
DROP CONSTRAINT fk_studID55;
ALTER TABLE paper
DROP CONSTRAINT fk_studID5544; */

# 'ADDING NEW CONSTRAINT LIKE: UPDATE SET NULL'----------------------
/* ALTER TABLE paper
ADD CONSTRAINT fk_studID99
FOREIGN KEY(student_id) REFERENCES students(id)
    ON UPDATE RESTRICT
    ON DELETE SET NULL; */

/* DELETE FROM students
WHERE id = 10; */