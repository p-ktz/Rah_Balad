USE rah_balad;


-- 1
DROP PROCEDURE IF EXISTS GetReservationsByEmail;
DELIMITER //
CREATE PROCEDURE GetReservationsByEmail (IN user_email VARCHAR(255))
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
// DELIMITER ;

CALL GetReservationsByEmail('ali.ahmadi@example.com');
CALL GetReservationsByEmail('ladan.farhadi@example.com');


-- 1.1
DROP PROCEDURE IF EXISTS GetReservationsByPhone;
DELIMITER //
CREATE PROCEDURE GetReservationsByPhone (IN user_phone CHAR(10))
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
// DELIMITER ;

CALL GetReservationsByPhone('9121234567');
CALL GetReservationsByPhone('9301234567');
CALL GetReservationsByPhone('9013344556');


-- 2
DROP PROCEDURE IF EXISTS GetRejectedUsersByAdminEmail;
DELIMITER //
CREATE PROCEDURE GetRejectedUsersByAdminEmail (IN admin_email VARCHAR(255))
BEGIN
  DECLARE v_admin_id CHAR(10);

  SELECT user_id INTO v_admin_id
  FROM users
  WHERE email = admin_email AND user_role = 'Admin'
  LIMIT 1;

  IF v_admin_id IS NOT NULL THEN
    SELECT DISTINCT u.user_id, u.first_name, u.last_name
    FROM rah_balad.get_checked gc
    JOIN rah_balad.reservations r ON gc.reservation_id = r.reservation_id
    JOIN rah_balad.users u ON r.user_id = u.user_id
    WHERE gc.users_admin_id = v_admin_id
      AND gc.status = 'Reject';
  ELSE
    SELECT 'Admin not found by email' AS message;
  END IF;
END;
// DELIMITER ;

CALL GetRejectedUsersByAdminEmail('mona.rezaei@example.com');
CALL GetRejectedUsersByAdminEmail('hossein.vakili@example.com');
CALL GetRejectedUsersByAdminEmail('sara.mohammadi@example.com');

-- 2.1
DROP PROCEDURE IF EXISTS GetRejectedUsersByAdminPhone;
DELIMITER //
CREATE PROCEDURE GetRejectedUsersByAdminPhone (IN admin_phone CHAR(10))
BEGIN
  DECLARE v_admin_id CHAR(10);

  SELECT user_id INTO v_admin_id
  FROM phone_number
  WHERE phone_number = admin_phone
  LIMIT 1;

  IF v_admin_id IS NOT NULL THEN
    SELECT DISTINCT u.user_id, u.first_name, u.last_name
    FROM rah_balad.get_checked gc
    JOIN rah_balad.reservations r ON gc.reservation_id = r.reservation_id
    JOIN rah_balad.users u ON r.user_id = u.user_id
    WHERE gc.users_admin_id = v_admin_id
      AND gc.status = 'Reject';
  ELSE
    SELECT 'Admin not found by phone number' AS message;
  END IF;
END;
// DELIMITER ;

CALL GetRejectedUsersByAdminPhone('9385566778');
CALL GetRejectedUsersByAdminPhone('9024455667');
CALL GetRejectedUsersByAdminPhone('7878787878');


-- 3