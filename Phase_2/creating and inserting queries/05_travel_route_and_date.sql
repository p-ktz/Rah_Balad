USE rah_balad;

DROP TABLE IF EXISTS travel_route_and_date;

CREATE TABLE travel_route_and_date (
  travel_id BIGINT NOT NULL,
  destination_status TINYINT NOT NULL,
  location_name VARCHAR(255) NOT NULL,
  date DATETIME NOT NULL,
  PRIMARY KEY (travel_id, destination_status),
  INDEX fk_travel_route_and_date_travel1_idx (travel_id ASC) VISIBLE,
  CONSTRAINT fk_travel_route_and_date_travel1
    FOREIGN KEY (travel_id)
    REFERENCES travel (travel_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO travel_route_and_date (travel_id, destination_status, location_name, date)
VALUES 
  (1, 1, 'Tehran', '2025-05-01 10:00:00'),
  (1, 2, 'Shiraz', '2025-05-01 14:00:00'),
  (2, 1, 'Isfahan', '2025-05-02 09:00:00'),
  (2, 2, 'Kerman', '2025-05-02 13:00:00'),
  (3, 1, 'Mashhad', '2025-05-03 11:00:00'),
  (4, 1, 'Tabriz', '2025-05-04 08:30:00'),
  (4, 2, 'Tehran', '2025-05-04 13:00:00'),
  (5, 1, 'Rasht', '2025-05-05 07:45:00'),
  (5, 2, 'Qom', '2025-05-05 10:30:00'),
  (6, 1, 'Karaj', '2025-05-06 09:00:00'),
  (6, 2, 'Esfahan', '2025-05-06 13:15:00'),
  (7, 1, 'Esfahan', '2025-05-07 14:00:00'),
  (7, 2, 'Shiraz', '2025-05-07 18:30:00'),
  (8, 1, 'Mashhad', '2025-05-08 06:30:00'),
  (8, 2, 'Tabriz', '2025-05-08 11:45:00'),
  (9, 1, 'Shiraz', '2025-05-09 12:00:00'),
  (9, 2, 'Kerman', '2025-05-09 15:30:00'),
  (10, 1, 'Tehran', '2025-05-10 10:00:00'),
  (10, 2, 'Mashhad', '2025-05-10 14:30:00'),
  (11, 1, 'Qazvin', '2025-05-11 08:00:00'),
  (11, 2, 'Hamedan', '2025-05-11 11:30:00'),
  (12, 1, 'Zahedan', '2025-05-12 05:45:00'),
  (12, 2, 'Kermanshah', '2025-05-12 09:00:00'),
  (13, 1, 'Arak', '2025-05-13 07:30:00'),
  (13, 2, 'Bushehr', '2025-05-13 12:00:00'),
  (14, 1, 'Bandar Abbas', '2025-05-14 06:00:00'),
  (14, 2, 'Yazd', '2025-05-14 10:45:00');


SELECT * FROM  travel_route_and_date;