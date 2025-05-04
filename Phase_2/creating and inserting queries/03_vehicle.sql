USE rah_balad;

DROP TABLE IF EXISTS vehicle;

CREATE TABLE vehicle (
  vehicle_id BIGINT NOT NULL,
  capacity SMALLINT NOT NULL,
  vehicle_type ENUM('Train', 'Flight', 'Bus') NOT NULL,
  PRIMARY KEY (vehicle_id),
  CONSTRAINT check_capacity CHECK (capacity >= 10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO vehicle (vehicle_id, capacity, vehicle_type) 
VALUES 
  (1, 14, 'Train'),
  (2, 44, 'Flight'),
  (3, 20, 'Bus'),
  (4, 18, 'Train'),
  (5, 12, 'Bus'),
  (6, 12, 'Bus');

SELECT * FROM vehicle;
