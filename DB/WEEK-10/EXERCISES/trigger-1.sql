# TASK-1 ----------------------------------------------------------------------------
# 'BEFORE UPDATE Trigger' -----------------------------------------------------------

CREATE TABLE emloyees_audit(
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50),
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

CREATE TRIGGER before_employee_update
    BEFORE UPDATE ON employees
    FOR EACH ROW
    INSERT INTO emloyees_audit
    SET action = 'update',
    employeeNumber = OLD.employeeNumber,
    lastname = OLD.lastname,
    changedat = NOW();

UPDATE employees
SET lastName = 'Arzu'
WHERE employeeNumber = 1056;