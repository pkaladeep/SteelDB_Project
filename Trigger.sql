/*
 Group 21
 Name: Prachi Kaladeep (1234832237) Ishita Ahuja (123398064)
 Steel Manufacturing Management System Tables
 IFT 530 Final Project - Spring 2025
*/
-- Trigger: INSERT
CREATE TRIGGER trg_Machines_Insert
ON Machines
AFTER INSERT
AS
BEGIN
    INSERT INTO Machines_Audit (machine_id, machine_name, model, operation_type)
    SELECT machine_id, machine_name, model, 'INSERT' FROM inserted;
END;
GO

-- Trigger: UPDATE
CREATE TRIGGER trg_Machines_Update
ON Machines
AFTER UPDATE
AS
BEGIN
    INSERT INTO Machines_Audit (machine_id, machine_name, model, operation_type)
    SELECT machine_id, machine_name, model, 'UPDATE' FROM inserted;
END;
GO

-- Trigger: DELETE
CREATE TRIGGER trg_Machines_Delete
ON Machines
AFTER DELETE
AS
BEGIN
    INSERT INTO Machines_Audit (machine_id, machine_name, model, operation_type)
    SELECT machine_id, machine_name, model, 'DELETE' FROM deleted;
END;
GO
