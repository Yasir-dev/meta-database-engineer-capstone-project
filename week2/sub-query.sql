use little_lemon_db;

SELECT Name FROM Menu
WHERE MenuID = ANY
(
    SELECT MenuID FROM Orders
    WHERE Quantity > 2
);
