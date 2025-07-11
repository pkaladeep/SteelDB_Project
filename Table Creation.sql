/*
 Group 21
 Name: Prachi Kaladeep (1234832237) Ishita Ahuja (123398064)
 Steel Manufacturing Management System Tables
 IFT 530 Final Project - Spring 2025
*/
-- 1. Raw_Materials
CREATE TABLE Raw_Materials (
    material_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    supplier VARCHAR(100) NOT NULL,
    arrival_date DATE NOT NULL,
    quantity_received DECIMAL(10,2) NOT NULL,
    unit VARCHAR(20) NOT NULL
);
-- 2. Machines
CREATE TABLE Machines (
    machine_id INT PRIMARY KEY,
    machine_name VARCHAR(100) NOT NULL,
    model VARCHAR(50) NOT NULL,
    purchase_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('Operational', 'Under Maintenance', 'Out Of Service'))
);
-- 3. Employees
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    department VARCHAR(50) NOT NULL
);
-- 4. Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL
);
-- 5. Production_Batches
CREATE TABLE Production_Batches (
    batch_id INT PRIMARY KEY,
    material_id INT NOT NULL,
    machine_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    produced_quantity DECIMAL(10,2) NOT NULL,
    shift VARCHAR(20) NOT NULL CHECK (shift IN ('Morning', 'Afternoon', 'Night')),
    FOREIGN KEY (material_id) REFERENCES Raw_Materials(material_id),
    FOREIGN KEY (machine_id) REFERENCES Machines(machine_id)
);
-- 6. Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_quantity DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('Pending', 'Processing', 'Completed', 'Cancelled')),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
-- 7. Quality_Reports
CREATE TABLE Quality_Reports (
    report_id INT PRIMARY KEY,
    batch_id INT NOT NULL,
    inspection_date DATE NOT NULL,
    quality_rating VARCHAR(20) NOT NULL,
    notes TEXT,
    FOREIGN KEY (batch_id) REFERENCES Production_Batches(batch_id)
);
-- 8. Shipments
CREATE TABLE Shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    shipment_date DATE NOT NULL,
    carrier VARCHAR(100) NOT NULL,
    tracking_number VARCHAR(50),
    status VARCHAR(20) NOT NULL CHECK (status IN ('Shipped', 'In Transit', 'Delivered', 'Delayed')),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
