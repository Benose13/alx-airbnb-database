
-- ==========================
-- Users Table Indexes
-- EXPLAIN ANALYZE
-- ==========================
CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_users_userid ON Users(user_id);

-- ==========================
-- Bookings Table Indexes
-- EXPLAIN ANALYZE
-- ==========================
CREATE INDEX idx_bookings_guestid ON Bookings(guest_id);
CREATE INDEX idx_bookings_propertyid ON Bookings(property_id);
CREATE INDEX idx_bookings_checkin_checkout ON Bookings(check_in, check_out);

-- ==========================
-- Properties Table Indexes
-- EXPLAIN ANALYZE
-- ==========================
CREATE INDEX idx_properties_location ON Properties(location);
CREATE INDEX idx_properties_price ON Properties(price);
CREATE INDEX idx_properties_title ON Properties(title);
CREATE INDEX idx_properties_propertyid ON Properties(property_id);
