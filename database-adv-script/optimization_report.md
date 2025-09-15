

## **Step 1: Initial Complex Query**

```sql
-- Initial query: retrieves all bookings with user, property, and payment details
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
ORDER BY b.check_in DESC;
```


## **Step 2: Analyze with `EXPLAIN` or `EXPLAIN ANALYZE`**

```sql
EXPLAIN ANALYZE
SELECT ...
```

### Common inefficiencies you may see:

* **Sequential Scan** on `Users`, `Properties`, or `Payments` (instead of index scan).
* **Unnecessary JOINs** if some fields aren’t needed.
* **Sorting cost** if `ORDER BY` is expensive (especially on large booking datasets).


## **Step 3: Refactored Query for Better Performance**

### Improvements Applied:

* Use **only required columns** (avoid `SELECT *`).
* Add **indexes** on join/filter columns:

  * `Bookings(guest_id, property_id, booking_id, check_in)`
  * `Payments(booking_id)`
  * `Users(user_id)`
  * `Properties(property_id)`
* Use **LEFT JOIN** only where necessary (Payments).

```sql
-- Refactored query: optimized joins and indexed columns
SELECT 
    b.booking_id,
    b.check_in,
    b.check_out,
    u.name AS user_name,
    p.title AS property_title,
    pay.amount,
    pay.status AS payment_status
FROM Bookings b
JOIN Users u 
    ON b.guest_id = u.user_id
JOIN Properties p 
    ON b.property_id = p.property_id
LEFT JOIN Payments pay 
    ON b.booking_id = pay.booking_id
ORDER BY b.check_in DESC;
```


## **Step 4: Benchmark Again with `EXPLAIN ANALYZE`**

Before indexes: expect sequential scans + high cost.
After indexes: planner should switch to **Index Scan** + reduce execution time (especially on large datasets).
