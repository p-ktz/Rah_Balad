USE rah_balad;

DROP TABLE IF EXISTS reservations;

CREATE TABLE rah_balad.reservations (
  reservation_id BIGINT NOT NULL,
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

INSERT INTO rah_balad.reservations (
  reservation_id, travel_id, user_id, seat_number, reservation_status, reservation_date, expiration_date, percentage_discount, payment_status) 
VALUES
  (1, 1, '1234567891', 5, 'Confirmed', '2025-05-01 09:00:00', '2025-05-01 12:00:00', 10, 'Completed'),
  (2, 2, '0451237864', 12, 'Pending', '2025-05-02 10:30:00', '2025-05-02 11:00:00', 0, 'Pending'),
  (3, 3, '9876543210', 7, 'Confirmed', '2025-05-03 08:00:00', '2025-05-03 08:45:00', 5, 'Failed'),
  (4, 4, '2765018492', 2, 'Cancelled', '2025-05-04 14:00:00', '2025-05-04 14:30:00', 0, 'Refunded'),
  (5, 2, '3620194786', 8, 'Expired', '2025-05-02 10:00:00', '2025-05-02 10:45:00', 0, 'Pending'),
  (6, 1, '1234567891', 5, 'Confirmed', '2025-05-01 09:00:00', '2025-05-01 12:00:00', 10, 'Completed');

SELECT * FROM rah_balad.reservations;

-- ALTER TABLE reservations
-- ADD CONSTRAINT ch_res_exp_date CHECK (reservation_date < expiration_date);

-- DELIMITER //
-- CREATE TRIGGER prevent_admin_reservation
-- BEFORE INSERT ON reservations
-- FOR EACH ROW
-- BEGIN
--   DECLARE role ENUM('Customer', 'Admin');

--   SELECT user_role INTO role FROM users WHERE user_id = NEW.user_id;

--   IF role = 'Admin' THEN
--     SIGNAL SQLSTATE '45000'
--     SET MESSAGE_TEXT = 'Admins cannot make reservations.';
--   END IF;
-- END;
-- //
-- DELIMITER ;
