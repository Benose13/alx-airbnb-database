
--1. Non-Correlated Subquery

SELECT 
    p.property_id,
    p.title,
    p.location
FROM Properties p
WHERE p.property_id IN (
    SELECT r.property_id
    FROM Reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);


-- 2. Correlated Subquery

SELECT 
    u.user_id,
    u.name,
    u.email
FROM Users u
WHERE (
    SELECT COUNT(*)
    FROM Bookings b
    WHERE b.guest_id = u.user_id
) > 3;
