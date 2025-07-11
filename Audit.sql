/*
 Group 21
 Name: Prachi Kaladeep (1234832237) Ishita Ahuja (123398064)
 Steel Manufacturing Management System Tables
 IFT 530 Final Project - Spring 2025
*/

CREATE TABLE Machines_Audit (
    audit_id INT IDENTITY(1,1) PRIMARY KEY,
    machine_id INT,
    machine_name VARCHAR(100),
    model VARCHAR(50),
    operation_type VARCHAR(10), 
    operation_time DATETIME DEFAULT GETDATE()
);
