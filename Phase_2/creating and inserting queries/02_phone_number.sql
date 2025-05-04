USE rah_balad;

DROP TABLE IF EXISTS phone_number;

CREATE TABLE IF NOT EXISTS phone_number (
  user_id CHAR(10) NOT NULL,
  phone_number CHAR(10) NOT NULL,
  PRIMARY KEY (user_id, phone_number),
  INDEX fk_phone_number_users1_idx (user_id ASC) VISIBLE,
  CONSTRAINT fk_phone_number_users1
    FOREIGN KEY (user_id)
    REFERENCES users (user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO phone_number (user_id, phone_number)
VALUES 
('1234567891', '9121234567'),
('1234567891', '9122233445'),
('0451237864', '9355566778'),
('3620194786', '9011122233'),
('3620194786', '9199988776');


SELECT * FROM phone_number