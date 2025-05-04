USE rah_balad;

DROP TABLE IF EXISTS train;

CREATE TABLE train (
  vehicle_id BIGINT NOT NULL,
  number_of_stars TINYINT NOT NULL CHECK (number_of_stars BETWEEN 1 AND 5),
  number_of_compartment TINYINT NOT NULL,
  number_of_full_compartment TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (vehicle_id),
  INDEX fk_train_vehicle1_idx (vehicle_id ASC) VISIBLE,
  CONSTRAINT fk_train_vehicle1
    FOREIGN KEY (vehicle_id)
    REFERENCES vehicle (vehicle_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELIMITER //
CREATE TRIGGER train_vehicle_check
BEFORE INSERT ON train
FOR EACH ROW
BEGIN
  DECLARE v_type ENUM('Train', 'Flight', 'Bus');

  SELECT vehicle_type INTO v_type
  FROM vehicle
  WHERE vehicle_id = NEW.vehicle_id;

  IF v_type != 'Train' THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Only vehicles of type "Train" can be inserted into train table';
  END IF;
END;
//
DELIMITER ;


INSERT INTO train (vehicle_id, number_of_stars, number_of_compartment, number_of_full_compartment)
VALUES
  (1, 3, 10, DEFAULT),
  (4, 2, 8, 2),
  (9, 5, 20, 5),
  (12, 4, 12, 3),
  (15, 5, 25, 7),
  (18, 3, 15, 4);


SELECT * FROM train;