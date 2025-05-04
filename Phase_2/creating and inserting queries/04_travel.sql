USE rah_balad;

DROP TABLE IF EXISTS travel;

CREATE TABLE travel (
  travel_id BIGINT NOT NULL,
  vehicle_id BIGINT NOT NULL,
  price DOUBLE NOT NULL,
  remaining_capacity SMALLINT NOT NULL,
  round_trip BIGINT NULL DEFAULT NULL,
  transportation_company_id INT NULL DEFAULT NULL,
  travel_class ENUM('Economy', 'Business', 'VIP') NOT NULL,
  travel_status ENUM('Pending', 'Ongoing', 'Completed') NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (travel_id),
  INDEX fk_travel_travel1_idx (round_trip ASC),
  INDEX fk_travel_vehicle1_idx (vehicle_id ASC),
  CONSTRAINT ch_price CHECK (price > 0),
  CONSTRAINT ch_remaining_capacity CHECK (remaining_capacity >= 0),
  CONSTRAINT fk_travel_travel1
    FOREIGN KEY (round_trip)
    REFERENCES travel (travel_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT fk_travel_vehicle1
    FOREIGN KEY (vehicle_id)
    REFERENCES vehicle (vehicle_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO travel (travel_id, vehicle_id, price, remaining_capacity, round_trip, transportation_company_id, travel_class, travel_status) 
VALUES 
  (1, 1, 150.0, 10, NULL, 1, 'Economy', DEFAULT),
  (2, 2, 500.0, 35, 1, 2, 'Business', DEFAULT),
  (3, 3, 200.0, 20, NULL, 3, 'VIP', DEFAULT),
  (4, 4, 300.0, 15, 3, 4, 'Economy', DEFAULT),
  (5, 5, 50.0, 8, NULL, 5, 'Business', DEFAULT),
  (6, 1, 120.0, 10, NULL, 1, 'Economy', 'Pending'),
  (7, 2, 480.0, 35, 6, 2, 'Business', 'Ongoing'),
  (8, 3, 180.0, 5, NULL, 3, 'VIP', 'Pending'),
  (9, 4, 320.0, 12, 8, 4, 'Economy', 'Completed'),
  (10, 5, 60.0, 7, NULL, 5, 'Business', 'Ongoing'),
  (11, 6, 55.0, 9, 10, 5, 'Economy', 'Pending'),
  (12, 3, 210.0, 8, NULL, 3, 'VIP', 'Pending'),
  (13, 4, 275.0, 11, 12, 4, 'Economy', 'Completed'),
  (14, 2, 530.0, 40, NULL, 2, 'Business', 'Ongoing'),
  (15, 1, 140.0, 13, NULL, 1, 'Economy', 'Completed'),
  (16, 5, 70.0, 3, NULL, 5, 'Business', 'Pending'),
  (17, 6, 65.0, 6, NULL, 5, 'VIP', 'Pending'),
  (18, 3, 190.0, 0, NULL, 3, 'VIP', 'Completed'),
  (19, 4, 310.0, 14, NULL, 4, 'Business', 'Ongoing'),
  (20, 2, 460.0, 25, NULL, 2, 'Economy', 'Pending');



SELECT * FROM travel;