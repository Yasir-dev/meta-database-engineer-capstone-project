USE little_lemon_db;

INSERT INTO Bookings
    (CustomerID, TableNumber, Date)
    VALUES
        (1, 5, "2022-10-10"),
		(3, 3, "2022-11-12"),
		(2, 2, "2022-10-11"),
		(1, 2, "2022-10-13");
        
SELECT * FROM bookings;