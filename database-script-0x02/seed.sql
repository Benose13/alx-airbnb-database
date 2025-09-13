-- =======================
-- USERS
-- =======================
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '+2348011111111', 'guest', NOW()),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '+2348022222222', 'host', NOW()),
('33333333-3333-3333-3333-333333333333', 'Carol', 'Davis', 'carol@example.com', 'hashed_pw_3', '+2348033333333', 'guest', NOW()),
('44444444-4444-4444-4444-444444444444', 'David', 'Lee', 'david@example.com', 'hashed_pw_4', '+2348044444444', 'admin', NOW());

-- =======================
-- PROPERTIES
-- =======================
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at) VALUES
('aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Cozy Apartment', '2-bedroom apartment in Lagos with free WiFi.', 'Lagos, Nigeria', 45.00, NOW(), NOW()),
('bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222', 'Beachfront Villa', 'Luxury villa with private pool near the beach.', 'Accra, Ghana', 120.00, NOW(), NOW());

-- =======================
-- BOOKINGS
-- =======================
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('cccc1111-cccc-cccc-cccc-cccccccccccc', 'aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2025-09-01', '2025-09-05', 180.00, 'confirmed', NOW()),
('dddd2222-dddd-dddd-dddd-dddddddddddd', 'bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '33333333-3333-3333-3333-333333333333', '2025-10-10', '2025-10-15', 600.00, 'pending', NOW());

-- =======================
-- PAYMENTS
-- =======================
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('eeee1111-eeee-eeee-eeee-eeeeeeeeeeee', 'cccc1111-cccc-cccc-cccc-cccccccccccc', 180.00, NOW(), 'credit_card'),
('ffff2222-ffff-ffff-ffff-ffffffffffff', 'dddd2222-dddd-dddd-dddd-dddddddddddd', 200.00, NOW(), 'paypal');

-- =======================
-- REVIEWS
-- =======================
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('gggg1111-gggg-gggg-gggg-gggggggggggg', 'aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 5, 'Amazing apartment, very clean and comfortable!', NOW()),
('hhhh2222-hhhh-hhhh-hhhh-hhhhhhhhhhhh', 'bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '33333333-3333-3333-3333-333333333333', 4, 'Great villa, but WiFi was slow.', NOW());

-- =======================
-- MESSAGES
-- =======================
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('iiii1111-iiii-iiii-iiii-iiiiiiiiiiii', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Bob, I am interested in booking your Lagos apartment.', NOW()),
('jjjj2222-jjjj-jjjj-jjjj-jjjjjjjjjjjj', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Alice, thanks for reaching out. The apartment is available!', NOW());
