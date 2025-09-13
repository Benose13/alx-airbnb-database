
# 📄 Database Normalization to 3NF

## Step 1: Recap of Normalization Rules

* **1NF (First Normal Form)**

  * Eliminate repeating groups; each column holds atomic values.
* **2NF (Second Normal Form)**

  * Meet 1NF + remove partial dependencies (non-key attributes must depend on the whole primary key).
* **3NF (Third Normal Form)**

  * Meet 2NF + remove transitive dependencies (non-key attributes must depend only on the primary key, not other non-key attributes).

---

## Step 2: Review of Airbnb Schema

### **User**

* Attributes: user\_id (PK), first\_name, last\_name, email (unique), password\_hash, phone\_number, role, created\_at.
* ✅ Already in 3NF. All attributes depend only on `user_id`.

### **Property**

* Attributes: property\_id (PK), host\_id (FK), name, description, location, price\_per\_night, created\_at, updated\_at.
* ✅ In 3NF. Each attribute describes only the property. `host_id` is a valid FK reference to User.

### **Booking**

* Attributes: booking\_id (PK), property\_id (FK), user\_id (FK), start\_date, end\_date, total\_price, status, created\_at.
* ⚠️ **Potential issue:** `total_price` could be considered derived (calculated from `price_per_night * number_of_nights`). Storing derived attributes can introduce redundancy.
* ✅ To maintain 3NF, you can:

  * Either keep it for performance (denormalization)
  * Or remove it and calculate dynamically when needed.

### **Payment**

* Attributes: payment\_id (PK), booking\_id (FK), amount, payment\_date, payment\_method.
* ✅ In 3NF. All attributes describe a payment.

### **Review**

* Attributes: review\_id (PK), property\_id (FK), user\_id (FK), rating, comment, created\_at.
* ✅ In 3NF. Attributes depend only on review\_id.

### **Message**

* Attributes: message\_id (PK), sender\_id (FK), recipient\_id (FK), message\_body, sent\_at.
* ✅ In 3NF. All attributes depend only on message\_id.

---

## Step 3: Adjustments Made

* **Booking table**: Considered removing `total_price` to avoid redundancy. If retained, document that it’s a **derived attribute** stored for efficiency (but not strictly normalized).
* No other tables showed redundancy or transitive dependencies.

---

## ✅ Final Notes

* The schema **meets 3NF** after reviewing.
* The only consideration is `total_price` in **Booking**, which is denormalized. Best practice is to **exclude it** and compute dynamically, but it can remain if performance is prioritized (with clear documentation).

---

### Final 3NF Schema

* **User (user\_id PK, first\_name, last\_name, email UNIQUE, password\_hash, phone\_number, role, created\_at)**
* **Property (property\_id PK, host\_id FK, name, description, location, price\_per\_night, created\_at, updated\_at)**
* **Booking (booking\_id PK, property\_id FK, user\_id FK, start\_date, end\_date, status, created\_at)**
* **Payment (payment\_id PK, booking\_id FK, amount, payment\_date, payment\_method)**
* **Review (review\_id PK, property\_id FK, user\_id FK, rating, comment, created\_at)**
* **Message (message\_id PK, sender\_id FK, recipient\_id FK, message\_body, sent\_at)**
