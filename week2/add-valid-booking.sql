USE little_lemon_db;

DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //

CREATE PROCEDURE AddValidBooking (IN BookingDate DATE, IN TableNumber INT)
BEGIN
    DECLARE TableAvailable INT;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET TableAvailable = NULL;

    START TRANSACTION;

    -- Check if the table is already booked on the given date
    SELECT COUNT(*) INTO TableAvailable
    FROM Bookings
    WHERE Date = BookingDate AND TableNumber = TableNumber;

    IF TableAvailable IS NOT NULL AND TableAvailable > 0 THEN
        -- Table is already booked, rollback the transaction
        ROLLBACK;
        SELECT CONCAT('Table ', TableNumber, ' is already booked - booking cancelled.');
    ELSE
        -- Table is available, proceed with the booking
        INSERT INTO Bookings (BookingDate, TableNo)
        VALUES (booking_date, table_no);

        -- Commit the transaction
        COMMIT;
        SELECT 'Booking successfully made.';
    END IF;
END //

DELIMITER ;