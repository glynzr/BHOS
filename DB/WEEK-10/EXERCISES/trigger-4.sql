# TASK-4----------------------------------------------------------------------------
# 'BEFORE DELETE trigger' ----------------------------------------------------------

DROP TABLE IF EXISTS Salaries;
CREATE TABLE Salaries (
    employeeNumber INT PRIMARY KEY,
    validFrom DATE NOT NULL,
    amount DEC(12 , 2 ) NOT NULL DEFAULT 0
);

INSERT INTO salaries(employeeNumber,validFrom,amount)
VALUES
    (1002,'2000-01-01',50000),
    (1056,'2000-01-01',60000),
    (1076,'2000-01-01',70000);


/* Create a table that stores the deleted salary */

DROP TABLE IF EXISTS SalaryArchives;    
CREATE TABLE SalaryArchives (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employeeNumber INT PRIMARY KEY,
    validFrom DATE NOT NULL,
    amount DEC(12 , 2 ) NOT NULL DEFAULT 0,
    deletedAt TIMESTAMP DEFAULT NOW()
);

/* The following BEFORE DELETE trigger inserts a new row into the SalaryArchives 
table before a row from the Salaries table is deleted. */

DELIMITER $$
CREATE TRIGGER before_salaries_delete
BEFORE DELETE
ON salaries FOR EACH ROW
BEGIN
    INSERT INTO SalaryArchives(employeeNumber,validFrom,amount)
    VALUES(OLD.employeeNumber,OLD.validFrom,OLD.amount);
END$$    
DELIMITER ;

# Test the trigger -------------------------------------------------------------
DELETE FROM salaries 
WHERE employeeNumber = 1002;

SELECT * FROM SalaryArchives;

DELETE FROM salaries;  # delete all records
SELECT * FROM SalaryArchives;