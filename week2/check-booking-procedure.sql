USE little_lemon_db;

DROP PROCEDURE IF EXISTS CheckBooking;

CREATE PROCEDURE CheckBooking(IN Date DATE, IN TableNumber INT)
BEGIN
    DECLARE bookingCount INT;
    SELECT COUNT(*) INTO bookingCount FROM Bookings WHERE Date = Date AND TableNumber = TableNumber;
    IF bookingCount > 0 THEN
        SELECT 'Table is already booked.' AS "Message";
    ELSE
        SELECT 'Table is available.' AS "Message";
    END IF;
END

CALL CheckBooking("2022-10-10", 5);