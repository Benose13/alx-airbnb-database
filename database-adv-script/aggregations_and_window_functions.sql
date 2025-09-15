
-- 1. Aggregation with `COUNT` + `GROUP BY`

SELECT  
    u.user_id,
    u.name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_num
FROM Users u
LEFT JOIN Bookings b 
    ON u.user_id = b.guest_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;


-- 2. Window Function for Ranking Properties

SELECT 
    p.property_id,
    p.title,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Properties p
LEFT JOIN Bookings b 
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.title
ORDER BY booking_rank;
