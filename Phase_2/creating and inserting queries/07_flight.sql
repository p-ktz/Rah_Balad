USE rah_balad;

DROP TABLE IF EXISTS flight;

CREATE TABLE flight (
  vehicle_id BIGINT NOT NULL,
  airline_name VARCHAR(45) NOT NULL,
  flight_number INT NOT NULL UNIQUE,
  flight_class ENUM('Economy', 'Business', 'First') NOT NULL,
  PRIMARY KEY (vehicle_id),
  INDEX fk_flight_vehicle1_idx (vehicle_id ASC) VISIBLE,
  CONSTRAINT fk_flight_vehicle1
    FOREIGN KEY (vehicle_id)
    REFERENCES rah_balad.vehicle (vehicle_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DELIMITER //
CREATE TRIGGER flight_vehicle_check
BEFORE INSERT ON flight
FOR EACH ROW
BEGIN
  DECLARE v_type ENUM('Train', 'Flight', 'Bus');

  SELECT vehicle_type INTO v_type
  FROM vehicle
  WHERE vehicle_id = NEW.vehicle_id;

  IF v_type != 'Flight' THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Only vehicles of type "Flight" can be inserted into flight table';
  END IF;
END;
//
DELIMITER ;



INSERT INTO rah_balad.flight (vehicle_id, airline_name, flight_number, flight_class)
VALUES
  (2,  'Mahan Air',       2002, 'Business'),
  (7,  'Aseman Airlines', 1005, 'Economy'),
  (11, 'Kish Air',        2204, 'First'),
  (17, 'Qatar Airways', 5511, 'Economy'),
  (13, 'Iran Air',        8808, 'Business');


SELECT * FROM rah_balad.flight;