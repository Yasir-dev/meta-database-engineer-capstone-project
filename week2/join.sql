USE little_lemon_db;

SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    o.OrderID,
    o.TotalCost,
    m.Name,
    mi.Type
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID,
INNER JOIN Menu o ON o.OrderID = m.OrderID,
INNER JOIN MenuItems mi ON mi.MenuItemID = m.MenuItemID
WHERE o.TotalCost > 150;
