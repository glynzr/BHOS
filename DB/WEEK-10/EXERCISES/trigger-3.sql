# TASK-3 ----------------------------------------------------------------------------
# 'AFTER UPDATE Trigger' ------------------------------------------------------------

DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
    id INT AUTO_INCREMENT,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    fiscalYear SMALLINT NOT NULL,
    fiscalMonth TINYINT NOT NULL,
    CHECK(fiscalMonth >= 1 AND fiscalMonth <= 12),
    CHECK(fiscalYear BETWEEN 2000 and 2050),
    CHECK (quantity >=0),
    UNIQUE(product, fiscalYear, fiscalMonth),
    PRIMARY KEY(id)
);

INSERT INTO Sales(product, quantity, fiscalYear, fiscalMonth)
VALUES
    ('2001 Ferrari Enzo',140, 2021,1),
    ('1998 Chrysler Plymouth Prowler', 110,2021,1),
    ('1913 Ford Model T Speedster', 120,2021,1);

/* Finally, create a table that stores the changes in the quantity column 
from the sales table */

DROP TABLE IF EXISTS SalesChanges;

CREATE TABLE SalesChanges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    salesId INT,
    beforeQuantity INT,
    afterQuantity INT,
    changedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

/* The following statement creates an AFTER UPDATE trigger on the sales table */

DELIMITER $$
CREATE TRIGGER after_sales_update
AFTER UPDATE
ON Sales FOR EACH ROW
BEGIN
    IF OLD.quantity <> new.quantity THEN
        INSERT INTO SalesChanges(salesId, beforeQuantity, afterQuantity)
        VALUES(old.id, old.quantity, new.quantity);
    END IF;
END$$
DELIMITER ;

/* First, update the quantity of the row to 350 where id is 1 */
UPDATE Sales 
SET quantity = 350
WHERE id = 1;

SELECT * FROM SalesChanges;
