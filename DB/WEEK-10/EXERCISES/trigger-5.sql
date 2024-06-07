# TASK-5 ----------------------------------------------------------------------------
#  ----------------------------------------------------------------------------------

/*
A numeric error code like (1146) This number is MySQL specific
A five character SQLSTATE value ("45000") or ("42S02")
The value are taken from ANSI SQL and are more standardized
There is also, A message string : textual description of Error
*/

# SQLSTATE 45000 is 'unhandled, user defined exception. It is for developers to use!'

# Create a table `users` with columns: `username`, `age` ---------------------------
DELIMITER $$
CREATE TRIGGER must_be_adult
    BEFORE INSERT ON users FOR EACH ROW
    BEGIN
        IF NEW.age < 18
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Must be an adult!';
        END IF;
    END;
$$
DELIMITER ;


# TASK: Create table `username`, `password` ------------------------------------------
# perevent user to have the same old and new passwords!
DELIMITER $$
CREATE TRIGGER must_be_different
    BEFORE UPDATE ON users FOR EACH ROW
    BEGIN
        IF NEW.password = OLD.password
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Your new password should be the same as the old one!';
        END IF;
    END;
$$
DELIMITER ;


# TASK: Create table `Student`-------------------------------------------------------- 

| Field | Type        | Null | Key | Default | Extra          | 
+-------+-------------+------+-----+---------+----------------+ 
| tid   | int(4)      | NO   | PRI | NULL    | auto_increment | 
| name  | varchar(30) | YES  |     | NULL    |                | 
| subj1 | int(2)      | YES  |     | NULL    |                | 
| subj2 | int(2)      | YES  |     | NULL    |                | 
| subj3 | int(2)      | YES  |     | NULL    |                | 
| total | int(3)      | YES  |     | NULL    |                | 
| per   | int(3)      | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------

/* TASK:
Create a trigger in the student database in which whenever subjects marks are entered, 
before inserting this data into the database, trigger will compute those two values and 
insert with the entered values */

CREATE TRIGGER stud_marks 
BEFORE INSERT ON Student 
FOR EACH ROW 
SET Student.total = Student.subj1 + Student.subj2 + Student.subj3, 
    Student.per = Student.total * 60 / 100;


# test it
insert into Student values(0, "ABCDE", 20, 20, 20, 0, 0);