
## **Step 1: Identify High-Usage Columns**

* **Users Table**

  * `user_id` → used in `JOIN` with Bookings
  * `email` → used in `WHERE` for login/authentication

* **Bookings Table**

  * `booking_id` → primary key, often filtered
  * `guest_id` → foreign key to Users
  * `property_id` → foreign key to Properties
  * `check_in, check_out` → used in availability checks

* **Properties Table**

  * `property_id` → primary key, used in joins
  * `location` → used in search filters
  * `price` → used in range filters
  * `title` → sometimes in search (partial matches)


## **Step 2: Create Indexes**

```sql
-- ==========================
-- Users Table Indexes
-- ==========================
CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_users_userid ON Users(user_id);

-- ==========================
-- Bookings Table Indexes
-- ==========================
CREATE INDEX idx_bookings_guestid ON Bookings(guest_id);
CREATE INDEX idx_bookings_propertyid ON Bookings(property_id);
CREATE INDEX idx_bookings_checkin_checkout ON Bookings(check_in, check_out);

-- ==========================
-- Properties Table Indexes
-- ==========================
CREATE INDEX idx_properties_location ON Properties(location);
CREATE INDEX idx_properties_price ON Properties(price);
CREATE INDEX idx_properties_title ON Properties(title);
CREATE INDEX idx_properties_propertyid ON Properties(property_id);
```

---

## **Step 3: Measure Performance Before & After Indexing**

1. **Run without indexes**

```sql
EXPLAIN ANALYZE
SELECT p.title, b.check_in, b.check_out
FROM Properties p
JOIN Bookings b ON p.property_id = b.property_id
WHERE p.location = 'New York'
  AND p.price BETWEEN 100 AND 300;
```

* Before indexing, the query will likely use **sequential scans** on `Properties` and `Bookings`.

2. **Run after adding indexes**

```sql
EXPLAIN ANALYZE
SELECT p.title, b.check_in, b.check_out
FROM Properties p
JOIN Bookings b ON p.property_id = b.property_id
WHERE p.location = 'New York'
  AND p.price BETWEEN 100 AND 300;
```

* After indexing, the planner should use **Index Scan** on `idx_properties_location`, `idx_properties_price`, and `idx_bookings_propertyid`.
* Expect query runtime to drop significantly (especially on large datasets).
