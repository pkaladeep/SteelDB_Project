/*
 Group 21
 Name: Prachi Kaladeep (1234832237) Ishita Ahuja (123398064)
 Steel Manufacturing Management System Tables
 IFT 530 Final Project - Spring 2025
*/
-- Test INSERT
INSERT INTO Machines VALUES (11, 'Press Machine Z', 'PR-999', '2025-04-01', 'Operational');

-- Test UPDATE
UPDATE Machines SET status = 'Under Maintenance' WHERE machine_id = 11;

-- Test DELETE
DELETE FROM Machines WHERE machine_id = 11;

-- Verify Audit Log
SELECT * FROM Machines_Audit;
