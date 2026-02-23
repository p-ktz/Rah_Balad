USE rah_balad;

DROP TABLE IF EXISTS rah_balad.payment;

CREATE TABLE rah_balad.payment (
  payment_id BIGINT NOT NULL AUTO_INCREMENT,
  reservation_id BIGINT NOT NULL,
  user_id CHAR(10) NOT NULL,
  payment_method ENUM('Bank Card', 'Cash', 'Cryptocurrency', 'Other') NOT NULL,
  amount_paid DOUBLE NOT NULL,
  payment_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (payment_id),
  INDEX idx_reservation (reservation_id),
  INDEX idx_user (user_id),
  INDEX idx_payment_id (payment_id),
  CONSTRAINT fk_payment_reservation
    FOREIGN KEY (reservation_id)
    REFERENCES rah_balad.reservations (reservation_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_payment_user
    FOREIGN KEY (user_id)
    REFERENCES rah_balad.users (user_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


DELIMITER //
CREATE TRIGGER check_reservation_exists_before_payment
BEFORE INSERT ON rah_balad.payment
FOR EACH ROW
BEGIN
  DECLARE reservation_exists INT;

  -- Check if the reservation_id exists in the reservations table
  SELECT COUNT(*) INTO reservation_exists
  FROM rah_balad.reservations
  WHERE reservation_id = NEW.reservation_id;

  -- If the reservation_id does not exist, signal an error
  IF reservation_exists = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'The reservation_id does not exist in the reservations table.';
  END IF;
END;
//
DELIMITER ;



INSERT INTO rah_balad.payment (reservation_id, user_id, payment_method, amount_paid, payment_date)
VALUES 
  (1, '1234567891', 'Bank Card', 150.00, '2025-05-01 09:00:00'),
  (2, '2468135790', 'Cash', 200.00, '2025-05-02 10:30:00'),
  (3, '9876543210', 'Cryptocurrency', 50.00, '2025-05-03 14:00:00'),
  (4, '2765018492', 'Bank Card', 300.00, '2025-05-04 12:00:00'),
  (5, '3620194786', 'Other', 100.00, DEFAULT),
  (6, '1234567891', 'Cash', 250.00, '2025-05-01 11:30:00'),
  (7, '1111222233', 'Bank Card', 500.00, '2025-05-05 10:15:00'),
  (8, '2222333344', 'Cryptocurrency', 75.00, '2025-05-06 12:45:00'),
  (9, '7777888899', 'Other', 110.00, '2025-05-09 14:30:00'),
  (12, '8888999900', 'Cryptocurrency', 60.00, '2025-05-10 10:00:00'),
  (13, '9999000011', 'Bank Card', 130.00, '2025-05-11 09:00:00'),
  (14, '1212121212', 'Cash', 200.00, '2025-05-12 11:30:00'),
  (15, '3434343434', 'Bank Card', 300.00, '2025-05-13 15:00:00');
  
SELECT * FROM rah_balad.payment;