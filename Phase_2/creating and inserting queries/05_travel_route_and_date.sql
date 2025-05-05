USE rah_balad;

DROP TABLE IF EXISTS travel_route_and_date;

DROP TABLE IF EXISTS travel_route_and_date;

CREATE TABLE travel_route_and_date (
  travel_id BIGINT NOT NULL,
  destination_status TINYINT NOT NULL,
  date DATETIME NOT NULL,
  address_id BIGINT NOT NULL,
  PRIMARY KEY (travel_id, destination_status),
  INDEX fk_travel_idx (travel_id ASC),
  INDEX fk_address_idx (address_id ASC),
  CONSTRAINT fk_travel_route_and_date_travel
    FOREIGN KEY (travel_id) REFERENCES travel (travel_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_travel_route_and_date_address
    FOREIGN KEY (address_id) REFERENCES address (address_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO travel_route_and_date (travel_id, destination_status, date, address_id)
VALUES
(1, 1, '2025-05-01 10:00:00', 26),
(1, 2, '2025-05-01 12:00:00', 31),
(1, 3, '2025-05-01 11:00:00', 28),
(2, 1, '2025-05-02 09:00:00', 32),
(2, 2, '2025-05-02 13:00:00', 27),
(2, 3, '2025-05-02 11:00:00', 33),
(3, 1, '2025-05-03 11:00:00', 29),
(4, 1, '2025-05-04 08:30:00', 28),
(4, 2, '2025-05-04 13:30:00', 26),
(5, 1, '2025-05-05 07:45:00', 30),
(6, 1, '2025-05-06 09:00:00', 29),
(7, 1, '2025-05-07 14:00:00', 32),
(8, 1, '2025-05-08 06:30:00', 29),
(8, 2, '2025-05-08 11:45:00', 28),
(9, 1, '2025-05-09 12:00:00', 31),
(10, 1, '2025-05-10 10:00:00', 26),
(10, 2, '2025-05-10 14:30:00', 29),
(11, 1, '2025-05-11 08:00:00', 21),
(12, 1, '2025-05-12 05:45:00', 33),
(12, 2, '2025-05-12 09:00:00', 19),
(13, 1, '2025-05-13 07:30:00', 13),
(14, 1, '2025-05-14 06:00:00', 23);

SELECT * FROM  travel_route_and_date;