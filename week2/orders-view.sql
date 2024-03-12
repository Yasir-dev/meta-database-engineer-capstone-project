use little_lemon_db;

DROP VIEW IF EXISTS OrdersView;

CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, Cost FRROM Orders
WHERE Quantity > 2;

SELECT * FROM OrdersView;