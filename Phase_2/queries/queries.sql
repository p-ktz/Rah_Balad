USE rah_balad;

-- 1
-- CREATE INDEX idx_users_user_role ON users(user_role);
SELECT first_name, last_name 
FROM users u
LEFT JOIN reservations r ON u.user_id = r.user_id
WHERE r.reservation_id IS NULL AND u.user_role = 'Customer';

-- 2
SELECT u.first_name, u.last_name, COUNT(*) AS numer_of_reservations
FROM users u
JOIN reservations r ON u.user_id = r.user_id
WHERE u.user_role = 'Customer'
GROUP BY u.user_id;

-- 3
-- CREATE INDEX idx_payment_user_date ON payment(user_id, payment_date);
SELECT 
  u.first_name,
  u.last_name,
  DATE_FORMAT(p.payment_date, '%Y-%m') AS payment_month,
  SUM(p.amount_paid) AS total_paid
FROM payment p
JOIN users u ON p.user_id = u.user_id
GROUP BY u.user_id, payment_month
ORDER BY u.user_id, payment_month;

-- 4
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.address,
    COUNT(r.reservation_id) AS reservation_count
FROM users u
JOIN reservations r ON u.user_id = r.user_id
GROUP BY u.user_id, u.address
HAVING COUNT(r.reservation_id) = 1
ORDER BY u.address;

-- 5
-- CREATE INDEX idx_reservation_date_user ON reservations(reservation_date, user_id);
SELECT 
  u.user_id, 
  u.first_name, 
  u.last_name, 
  u.email, 
  u.address, 
  r.reservation_date
FROM users u
JOIN reservations r ON u.user_id = r.user_id
WHERE r.reservation_date = (
  SELECT MAX(reservation_date)
  FROM reservations
);

-- 5.1
SELECT 
  u.user_id, 
  u.first_name, 
  u.last_name, 
  u.email, 
  u.address, 
  r.reservation_date
FROM users u
JOIN reservations r ON u.user_id = r.user_id
WHERE r.payment_status = 'Completed'
ORDER BY r.reservation_date DESC
LIMIT 1;



