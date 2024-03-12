USE little_lemon_db;

DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER \\
CREATE PROCEDURE CancelBooking(IN BookingID INT)
BEGIN
    DELETE FROM Bookings WHERE BookingID = BookingID;
    SELECT CONCAT('Booking ', BookingID, ' is cancelled.') AS "Confirmation";
END \\
DELIMITER ;

CALL CancelBooking(9);