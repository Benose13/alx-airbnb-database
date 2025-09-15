
-- 1. INNER JOIN – Bookings with Users

SELECT 
    b.booking_id,
    b.property_id,
    b.check_in,
    b.check_out,
    b.status,
    u.user_id,
    u.name,
    u.email
FROM Bookings b
INNER JOIN Users u 
    ON b.guest_id = u.user_id;


-- 2. LEFT JOIN – Properties with Reviews

SELECT 
    p.property_id,
    p.title,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM Properties p
LEFT JOIN Reviews r 
    ON p.property_id = r.property_id;


-- 3. FULL OUTER JOIN – Users and Bookings

SELECT 
    u.user_id,
    u.name,
    u.email,
    b.booking_id,
    b.property_id,
    b.check_in,
    b.check_out,
    b.status
FROM Users u
FULL OUTER JOIN Bookings b 
    ON u.user_id = b.guest_id;
