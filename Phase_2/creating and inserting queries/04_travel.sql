USE rah_balad;

DROP TABLE IF EXISTS travel;

CREATE TABLE travel (
  travel_id BIGINT NOT NULL,
  vehicle_id BIGINT NOT NULL,
  price DOUBLE NOT NULL,
  remaining_capacity SMALLINT NULL,
  round_trip BIGINT NULL DEFAULT NULL,
  transportation_company_id INT NULL DEFAULT NULL,
  travel_class ENUM('Economy', 'Business', 'VIP ') NOT NULL,
  travel_status ENUM('Pending', 'Ongoing', 'Completed ') NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (travel_id),
  INDEX fk_travel_travel1_idx (round_trip ASC) VISIBLE,
  INDEX fk_travel_vehicle1_idx (vehicle_id ASC) VISIBLE,
  CONSTRAINT fk_travel_travel1
    FOREIGN KEY (round_trip)
    REFERENCES travel (travel_id)
    ON DELETE SET NULL
    ON UPDATE RESTRICT,
  CONSTRAINT fk_travel_vehicle1
    FOREIGN KEY (vehicle_id)
    REFERENCES vehicle (vehicle_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO travel (travel_id, vehicle_id, price, remaining_capacity, round_trip, transportation_company_id, travel_class, travel_status) 
VALUES 
  (1, 1, 150.0, NULL, NULL, 1, 'Economy', DEFAULT),
  (2, 2, 500.0, NULL, 1, 2, 'Business', DEFAULT),
  (3, 3, 200.0, NULL, NULL, 3, 'VIP', DEFAULT),
  (4, 4, 300.0, NULL, 3, 4, 'Economy', DEFAULT),
  (5, 5, 50.0, NULL, NULL, 5, 'Business', DEFAULT);


SELECT * FROM travel;


-- ALTER TABLE travel
-- ADD CONSTRAINT ch_price CHECK (price > 0);
