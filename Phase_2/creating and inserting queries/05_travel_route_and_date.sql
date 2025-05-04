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
  (3, 1, 'Mashhad', '2025-05-03 11:00:00');



SELECT * FROM  travel_route_and_date;