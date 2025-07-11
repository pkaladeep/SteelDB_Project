/*
 Group 21
 Name: Prachi Kaladeep (1234832237) Ishita Ahuja (123398064)
 Steel Manufacturing Management System Tables
 IFT 530 Final Project - Spring 2025
*/

-- =================== CLEANUP ===================
DROP VIEW IF EXISTS vw_CompletedOrders;
DROP VIEW IF EXISTS vw_RecentProductionBatches;
DROP VIEW IF EXISTS vw_QualityConcerns;

DROP TRIGGER IF EXISTS trg_Machines_Insert;
DROP TRIGGER IF EXISTS trg_Machines_Update;
DROP TRIGGER IF EXISTS trg_Machines_Delete;

DROP PROCEDURE IF EXISTS sp_InsertOrder;
DROP FUNCTION IF EXISTS dbo.fn_DaysToShip;

DROP TABLE IF EXISTS Machines_Audit;
DROP TABLE IF EXISTS Shipments;
DROP TABLE IF EXISTS Quality_Reports;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Production_Batches;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Machines;
DROP TABLE IF EXISTS Raw_Materials;
GO

-- =================== TABLES ===================
CREATE TABLE Raw_Materials (
    material_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    supplier VARCHAR(100) NOT NULL,
    arrival_date DATE NOT NULL,
    quantity_received DECIMAL(10,2) NOT NULL,
    unit VARCHAR(20) NOT NULL
);

CREATE TABLE Machines (
    machine_id INT PRIMARY KEY,
    machine_name VARCHAR(100) NOT NULL,
    model VARCHAR(50) NOT NULL,
    purchase_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('Operational', 'Under Maintenance', 'Out Of Service'))
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    department VARCHAR(50) NOT NULL
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL
);

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

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_quantity DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('Pending', 'Processing', 'Completed', 'Cancelled')),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Quality_Reports (
    report_id INT PRIMARY KEY,
    batch_id INT NOT NULL,
    inspection_date DATE NOT NULL,
    quality_rating VARCHAR(20) NOT NULL,
    notes TEXT,
    FOREIGN KEY (batch_id) REFERENCES Production_Batches(batch_id)
);

CREATE TABLE Shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    shipment_date DATE NOT NULL,
    carrier VARCHAR(100) NOT NULL,
    tracking_number VARCHAR(50),
    status VARCHAR(20) NOT NULL CHECK (status IN ('Shipped', 'In Transit', 'Delivered', 'Delayed')),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
GO

-- =================== DATA ===================
-- INSERT statements are large, so refer to the detailed data already prepared by the user for each table
-- INSERT INTO Raw_Materials ...
-- INSERT INTO Machines ...
-- INSERT INTO Employees ...
-- INSERT INTO Customers ...
-- INSERT INTO Production_Batches ...
-- INSERT INTO Orders ...
-- INSERT INTO Quality_Reports ...
-- INSERT INTO Shipments ...
GO

-- =================== VIEWS ===================
CREATE VIEW vw_CompletedOrders AS
SELECT o.order_id, o.order_date, o.order_quantity, c.company_name, c.contact_name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.status = 'Completed';
GO

CREATE VIEW vw_RecentProductionBatches AS
SELECT pb.batch_id, pb.start_date, pb.end_date, pb.produced_quantity, m.machine_name, m.status
FROM Production_Batches pb
JOIN Machines m ON pb.machine_id = m.machine_id
WHERE pb.start_date >= '2025-03-20';
GO

CREATE VIEW vw_QualityConcerns AS
SELECT qr.report_id, qr.batch_id, qr.quality_rating, qr.notes, pb.produced_quantity
FROM Quality_Reports qr
JOIN Production_Batches pb ON qr.batch_id = pb.batch_id
WHERE qr.quality_rating IN ('B', 'C');
GO

-- =================== AUDIT + TRIGGERS ===================
CREATE TABLE Machines_Audit (
    audit_id INT IDENTITY(1,1) PRIMARY KEY,
    machine_id INT,
    machine_name VARCHAR(100),
    model VARCHAR(50),
    operation_type VARCHAR(10),
    operation_time DATETIME DEFAULT GETDATE()
);
GO

CREATE TRIGGER trg_Machines_Insert
ON Machines
AFTER INSERT
AS
BEGIN
    INSERT INTO Machines_Audit (machine_id, machine_name, model, operation_type)
    SELECT machine_id, machine_name, model, 'INSERT' FROM inserted;
END;
GO

CREATE TRIGGER trg_Machines_Update
ON Machines
AFTER UPDATE
AS
BEGIN
    INSERT INTO Machines_Audit (machine_id, machine_name, model, operation_type)
    SELECT machine_id, machine_name, model, 'UPDATE' FROM inserted;
END;
GO

CREATE TRIGGER trg_Machines_Delete
ON Machines
AFTER DELETE
AS
BEGIN
    INSERT INTO Machines_Audit (machine_id, machine_name, model, operation_type)
    SELECT machine_id, machine_name, model, 'DELETE' FROM deleted;
END;
GO

-- =================== TEST TRIGGERS ===================
INSERT INTO Machines VALUES (11, 'Press Machine Z', 'PR-999', '2025-04-01', 'Operational');
UPDATE Machines SET status = 'Under Maintenance' WHERE machine_id = 11;
DELETE FROM Machines WHERE machine_id = 11;
SELECT * FROM Machines_Audit;
GO

-- =================== FUNCTION ===================
CREATE FUNCTION dbo.fn_DaysToShip(@orderId INT)
RETURNS INT
AS
BEGIN
    DECLARE @orderDate DATE, @shipDate DATE;
    SELECT @orderDate = order_date FROM Orders WHERE order_id = @orderId;
    SELECT @shipDate = shipment_date FROM Shipments WHERE order_id = @orderId;
    RETURN DATEDIFF(DAY, @orderDate, @shipDate);
END;
GO

-- =================== STORED PROCEDURE ===================
CREATE PROCEDURE sp_InsertOrder
    @customerId INT,
    @quantity DECIMAL(10,2),
    @status VARCHAR(20)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Customers WHERE customer_id = @customerId)
    BEGIN
        RAISERROR('Invalid customer ID', 16, 1);
        RETURN;
    END
    INSERT INTO Orders (customer_id, order_date, order_quantity, status)
    VALUES (@customerId, GETDATE(), @quantity, @status);
END;
GO

-- =================== CURSOR ===================
DECLARE @orderId INT, @status VARCHAR(20);
DECLARE order_cursor CURSOR FOR
SELECT order_id, status FROM Orders
WHERE status NOT IN ('Completed', 'Cancelled');
OPEN order_cursor;
FETCH NEXT FROM order_cursor INTO @orderId, @status;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Pending Order ID: ' + CAST(@orderId AS VARCHAR) + ' | Status: ' + @status;
    FETCH NEXT FROM order_cursor INTO @orderId, @status;
END;
CLOSE order_cursor;
DEALLOCATE order_cursor;
GO