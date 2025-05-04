USE rah_balad;

DROP TABLE IF EXISTS flight_facilities;

CREATE TABLE rah_balad.flight_facilities (
  vehicle_id BIGINT NOT NULL,
  reception BOOLEAN NOT NULL,
  internet BOOLEAN NOT NULL,
  bed_chair BOOLEAN NOT NULL,
  more JSON NULL DEFAULT NULL,
  PRIMARY KEY (vehicle_id),
  INDEX fk_flight_facilities_flight1_idx (vehicle_id ASC) VISIBLE,
  CONSTRAINT fk_flight_facilities_flight1
    FOREIGN KEY (vehicle_id)
    REFERENCES rah_balad.flight (vehicle_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO rah_balad.flight_facilities (vehicle_id, reception, internet, bed_chair, more)
VALUES
  (2, FALSE, TRUE, TRUE, NULL);

SELECT * FROM rah_balad.flight_facilities;
