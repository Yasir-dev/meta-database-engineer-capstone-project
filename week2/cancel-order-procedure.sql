USE little_lemon_db;

DROP PROCEDURE IF EXISTS CancelOrder;

DELIMITER \\
CREATE PROCEDURE CancelOrder(IN OrderID INT)
BEGIN
    DELETE FROM Orders WHERE OrderID = OrderID;
    SELECT CONCAT('Order ', OrderID, ' is cancelled.') AS "Confirmation";
END \\
DELIMITER ;

CALL CancelOrder(1);

