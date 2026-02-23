USE rah_balad;

DROP TABLE IF EXISTS reservations;

CREATE TABLE rah_balad.reservations (
  reservation_id BIGINT NOT NULL AUTO_INCREMENT,
  travel_id BIGINT NOT NULL,
  user_id CHAR(10) NOT NULL,
  seat_number SMALLINT NOT NULL,
  reservation_status ENUM('Pending', 'Confirmed', 'Cancelled', 'Expired') NOT NULL DEFAULT 'Pending',
  reservation_date DATETIME NOT NULL,
  expiration_date DATETIME NOT NULL,
  percentage_discount TINYINT NULL DEFAULT 0,
  payment_status ENUM('Pending', 'Completed', 'Failed', 'Refunded') NOT NULL DEFAULT 'Pending', -- فیلد payment_status اضافه شد
  PRIMARY KEY (reservation_id),
  INDEX fk_reservations_users1_idx (user_id ASC) VISIBLE,
  INDEX fk_reservations_travel1_idx (travel_id ASC) VISIBLE,
  CONSTRAINT ch_res_exp_date CHECK (reservation_date < expiration_date),
  CONSTRAINT fk_reservations_users1
    FOREIGN KEY (user_id)
    REFERENCES rah_balad.users (user_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_reservations_travel1
    FOREIGN KEY (travel_id)
    REFERENCES rah_balad.travel (travel_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELIMITER //
CREATE TRIGGER prevent_admin_reservation
BEFORE INSERT ON reservations
FOR EACH ROW
BEGIN
  DECLARE role ENUM('Customer', 'Admin');

  SELECT user_role INTO role FROM users WHERE user_id = NEW.user_id;

  IF role IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'User ID does not exist.';
  END IF;

  IF role = 'Admin' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Admins cannot make reservations.';
  END IF;
END;
//
DELIMITER ;

INSERT INTO rah_balad.reservations (
  reservation_id, travel_id, user_id, seat_number, reservation_status, reservation_date, expiration_date, percentage_discount, payment_status) 
VALUES
  (1, 1, '1234567891', 5, 'Confirmed', '2025-05-01 09:00:00', '2025-05-01 12:00:00', 10, 'Completed'),
  (2, 2, '0451237864', 12, 'Pending', '2025-05-02 10:30:00', '2025-05-02 11:00:00', 0, 'Pending'),
  (3, 3, '9876543210', 7, 'Confirmed', '2025-05-03 08:00:00', '2025-05-03 08:45:00', 5, 'Failed'),
  (4, 4, '2765018492', 2, 'Cancelled', '2025-05-04 14:00:00', '2025-05-04 14:30:00', 0, 'Refunded'),
  (5, 2, '3620194786', 8, 'Expired', '2025-05-02 10:00:00', '2025-05-02 10:45:00', 0, 'Pending'),
  (6, 1, '1234567891', 5, 'Confirmed', '2025-05-01 09:00:00', '2025-05-01 12:00:00', 10, 'Completed'),
  (7, 5, '1111222233', 3, 'Confirmed', '2025-05-05 10:00:00', '2025-05-05 10:30:00', 0, 'Completed'),
  (8, 6, '2222333344', 4, 'Pending', '2025-05-06 12:00:00', '2025-05-06 12:45:00', 15, 'Pending'),
  (9, 7, '4444555566', 1, 'Confirmed', '2025-05-07 08:00:00', '2025-05-07 08:30:00', 20, 'Completed'),
  (10, 8, '5555666677', 9, 'Cancelled', '2025-05-08 16:00:00', '2025-05-08 16:20:00', 0, 'Refunded'),
  (11, 9, '7777888899', 2, 'Confirmed', '2025-05-09 13:00:00', '2025-05-09 13:45:00', 5, 'Completed'),
  (12, 10, '8888999900', 6, 'Pending', '2025-05-10 09:30:00', '2025-05-10 10:00:00', 0, 'Pending'),
  (13, 11, '9999000011', 7, 'Expired', '2025-05-11 07:00:00', '2025-05-11 07:20:00', 0, 'Pending'),
  (14, 12, '1212121212', 8, 'Confirmed', '2025-05-12 11:00:00', '2025-05-12 11:45:00', 10, 'Completed'),
  (15, 13, '3434343434', 10, 'Confirmed', '2025-05-13 15:00:00', '2025-05-13 15:30:00', 0, 'Completed'),
  (16, 14, '5656565656', 2, 'Cancelled', '2025-05-14 08:15:00', '2025-05-14 09:00:00', 5, 'Refunded'),
  (17, 15, '9090909090', 5, 'Pending', '2025-05-15 10:30:00', '2025-05-15 11:15:00', 0, 'Pending'),
  (18, 16, '3131313131', 4, 'Confirmed', '2025-05-16 12:30:00', '2025-05-16 13:00:00', 0, 'Completed'),
  (19, 17, '6464646464', 6, 'Confirmed', '2025-05-17 14:00:00', '2025-05-17 14:30:00', 20, 'Completed'),
  (20, 18, '2765018492', 1, 'Confirmed', '2025-05-18 09:00:00', '2025-05-18 09:45:00', 0, 'Completed'),
  (21, 1, '1234567891', 6, 'Confirmed', '2025-05-02 10:00:00', '2025-05-02 11:00:00', 5, 'Completed'),
  (22, 3, '9876543210', 5, 'Confirmed', '2025-05-03 08:30:00', '2025-05-03 09:00:00', 10, 'Completed'),
  (23, 5, '1111222233', 7, 'Confirmed', '2025-05-05 12:00:00', '2025-05-05 12:30:00', 0, 'Pending'),
  (24, 2, '2222333344', 9, 'Expired', '2025-05-02 11:00:00', '2025-05-02 11:30:00', 0, 'Failed'),
  (25, 6, '4444555566', 4, 'Cancelled', '2025-05-04 13:00:00', '2025-05-04 13:45:00', 0, 'Refunded'),
  (26, 7, '5555666677', 8, 'Confirmed', '2025-05-06 10:00:00', '2025-05-06 10:45:00', 15, 'Completed'),
  (27, 8, '7777888899', 2, 'Pending', '2025-05-07 14:00:00', '2025-05-07 14:30:00', 5, 'Pending'),
  (28, 9, '8888999900', 3, 'Confirmed', '2025-05-08 15:00:00', '2025-05-08 15:30:00', 0, 'Completed'),
  (29, 10, '9999000011', 10, 'Expired', '2025-05-09 16:00:00', '2025-05-09 16:30:00', 0, 'Refunded'),
  (30, 11, '1212121212', 1, 'Cancelled', '2025-05-10 12:00:00', '2025-05-10 12:30:00', 0, 'Refunded');

SELECT * FROM rah_balad.reservations;