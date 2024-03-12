USE little_lemon_db;

DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER \\
CREATE PROCEDURE AddBooking(
    IN BookingID INT,
    IN CustomerID INT,
    IN TableNumber INT,
    IN BookingDate Date,
)
BEGIN
    INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber)
    VALUES (BookingID, CustomerID, BookingDate, TableNumber);
    SELECT 'New Booking Added' AS "Confirmation";
END \\
DELIMITER ;

CALL AddBooking(9, 3, 4, "2022-12-30");