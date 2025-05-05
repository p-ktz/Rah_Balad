USE rah_balad;

-- 1
CREATE INDEX idx_users_user_role ON users(user_role);

-- 3
CREATE INDEX idx_payment_user_date ON payment(user_id, payment_date);

-- 5
CREATE INDEX idx_reservation_date_user ON reservations(reservation_date, user_id);

-- 6
CREATE INDEX idx_payment_user_amount ON payment(user_id, amount_paid);

-- 7
CREATE INDEX idx_reservation_travel_status ON reservations(travel_id, payment_status);

-- 8
CREATE INDEX idx_reservation_date_status ON reservations(reservation_date, reservation_status);

-- 9
CREATE INDEX idx_users_address_userid ON users(address, user_id);