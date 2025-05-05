USE rah_balad;

-- 1
-- CREATE INDEX idx_users_user_role ON users(user_role);
SELECT u.user_id, first_name, last_name 
FROM users u
LEFT JOIN reservations r ON u.user_id = r.user_id
WHERE r.reservation_id IS NULL AND u.user_role = 'Customer';

-- 2
SELECT u.user_id, u.first_name, u.last_name, COUNT(*) AS numer_of_reservations
FROM users u
JOIN reservations r ON u.user_id = r.user_id
WHERE u.user_role = 'Customer'
GROUP BY u.user_id;

-- 3
-- CREATE INDEX idx_payment_user_date ON payment(user_id, payment_date);
SELECT 
  u.user_id,
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

-- 6
-- CREATE INDEX idx_payment_user_amount ON payment(user_id, amount_paid);
SELECT 
  u.user_id,
  u.first_name,
  u.last_name,
  u.email,
  pn.phone_number,
  SUM(p.amount_paid) AS total_paid
FROM users u
LEFT JOIN payment p ON u.user_id = p.user_id
LEFT JOIN phone_number pn ON u.user_id = pn.user_id
GROUP BY u.user_id, pn.phone_number, u.email, u.first_name, u.last_name
HAVING total_paid > (
  SELECT AVG(user_total)
  FROM (
    SELECT SUM(amount_paid) AS user_total
    FROM payment
    GROUP BY user_id
  ) AS user_totals
);

-- 7
-- CREATE INDEX idx_reservation_travel_status ON reservations(travel_id, payment_status);
SELECT 
  v.vehicle_type,
  COUNT(r.reservation_id) AS number_of_tickets_sold
FROM vehicle v
JOIN travel t ON v.vehicle_id = t.vehicle_id
JOIN reservations r ON t.travel_id = r.travel_id
WHERE r.payment_status = 'Completed'
GROUP BY v.vehicle_type;

-- 8
