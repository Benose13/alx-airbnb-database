-- Drop old table if needed (backup before running in production!)
DROP TABLE IF EXISTS Bookings CASCADE;

-- Create partitioned Bookings table by start_date (check_in)
CREATE TABLE Bookings (
    booking_id    SERIAL PRIMARY KEY,
    guest_id      INT NOT NULL,
    property_id   INT NOT NULL,
    check_in      DATE NOT NULL,
    check_out     DATE NOT NULL,
    status        VARCHAR(20) NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (check_in);

-- Example partitions (quarterly by year 2025)
CREATE TABLE Bookings_2025_Q1 PARTITION OF Bookings
    FOR VALUES FROM ('2025-01-01') TO ('2025-04-01');

CREATE TABLE Bookings_2025_Q2 PARTITION OF Bookings
    FOR VALUES FROM ('2025-04-01') TO ('2025-07-01');

CREATE TABLE Bookings_2025_Q3 PARTITION OF Bookings
    FOR VALUES FROM ('2025-07-01') TO ('2025-10-01');

CREATE TABLE Bookings_2025_Q4 PARTITION OF Bookings
    FOR VALUES FROM ('2025-10-01') TO ('2026-01-01');

-- Future partitions can be added dynamically as needed
