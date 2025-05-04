USE rah_balad;

DROP TABLE IF EXISTS train_facilities;

CREATE TABLE rah_balad.train_facilities (
  vehicle_id BIGINT NOT NULL,
  sleeper_compartment BOOLEAN NOT NULL,
  reception BOOLEAN NOT NULL,
  internet BOOLEAN NOT NULL,
  air_conditioning BOOLEAN NOT NULL,
  more JSON NULL DEFAULT NULL,
  PRIMARY KEY (vehicle_id),
  INDEX fk_train_facilities_train1_idx (vehicle_id ASC) VISIBLE,
  CONSTRAINT fk_train_facilities_train1
    FOREIGN KEY (vehicle_id)
    REFERENCES rah_balad.train (vehicle_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO rah_balad.train_facilities (vehicle_id, sleeper_compartment, reception, internet, air_conditioning, more)
VALUES
  (1, TRUE, FALSE, TRUE, TRUE, NULL),
  (4, TRUE, TRUE, FALSE, TRUE, NULL),
  (9, TRUE, TRUE, TRUE, TRUE, JSON_OBJECT('wifi', 'available', 'food_service', 'included')),
  (12, FALSE, TRUE, TRUE, TRUE, JSON_OBJECT('tv', 'available', 'power_outlets', 'available')),
  (15, TRUE, FALSE, TRUE, FALSE, NULL),
  (18, TRUE, TRUE, TRUE, TRUE, JSON_OBJECT('wifi', 'available', 'tv', 'included'));

SELECT * FROM rah_balad.train_facilities;
