USE rah_balad;

DROP TABLE IF EXISTS admin;

CREATE TABLE rah_balad.admin (
  user_id CHAR(10) NOT NULL,
  PRIMARY KEY (user_id),
  INDEX fk_admin_users_idx (user_id ASC) VISIBLE,
  CONSTRAINT fk_admin_users
    FOREIGN KEY (user_id)
    REFERENCES rah_balad.users (user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO rah_balad.admin (user_id)
VALUES 
(2468135790);

SELECT * FROM admin;