USE rah_balad;

-- 1
CREATE INDEX idx_users_user_role ON users(user_role);

-- 3
CREATE INDEX idx_payment_user_date ON payment(user_id, payment_date);

-- 4
CREATE INDEX idx_reservations_payment_user ON reservations (payment_status, user_id);

-- 5
CREATE INDEX idx_reservation_date_user ON reservations(reservation_date, user_id);

-- 6
CREATE INDEX idx_payment_user_amount ON payment(user_id, amount_paid);

-- 7
CREATE INDEX idx_reservation_travel_status ON reservations(travel_id, payment_status);

-- 8
CREATE INDEX idx_reservation_date_status ON reservations(reservation_date, reservation_status);

-- 9
CREATE INDEX idx_address_province_city ON address (province, city);

-- 10
CREATE INDEX idx_users_registeration_date ON users (registeration_date);
CREATE INDEX idx_res_user_travel_status ON reservations(user_id, travel_id, payment_status);
CREATE INDEX idx_travel_route_address ON travel_route_and_date(travel_id, address_id);

-- 13
CREATE INDEX idx_vehicle_type ON vehicle(vehicle_type);

