-- Initial query: retrieves all bookings with user, property, and payment details
-- EXPLAIN

SELECT 
    b.booking_id,
    b.check_in,
    b.check_out,
    b.status,
    u.user_id,
    u.name AS user_name,
    u.email,
    p.property_id,
    p.title AS property_title,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.currency,
    pay.status AS payment_status
FROM Bookings b
JOIN Users u 
    ON b.guest_id = u.user_id
JOIN Properties p 
    ON b.property_id = p.property_id
LEFT JOIN Payments pay 
    ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'              -- filter bookings
  AND pay.status = 'successful'           -- filter payments
  AND p.location = 'Lagos'                -- filter property loca

