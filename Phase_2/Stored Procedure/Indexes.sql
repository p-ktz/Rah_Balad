-- 1
CREATE INDEX idx_users_email ON users(email);

-- 1.1
CREATE INDEX idx_phone_number_phone ON phone_number(phone_number);

-- 2
CREATE INDEX idx_get_checked_admin_status ON rah_balad.get_checked (users_admin_id, status);

-- 3
CREATE INDEX idx_address_city ON address(city);

-- 4
CREATE INDEX idx_users_fullname ON users (first_name, last_name);
CREATE INDEX idx_travel_class ON travel (travel_class);

-- 5