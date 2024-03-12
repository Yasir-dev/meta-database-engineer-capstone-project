USE little_lemon_db;

DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER \\
CREATE PROCEDURE UpdateBooking(
    IN BookingID INT,
    IN BookingDate DATE
)
BEGIN
    UPDATE Bookings
    SET BookingDate = BookingDate
    WHERE BookingID = BookingID;
    SELECT CONCAT('Booking ', BookingID, ' is updated.') AS "Confirmation";
END \\
DELIMITER ;

CALL UpdateBooking(9, "2022-12-30");