# TASK-2 ----------------------------------------------------------------------------
# 'AFTER INSERT Trigger' ------------------------------------------------------------

DROP TABLE IF EXISTS members;
CREATE TABLE members (
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255),
    birthDate DATE,
    PRIMARY KEY (id)
);

/* Second, create another table called reminders that stores reminder 
messages to members. */

DROP TABLE IF EXISTS reminders;
CREATE TABLE reminders (
    id INT AUTO_INCREMENT,
    memberId INT,
    message VARCHAR(255) NOT NULL,
    PRIMARY KEY (id , memberId)
);

/* The following statement creates an AFTER INSERT trigger that inserts 
a reminder into the reminders table if the birth date of the member is NULL. */

DELIMITER $$
CREATE TRIGGER after_members_insert
AFTER INSERT
ON members FOR EACH ROW
BEGIN
    IF NEW.birthDate IS NULL THEN
        INSERT INTO reminders(memberId, message)
        VALUES(new.id, CONCAT('Hi ', NEW.name, ', please update your date of birth.'));
    END IF;
END$$
DELIMITER ;

# Test -------------------------------------------------------------------------------
INSERT INTO members(name, email, birthDate)
VALUES
    ('John Doe', 'john.doe@example.com', NULL),
    ('Jane Doe', 'jane.doe@example.com','2000-01-01');

SELECT * FROM members;

SELECT * FROM reminders;

# TASK: create after insert trigger: After setting password change it after 30 days!