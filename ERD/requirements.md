
**Entities & Attributes**

### **User**

* user\_id (PK)
* first\_name
* last\_name
* email (UNIQUE)
* password\_hash
* phone\_number (NULL)
* role (guest, host, admin)
* created\_at

### **Property**

* property\_id (PK)
* host\_id (FK → User.user\_id)
* name
* description
* location
* price\_per\_night
* created\_at
* updated\_at

### **Booking**

* booking\_id (PK)
* property\_id (FK → Property.property\_id)
* user\_id (FK → User.user\_id)
* start\_date
* end\_date
* total\_price
* status (pending, confirmed, canceled)
* created\_at

### **Payment**

* payment\_id (PK)
* booking\_id (FK → Booking.booking\_id)
* amount
* payment\_date
* payment\_method (credit\_card, paypal, stripe)

### **Review**

* review\_id (PK)
* property\_id (FK → Property.property\_id)
* user\_id (FK → User.user\_id)
* rating (1–5)
* comment
* created\_at

### **Message**

* message\_id (PK)
* sender\_id (FK → User.user\_id)
* recipient\_id (FK → User.user\_id)
* message\_body
* sent\_at


## **Step 2: Relationships**

1. **User – Property**:

   * A **User** (host) can list many **Properties**.
   * Relationship: `1 User (host) → many Properties`.

2. **User – Booking**:

   * A **User** (guest) can make many **Bookings**.
   * Relationship: `1 User → many Bookings`.

3. **Property – Booking**:

   * A **Property** can have many **Bookings**.
   * Relationship: `1 Property → many Bookings`.

4. **Booking – Payment**:

   * A **Booking** can have **one or many Payments** (e.g., installments).
   * Relationship: `1 Booking → many Payments`.

5. **User – Review**:

   * A **User** (guest) can leave many **Reviews**.
   * Relationship: `1 User → many Reviews`.

6. **Property – Review**:

   * A **Property** can have many **Reviews**.
   * Relationship: `1 Property → many Reviews`.

7. **User – Message (self-referencing)**:

   * A **User** can send many messages to another **User**.
   * Relationship: `1 User (sender) → many Messages → 1 User (recipient)`.
