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
DROP PROCEDURE IF EXISTS GetReservationsByCity;
DELIMITER //
CREATE PROCEDURE GetReservationsByCity(IN cityName VARCHAR(100))
BEGIN
  SELECT
    r.reservation_id,
    r.user_id,
    r.travel_id,
    r.seat_number,
    r.reservation_status,
    r.payment_status,
    r.reservation_date,
    r.expiration_date,
    a.city,
    a.street
  FROM reservations r
  JOIN travel_route_and_date trd ON r.travel_id = trd.travel_id
  JOIN address a ON trd.address_id = a.address_id
  WHERE a.city = cityName;
--     AND r.payment_status = 'Completed';
END;
// DELIMITER ;

CALL GetReservationsByCity('Tehran');
CALL GetReservationsByCity('Karaj');
CALL GetReservationsByCity('London');


-- 4
DROP PROCEDURE IF EXISTS search_reservations;
DELIMITER //
CREATE PROCEDURE search_reservations(IN search_phrase VARCHAR(255))
BEGIN
  SELECT 
    r.reservation_id, 
    r.travel_id, 
    r.user_id, 
    r.seat_number, 
    r.reservation_status, 
    r.reservation_date, 
    r.expiration_date, 
    r.percentage_discount, 
    r.payment_status,
    t.travel_class,
    u.first_name, 
    u.last_name
  FROM 
    rah_balad.reservations r
    JOIN rah_balad.travel t ON r.travel_id = t.travel_id
    JOIN rah_balad.users u ON r.user_id = u.user_id
  WHERE
    u.first_name LIKE CONCAT('%', search_phrase, '%') OR
    u.last_name LIKE CONCAT('%', search_phrase, '%') OR
    t.travel_class LIKE CONCAT('%', search_phrase, '%');
END;
// DELIMITER ;

CALL search_reservations('Reza');
CALL search_reservations('Business');


-- 5
DROP PROCEDURE IF EXISTS GetSameCityUsersByEmail;
DELIMITER //
CREATE PROCEDURE GetSameCityUsersByEmail(IN input_email VARCHAR(255))
BEGIN
  DECLARE input_user_id CHAR(10);
  DECLARE input_city VARCHAR(100);

  SELECT user_id INTO input_user_id
  FROM users
  WHERE email = input_email
  LIMIT 1;

  IF input_user_id IS NOT NULL THEN
    SELECT a.city INTO input_city
    FROM users u
    JOIN address a ON u.address_id = a.address_id
    WHERE u.user_id = input_user_id;

    IF input_city IS NOT NULL THEN
      SELECT u.user_id, u.first_name, u.last_name, u.email, a.city, a.street
      FROM users u
      JOIN address a ON u.address_id = a.address_id
      WHERE a.city = input_city AND u.user_id <> input_user_id;
    ELSE
      SELECT 'No address found for this user.' AS message;
    END IF;
  ELSE
    SELECT 'No user found with this email address.' AS message;
  END IF;
END;
// DELIMITER ;

CALL GetSameCityUsersByEmail('ali.ahmadi@example.com');
CALL GetSameCityUsersByEmail('sara.mohammadi@example.com');
CALL GetSameCityUsersByEmail('م0000@example.com');

-- 5.1
DROP PROCEDURE IF EXISTS GetSameCityUsersByPhone;
DELIMITER //
CREATE PROCEDURE GetSameCityUsersByPhone(IN input_phone CHAR(10))
BEGIN
  DECLARE input_user_id CHAR(10);
  DECLARE input_city VARCHAR(100);

  SELECT user_id INTO input_user_id
  FROM phone_number
  WHERE phone_number = input_phone
  LIMIT 1;

  IF input_user_id IS NOT NULL THEN
    SELECT a.city INTO input_city
    FROM users u
    JOIN address a ON u.address_id = a.address_id
    WHERE u.user_id = input_user_id;

    IF input_city IS NOT NULL THEN
      SELECT u.user_id, u.first_name, u.last_name, u.email, a.city, a.street
      FROM users u
      JOIN address a ON u.address_id = a.address_id
      WHERE a.city = input_city AND u.user_id <> input_user_id;
    ELSE
      SELECT 'No address found for this user.' AS message;
    END IF;
  ELSE
    SELECT 'No user found with this phone number.' AS message;
  END IF;
END;
// DELIMITER ;

CALL GetSameCityUsersByPhone('9121234567');
CALL GetSameCityUsersByPhone('9355566778');
CALL GetSameCityUsersByPhone('9999999999');

