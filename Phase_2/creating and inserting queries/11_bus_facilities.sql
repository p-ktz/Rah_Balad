USE rah_balad;

DROP TABLE IF EXISTS bus_facilities;

CREATE TABLE rah_balad.bus_facilities (
  vehicle_id BIGINT NOT NULL,
  personal_monitor BOOLEAN NOT NULL,
  reception BOOLEAN NOT NULL,
  internet BOOLEAN NOT NULL,
  air_conditioning BOOLEAN NOT NULL,
  more JSON NULL DEFAULT NULL,
  PRIMARY KEY (vehicle_id),
  INDEX fk_bus_facilities_bus1_idx (vehicle_id ASC) VISIBLE,
  CONSTRAINT fk_bus_facilities_bus1
    FOREIGN KEY (vehicle_id)
    REFERENCES rah_balad.bus (vehicle_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO rah_balad.bus_facilities (vehicle_id, personal_monitor, reception, internet, air_conditioning, more)
VALUES
  (3, TRUE, FALSE, FALSE, TRUE, '{"entertainment_system": true}'),
  (5, FALSE, TRUE, TRUE, TRUE, NULL);

SELECT * FROM rah_balad.bus_facilities;
