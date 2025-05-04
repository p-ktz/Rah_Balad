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


DELIMITER //
CREATE TRIGGER check_admin_role_before_insert
BEFORE INSERT ON get_checked
FOR EACH ROW
BEGIN
  DECLARE role ENUM('Customer', 'Admin');

  IF NEW.users_admin_id IS NOT NULL THEN
    SELECT user_role INTO role
    FROM users
    WHERE user_id = NEW.users_admin_id;

    IF role != 'Admin' THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Only Admins can check reservations.';
    END IF;
  END IF;
END;
//
DELIMITER ;



INSERT INTO rah_balad.get_checked (reservation_id, users_admin_id, status, checked_at)
VALUES 
  (1, '2468135790', 'Accept', '2025-04-29 09:00:00'),
  (2, NULL, 'Pending', '2025-04-29 09:30:00'),
  (3, '2468135790', 'Reject', '2025-04-29 10:00:00'),
  (4, '2468135790', 'Accept', '2025-04-29 10:30:00'),
  (5, NULL, DEFAULT, '2025-04-29 11:00:00'),
  (6, '1357924680', 'Accept', '2025-04-29 12:00:00'),
  (7, '1357924680', 'Reject', '2025-04-29 12:15:00'),
  (8, '2468135790', 'Pending', '2025-04-29 12:30:00'),
  (9, '9876543211', 'Accept', '2025-04-29 12:45:00'),
  (10, '9876543211', 'Accept', '2025-04-29 13:00:00'),
  (11, '1231231231', 'Reject', '2025-04-29 13:15:00'),
  (12, NULL, DEFAULT, '2025-04-29 13:30:00'),
  (13, '1357924680', 'Pending', '2025-04-29 13:45:00'),
  (14, '1357924680', 'Accept', '2025-04-29 14:00:00'),
  (15, '2468135790', 'Reject', '2025-04-29 14:15:00'),
  (16, '9876543211', DEFAULT, '2025-04-29 14:30:00'),
  (17, '1231231231', 'Pending', '2025-04-29 14:45:00'),
  (18, '2468135790', 'Accept', '2025-04-29 15:00:00'),
  (19, '9876543211', 'Accept', '2025-04-29 15:15:00'),
  (20, '1357924680', 'Reject', '2025-04-29 15:30:00');

SELECT * FROM rah_balad.get_checked;