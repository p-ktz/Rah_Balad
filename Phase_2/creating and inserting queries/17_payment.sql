USE rah_balad;

DROP TABLE IF EXISTS rah_balad.payment;

CREATE TABLE rah_balad.payment (
  payment_id BIGINT NOT NULL AUTO_INCREMENT,
  reservation_id BIGINT NOT NULL,
  user_id CHAR(10) NOT NULL,
  payment_method ENUM('Bank Card', 'Cash', 'Cryptocurrency', 'Other') NOT NULL,
  amount_paid DOUBLE NOT NULL,
  payment_date DATETIME NOT NULL DEFAULT now(),
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

INSERT INTO rah_balad.payment (reservation_id, user_id, payment_method, amount_paid, payment_date)
VALUES 
  (1, '1234567891', 'Bank Card', 150.00, '2025-05-01 09:00:00'),
  (2, '2468135790', 'Cash', 200.00, '2025-05-02 10:30:00'),
  (3, '9876543210', 'Cryptocurrency', 50.00, '2025-05-03 14:00:00'),
  (4, '2765018492', 'Bank Card', 300.00, '2025-05-04 12:00:00'),
  (5, '3620194786', 'Other', 100.00, DEFAULT);

SELECT * FROM rah_balad.payment;
