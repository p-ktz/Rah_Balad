USE rah_balad;

DROP TABLE IF EXISTS get_checked;

CREATE TABLE rah_balad.get_checked (
  reservation_id BIGINT NOT NULL,
  users_admin_id CHAR(10) DEFAULT NULL,
  status ENUM('Accept', 'Reject', 'Pending') NULL DEFAULT 'Pending',
  checked_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (reservation_id),
  INDEX fk_get_checked_reservations1_idx (reservation_id ASC) VISIBLE,
  CONSTRAINT fk_get_checked_reservations1
    FOREIGN KEY (reservation_id)
    REFERENCES rah_balad.reservations (reservation_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO rah_balad.get_checked (reservation_id, users_admin_id, status, checked_at)
VALUES 
  (1, '2468135790', 'Accept', '2025-04-29 09:00:00'),
  (2, '2468135790', 'Pending', '2025-04-29 09:30:00'),
  (3, '2468135790', 'Reject', '2025-04-29 10:00:00'),
  (4, '2468135790', 'Accept', '2025-04-29 10:30:00'),
  (5, '2468135790', DEFAULT, '2025-04-29 11:00:00');

SELECT * FROM rah_balad.get_checked;

