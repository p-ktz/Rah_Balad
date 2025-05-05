USE rah_balad;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  user_id CHAR(10) NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  registeration_date DATETIME NOT NULL,
  account_status ENUM('Active', 'Inactive') NOT NULL DEFAULT 'Active',
  user_role ENUM('Customer', 'Admin') NOT NULL,
  user_profile_picture BLOB NULL DEFAULT NULL,
  address_id BIGINT DEFAULT NULL,
  PRIMARY KEY (user_id),
  UNIQUE INDEX user_id_UNIQUE (user_id ASC) VISIBLE,
  CONSTRAINT fk_users_address
    FOREIGN KEY (address_id) 
    REFERENCES address (address_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO users (user_id, first_name, last_name, email, password_hash, registeration_date, account_status, user_role, user_profile_picture, address_id)
VALUES 
('2468135790', 'Mona', 'Rezaei', 'mona.rezaei@example.com', 'securePass2025', NOW(), 'Active', 'Admin', NULL, 1),
('1234567891', 'Ali', 'Ahmadi', 'ali.ahmadi@example.com', 'password123', NOW(), 'Active', 'Customer', NULL, 2),
('0451237864', 'Sara', 'Mohammadi', 'sara.mohammadi@example.com', 'password456', NOW(), 'Active', 'Customer', NULL, 3),
('9876543210', 'Reza', 'Karimi', 'reza.karimi@example.com', 'password789', NOW(), 'Active', 'Customer', NULL, 4),
('2765018492', 'Niloofar', 'Zarei', 'niloofar.zarei@example.com', 'password321', NOW(), 'Active', 'Customer', NULL, 5),
('3620194786', 'Mohammad', 'Jafari', 'mohammad.jafari@example.com', 'password654', NOW(), 'Active', 'Customer', NULL, 6),
('1111222233', 'Hamed', 'Rostami', 'hamed.rostami@example.com', 'passhamed11', NOW(), 'Active', 'Customer', NULL, 7),
('2222333344', 'Leila', 'Aslani', 'leila.aslani@example.com', 'leilasecure99', NOW(), 'Inactive', 'Customer', NULL, 8),
('3333444455', 'Farhad', 'Najafi', 'farhad.najafi@example.com', 'farhadpass12', NOW(), 'Active', 'Admin', NULL, 9),
('4444555566', 'Yasaman', 'Khosravi', 'yasaman.khosravi@example.com', 'yas123456', NOW(), 'Active', 'Customer', NULL, 10),
('5555666677', 'Navid', 'Sharifi', 'navid.sharifi@example.com', 'npass9090', NOW(), 'Active', 'Customer', NULL, 11),
('7777888899', 'Amin', 'Rahimi', 'amin.rahimi@example.com', 'aminPass77', NOW(), 'Active', 'Customer', NULL, 12),
('8888999900', 'Ladan', 'Farhadi', 'ladan.farhadi@example.com', 'ladanSecure!', NOW(), 'Active', 'Customer', NULL, 13),
('9999000011', 'Babak', 'Shams', 'babak.shams@example.com', 'babakPass55', NOW(), 'Inactive', 'Customer', NULL, 14),
('1212121212', 'Fatemeh', 'Gholami', 'fatemeh.gh@example.com', 'fatemeh#123', NOW(), 'Active', 'Customer', NULL, 15),
('3434343434', 'Shahin', 'Ebrahimi', 'shahin.eb@example.com', 'shahin_pw', NOW(), 'Active', 'Customer', NULL, 16),
('5656565656', 'Tara', 'Nazari', 'tara.nazari@example.com', 'taraPW654', NOW(), 'Inactive', 'Customer', NULL, 17),
('7878787878', 'Hossein', 'Vakili', 'hossein.vakili@example.com', 'hosseinSecure2024', NOW(), 'Active', 'Admin', NULL, 18),
('9090909090', 'Mahsa', 'Kazemi', 'mahsa.kazemi@example.com', 'mahsa2025!', NOW(), 'Active', 'Customer', NULL, 19),
('3131313131', 'Mehrdad', 'Ranjbar', 'mehrdad.r@example.com', 'mehrdadPW', NOW(), 'Active', 'Customer', NULL, 20),
('6464646464', 'Elham', 'Hashemi', 'elham.hashemi@example.com', 'elhamSecure', NOW(), 'Active', 'Customer', NULL, 21),
('1010101010', 'Shima', 'Abbasi', 'shima.abbasi@example.com', 'shimaPass1', NOW(), 'Active', 'Customer', NULL, 22),
('1213141516', 'Kamran', 'Ehsani', 'kamran.ehsani@example.com', 'kamranSecure99', NOW(), 'Active', 'Customer', NULL, 23),
('1718192021', 'Zahra', 'Moradi', 'zahra.moradi@example.com', 'zahraPW2025', NOW(), 'Inactive', 'Customer', NULL, 24),
('2224252627', 'Behnam', 'Azizi', 'behnam.azizi@example.com', 'behnamStrong', NOW(), 'Active', 'Customer', NULL, 25);

SELECT * FROM users;
