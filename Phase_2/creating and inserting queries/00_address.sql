DROP DATABASE IF EXISTS rah_balad;

CREATE DATABASE rah_balad;

USE rah_balad;

DROP TABLE IF EXISTS address;

CREATE TABLE address (
  address_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  street VARCHAR(255),
  district TINYINT,
  city VARCHAR(100) NOT NULL,
  province VARCHAR(100),
  postal_code VARCHAR(20),
  country VARCHAR(100) DEFAULT 'Iran'
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO address (street, district, city, province, postal_code, country)
VALUES
  ('Azadi St', 1, 'Tehran', 'Tehran', '1234567891', 'Iran'),
  ('Enghelab St', 2, 'Tehran', 'Tehran', '9876543211', 'Iran'),
  ('Shahid Beheshti St', 3, 'Shiraz', 'Fars', '1122334456', 'Iran'),
  ('Hakim St', 4, 'Isfahan', 'Isfahan', '2233445567', 'Iran'),
  ('Keshavarz Blvd', 5, 'Mashhad', 'Khorasan Razavi', '3344556678', 'Iran'),
  ('Pahlavi St', 1, 'Kerman', 'Kerman', '4455667789', 'Iran'),
  ('Roudaki St', 2, 'Tabriz', 'East Azerbaijan', '5566778900', 'Iran'),
  ('Shahrak-e-Tajrish', 3, 'Rasht', 'Gilan', '6677889901', 'Iran'),
  ('Beheshti St', 4, 'Karaj', 'Alborz', '7788990012', 'Iran'),
  ('Sattar Khan St', 5, 'Hamedan', 'Hamedan', '8899001123', 'Iran'),
  ('Tajrish St', 1, 'Kashan', 'Isfahan', '9900112234', 'Iran'),
  ('Zahedan St', 2, 'Zahedan', 'Sistan and Baluchestan', '1011121315', 'Iran'),
  ('Shahr-e-Aftab', 3, 'Gorgan', 'Golestan', '1112131416', 'Iran'),
  ('Valiasr Ave', 4, 'Bushehr', 'Bushehr', '1213141517', 'Iran'),
  ('Shahr-e-Kavian', 5, 'Sanandaj', 'Kurdistan', '1314151618', 'Iran'),
  ('Hafez St', 1, 'Birjand', 'South Khorasan', '1415161719', 'Iran'),
  ('Tehran-Karaj Road', 2, 'Ilam', 'Ilam', '1516171820', 'Iran'),
  ('Imam Ali St', 3, 'Abadan', 'Khuzestan', '1617181921', 'Iran'),
  ('Jahad St', 4, 'Kermanshah', 'Kermanshah', '1718192022', 'Iran'),
  ('Zeynabieh St', 5, 'Zanjan', 'Zanjan', '1819202123', 'Iran'),
  ('Molla Sadra St', 1, 'Sari', 'Mazandaran', '1920212224', 'Iran'),
  ('Shamsi St', 2, 'Qazvin', 'Qazvin', '2021222325', 'Iran'),
  ('Gharb St', 3, 'Bandar Abbas', 'Hormozgan', '2122232426', 'Iran'),
  ('Mirdamad St', 4, 'Yazd', 'Yazd', '2223242527', 'Iran'),
  ('Sina St', 5, 'Mashhad', 'Khorasan Razavi', '2324252628', 'Iran'),
  ('Seyed Khandan St', 1, 'Tehran', 'Tehran', '2425262729', 'Iran'),
  ('Jomhouri Blvd', 2, 'Kerman', 'Kerman', '2526272830', 'Iran'),
  ('Shahid Mofatteh St', 3, 'Tabriz', 'East Azerbaijan', '2627282931', 'Iran'),
  ('Fadak St', 4, 'Rasht', 'Gilan', '2728293032', 'Iran'),
  ('Aliabad St', 5, 'Karaj', 'Alborz', '2829303133', 'Iran'),
  ('Darvazeh Dolat St', 1, 'Shiraz', 'Fars', '2929313234', 'Iran'),
  ('Sohrevardi St', 2, 'Isfahan', 'Isfahan', '3031323335', 'Iran'),
  ('Azadi Blvd', 3, 'Tehran', 'Tehran', '3132333436', 'Iran'),
  ('Vahid St', 4, 'Kashan', 'Isfahan', '3233343537', 'Iran'),
  ('Parvaneh St', 5, 'Zahedan', 'Sistan and Baluchestan', '3334353638', 'Iran');

SELECT * FROM address;