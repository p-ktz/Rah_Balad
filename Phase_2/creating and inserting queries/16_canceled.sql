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


INSERT INTO rah_balad.canceled (reservation_id, canceled_date)
VALUES 
  (4, '2025-04-28 18:00:00'),
  (5, '2025-05-01 09:15:00');

SELECT * FROM rah_balad.canceled;
