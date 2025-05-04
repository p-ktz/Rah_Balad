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


DELIMITER //
CREATE TRIGGER bus_vehicle_check
BEFORE INSERT ON bus
FOR EACH ROW
BEGIN
  DECLARE v_type ENUM('Train', 'Flight', 'Bus');

  SELECT vehicle_type INTO v_type
  FROM vehicle
  WHERE vehicle_id = NEW.vehicle_id;

  IF v_type != 'Bus' THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Only vehicles of type "Bus" can be inserted into bus table';
  END IF;
END;
//
DELIMITER ;


INSERT INTO rah_balad.bus (vehicle_id, bus_company_name, bus_class, seats_on_left, seats_on_right)
VALUES

  (3, 'IranPeyma', 'Sleeper', 3, 2),
  (5, 'AlborzSafar', 'Normal', 2, 2),
  (8, 'SimaTravel', 'VIP', 5, 5),
  (10, 'ParsKhazar', 'Sleeper', 4, 4),
  (14, 'KishTransport', 'Normal', 3, 3),
  (16, 'TehranBus', 'VIP', 6, 6),
  (19, 'TuyserkanBus', 'Sleeper', 4, 5);

SELECT * FROM rah_balad.bus;