# SteelDB_Project

A comprehensive **Steel Manufacturing Management System** built using SQL Server.

## 📌 Project Overview

This project simulates the database design and implementation for a steel manufacturing company. It models real-world operations including:

- Raw material tracking  
- Production batch management  
- Employee and machine records  
- Order processing and shipment tracking  
- Quality assurance logging  

The project features normalized table design, sample data population, views, stored procedures, user-defined functions, triggers, cursors, and audit logging mechanisms.

---

## 📁 Features Implemented

### 🗂️ Tables
- `Raw_Materials`
- `Machines`
- `Employees`
- `Customers`
- `Production_Batches`
- `Orders`
- `Quality_Reports`
- `Shipments`

All tables are created with relevant data types, constraints, and foreign key relationships to maintain referential integrity.

---

### 📊 Views
1. **`vw_CompletedOrders`** – Displays completed orders with customer details.
2. **`vw_RecentProductionBatches`** – Lists recent production batches with machine status.
3. **`vw_QualityConcerns`** – Highlights batches that received lower quality ratings.

---

### 🛠️ Stored Procedure
- **`sp_InsertOrder`** – Validates customer ID and inserts a new order securely.

### 🧮 User Defined Function (UDF)
- **`fn_DaysToShip(order_id)`** – Returns number of days between order and shipment dates.

---

### 🔄 Triggers & Audit Table
- Audit log for `Machines` table:
  - `trg_Machines_Insert`
  - `trg_Machines_Update`
  - `trg_Machines_Delete`
- All changes are recorded with a timestamp in the `Machines_Audit` table.

---

### 🔁 Cursor
- A `CURSOR` loops through all unshipped orders to simulate row-wise operations.

---

## 🧪 Sample Data
- Populated with realistic values:
  - 10 entries for dimension tables (e.g., Raw Materials, Customers)
  - 20–50 rows for transactional tables (e.g., Orders, Shipments, Batches)

---

## 🗂️ File List

- `Table Creation.sql`
- `Insert data.sql`
- `View 1 - vw_CompletedOrders.sql`
- `View 2.sql`, `View 3.sql`
- `Stored Procedure.sql`
- `UDF.sql`
- `Trigger.sql`
- `Audit.sql`
- `Cursor to Loop Through Unshipped Orders.sql`
- `Drop query.sql`
- `Test for audit.sql`
- `SteelDB_GRP 21.sql` (Consolidated script)

---

## 🏁 How to Run

1. Open SQL Server Management Studio.
2. Run `Table Creation.sql` to create schema.
3. Run `Insert data.sql` to populate tables.
4. Execute each `.sql` file as needed to add views, procedures, UDFs, triggers, and test cases.

---

## 💡 Learning Outcomes

- Real-world database modeling
- Use of constraints, foreign keys, and normalization
- Advanced SQL concepts like views, triggers, UDFs, stored procedures, and cursors
- Data auditing and validation best practices

---

## 📚 License
This project is for academic use only and was developed as part of ASU coursework.

---

## 📩 Contact
Feel free to connect:
- 📧 prachikaladeep@gmail.com
- 🌐 [LinkedIn](https://www.linkedin.com/in/prachi-kaladeep-a255121aa)

---
