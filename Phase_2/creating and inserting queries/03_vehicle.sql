USE rah_balad;

DROP TABLE IF EXISTS vehicle;

CREATE TABLE vehicle (
  vehicle_id BIGINT NOT NULL,
  capacity SMALLINT NOT NULL,
  vehicle_type ENUM('Train', 'Flight', 'Bus') NOT NULL,
  PRIMARY KEY (vehicle_id),
  CONSTRAINT check_capacity CHECK (capacity > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO vehicle (vehicle_id, capacity, vehicle_type) 
VALUES 
  (1, 14, 'Train'),
  (2, 44, 'Flight'),
  (3, 20, 'Bus'),
  (4, 18, 'Train'),
  (5, 12, 'Bus'),
  (6, 12, 'Bus'),
  (7, 180, 'Flight'),
  (8, 50, 'Bus'),
  (9, 320, 'Train'),
  (10, 45, 'Bus'),
  (11, 200, 'Flight'),
  (12, 60, 'Train'),
  (13, 140, 'Flight'),
  (14, 55, 'Bus'),
  (15, 400, 'Train'),
  (16, 38, 'Bus'),
  (17, 220, 'Flight'),
  (18, 100, 'Train'),
  (19, 30, 'Bus'),
  (20, 190, 'Flight');

SELECT * FROM vehicle;