USE rah_balad;

-- 1
DROP PROCEDURE IF EXISTS GetReservationsByEmail;
DELIMITER //
CREATE PROCEDURE GetReservationsByEmail (
    IN user_email VARCHAR(255)
)
BEGIN
  DECLARE v_user_id CHAR(10);

  SELECT user_id INTO v_user_id
  FROM users
  WHERE email = user_email
  LIMIT 1;

  IF v_user_id IS NOT NULL THEN
    SELECT 
      reservation_id,
      travel_id,
      seat_number,
      reservation_status,
      reservation_date,
      payment_status
    FROM rah_balad.reservations
    WHERE user_id = v_user_id
--       AND payment_status = 'Completed'
    ORDER BY reservation_date;
  ELSE
    SELECT 'User not found by email' AS message;
  END IF;
END;
//
DELIMITER ;

-- 1.1
DROP PROCEDURE IF EXISTS GetReservationsByPhone;
DELIMITER //
CREATE PROCEDURE GetReservationsByPhone (
    IN user_phone CHAR(10)
)
BEGIN
  DECLARE v_user_id CHAR(10);

  SELECT user_id INTO v_user_id
  FROM phone_number
  WHERE phone_number = user_phone
  LIMIT 1;

  IF v_user_id IS NOT NULL THEN
    SELECT 
      reservation_id,
      travel_id,
      seat_number,
      reservation_status,
      reservation_date,
      payment_status
    FROM rah_balad.reservations
    WHERE user_id = v_user_id
--       AND payment_status = 'Completed'
    ORDER BY reservation_date;
  ELSE
    SELECT 'User not found by phone number' AS message;
  END IF;
END;
//
DELIMITER ;


-- 2