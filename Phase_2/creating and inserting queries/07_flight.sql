USE rah_balad;

DROP TABLE IF EXISTS flight;

CREATE TABLE flight (
  vehicle_id BIGINT NOT NULL,
  airline_name VARCHAR(45) NOT NULL,
  flight_number INT NOT NULL,
  flight_class ENUM('Economy', 'Business', 'First') NOT NULL,
  PRIMARY KEY (vehicle_id),
  INDEX fk_flight_vehicle1_idx (vehicle_id ASC) VISIBLE,
  CONSTRAINT fk_flight_vehicle1
    FOREIGN KEY (vehicle_id)
    REFERENCES rah_balad.vehicle (vehicle_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO rah_balad.flight (vehicle_id, airline_name, flight_number, flight_class)
VALUES
  (2, 'Mahan Air', 2002, 'Business');

SELECT * FROM rah_balad.flight;
