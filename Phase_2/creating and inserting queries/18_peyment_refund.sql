USE rah_balad;

DROP TABLE IF EXISTS rah_balad.peyment_refund;

CREATE TABLE IF NOT EXISTS rah_balad.peyment_refund (
  reservation_id BIGINT NOT NULL,
  refund_method ENUM('Bank Transfer', 'Cash', 'Cryptocurrency', 'Other') NOT NULL,
  amount_refunded DOUBLE NOT NULL,
  date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (reservation_id),
  INDEX fk_peyment_refund_payments1_idx (reservation_id ASC) VISIBLE,
  CONSTRAINT fk_peyment_refund_payments1
    FOREIGN KEY (reservation_id)
    REFERENCES rah_balad.canceled (reservation_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO rah_balad.peyment_refund (reservation_id, refund_method, amount_refunded, date)
VALUES 

  (4, 'Bank Transfer', 300.00, '2025-05-13 12:00:00'),
  (5, 'Other', 100.00, '2025-05-14 09:30:00'),
  (10, 'Cash', 220.00, '2025-05-15 10:45:00'),
  (13, 'Cash', 75.00, '2025-05-17 11:00:00'),
  (16, 'Cryptocurrency', 180.00, '2025-05-16 08:30:00');

SELECT * FROM rah_balad.peyment_refund;