USE rah_balad;

DROP TABLE IF EXISTS bus;

CREATE TABLE rah_balad.bus (
  vehicle_id BIGINT NOT NULL,
  bus_company_name VARCHAR(45) NULL DEFAULT NULL,
  bus_class ENUM('VIP', 'Normal', 'Sleeper') NOT NULL,
  seats_on_left TINYINT NOT NULL,
  seats_on_right TINYINT NOT NULL,
  PRIMARY KEY (vehicle_id),
  INDEX fk_bus_vehicle1_idx (vehicle_id ASC) VISIBLE,
  CONSTRAINT fk_bus_vehicle1
    FOREIGN KEY (vehicle_id)
    REFERENCES rah_balad.vehicle (vehicle_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO rah_balad.bus (vehicle_id, bus_company_name, bus_class, seats_on_left, seats_on_right)
VALUES

  (3, 'IranPeyma', 'Sleeper', 3, 2),
  (5, 'AlborzSafar', 'Normal', 2, 2);

SELECT * FROM rah_balad.bus;
