USE rah_balad;

DROP TABLE IF EXISTS canceled;

CREATE TABLE IF NOT EXISTS rah_balad.canceled (
  reservation_id BIGINT NOT NULL,
  canceled_date DATETIME NOT NULL,
  INDEX fk_canceled_reservations1_idx (reservation_id ASC) VISIBLE,
  PRIMARY KEY (reservation_id),
  CONSTRAINT fk_canceled_reservations1
    FOREIGN KEY (reservation_id)
    REFERENCES rah_balad.reservations (reservation_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;



DELIMITER //

CREATE TRIGGER check_reservation_status_before_cancel
BEFORE INSERT ON canceled
FOR EACH ROW
BEGIN
  DECLARE res_status ENUM('Pending', 'Confirmed', 'Cancelled', 'Expired');

  SELECT reservation_status INTO res_status
  FROM reservations
  WHERE reservation_id = NEW.reservation_id;

  IF res_status NOT IN ('Cancelled', 'Expired') THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Reservation status must be Cancelled or Expired to be inserted into canceled table.';
  END IF;
END;
//

DELIMITER ;


INSERT INTO rah_balad.canceled (reservation_id, canceled_date)
VALUES 
  (4, '2025-04-28 18:00:00'),
  (5, '2025-05-01 09:15:00'),
  (13, '2025-05-02 14:20:00'),
  (16, '2025-05-01 12:00:00'),
  (10, '2025-05-02 15:30:00');

SELECT * FROM rah_balad.canceled;
