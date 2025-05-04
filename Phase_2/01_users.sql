DROP DATABASE IF EXISTS rah_balad;

CREATE DATABASE rah_balad;


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
  address VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (user_id),
  UNIQUE INDEX user_id_UNIQUE (user_id ASC) VISIBLE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO users (user_id, first_name, last_name, email, password_hash, registeration_date, account_status, user_role, user_profile_picture, address)
VALUES 
('2468135790', 'Mona', 'Rezaei', 'mona.rezaei@example.com', 'securePass2025', NOW(), 'Active', 'Admin', NULL, 'Tehran, Iran'),
('1234567891', 'Ali', 'Ahmadi', 'ali.ahmadi@example.com', 'password123', NOW(), 'Active', 'Customer', NULL, 'Tehran, Iran'),
('0451237864', 'Sara', 'Mohammadi', 'sara.mohammadi@example.com', 'password456', NOW(), 'Active', 'Customer', NULL, 'Shiraz, Iran'),
('9876543210', 'Reza', 'Karimi', 'reza.karimi@example.com', 'password789', NOW(), 'Active', 'Customer', NULL, 'Isfahan, Iran'),
('2765018492', 'Niloofar', 'Zarei', 'niloofar.zarei@example.com', 'password321', NOW(), 'Active', 'Customer', NULL, 'Mashhad, Iran'),
('3620194786', 'Mohammad', 'Jafari', 'mohammad.jafari@example.com', 'password654', NOW(), 'Active', 'Customer', NULL, 'Kerman, Iran'),
('1111222233', 'Hamed', 'Rostami', 'hamed.rostami@example.com', 'passhamed11', NOW(), 'Active', 'Customer', NULL, 'Tabriz, Iran'),
('2222333344', 'Leila', 'Aslani', 'leila.aslani@example.com', 'leilasecure99', NOW(), 'Inactive', 'Customer', NULL, 'Rasht, Iran'),
('3333444455', 'Farhad', 'Najafi', 'farhad.najafi@example.com', 'farhadpass12', NOW(), 'Active', 'Admin', NULL, 'Karaj, Iran'),
('4444555566', 'Yasaman', 'Khosravi', 'yasaman.khosravi@example.com', 'yas123456', NOW(), 'Active', 'Customer', NULL, 'Hamedan, Iran'),
('5555666677', 'Navid', 'Sharifi', 'navid.sharifi@example.com', 'npass9090', NOW(), 'Active', 'Customer', NULL, 'Qom, Iran'),
('7777888899', 'Amin', 'Rahimi', 'amin.rahimi@example.com', 'aminPass77', NOW(), 'Active', 'Customer', NULL, 'Yazd, Iran'),
('8888999900', 'Ladan', 'Farhadi', 'ladan.farhadi@example.com', 'ladanSecure!', NOW(), 'Active', 'Customer', NULL, 'Arak, Iran'),
('9999000011', 'Babak', 'Shams', 'babak.shams@example.com', 'babakPass55', NOW(), 'Inactive', 'Customer', NULL, 'Kashan, Iran'),
('1212121212', 'Fatemeh', 'Gholami', 'fatemeh.gh@example.com', 'fatemeh#123', NOW(), 'Active', 'Customer', NULL, 'Zahedan, Iran'),
('3434343434', 'Shahin', 'Ebrahimi', 'shahin.eb@example.com', 'shahin_pw', NOW(), 'Active', 'Customer', NULL, 'Gorgan, Iran'),
('5656565656', 'Tara', 'Nazari', 'tara.nazari@example.com', 'taraPW654', NOW(), 'Inactive', 'Customer', NULL, 'Bushehr, Iran'),
('7878787878', 'Hossein', 'Vakili', 'hossein.vakili@example.com', 'hosseinSecure2024', NOW(), 'Active', 'Admin', NULL, 'Sanandaj, Iran'),
('9090909090', 'Mahsa', 'Kazemi', 'mahsa.kazemi@example.com', 'mahsa2025!', NOW(), 'Active', 'Customer', NULL, 'Birjand, Iran'),
('3131313131', 'Mehrdad', 'Ranjbar', 'mehrdad.r@example.com', 'mehrdadPW', NOW(), 'Active', 'Customer', NULL, 'Ilam, Iran'),
('6464646464', 'Elham', 'Hashemi', 'elham.hashemi@example.com', 'elhamSecure', NOW(), 'Active', 'Customer', NULL, 'Abadan, Iran');


SELECT * FROM users;
