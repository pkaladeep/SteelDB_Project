/*
 Group 21
 Name: Prachi Kaladeep (1234832237) Ishita Ahuja (123398064)
 Steel Manufacturing Management System Tables
 IFT 530 Final Project - Spring 2025
*/
-- Use: Tracks recent production for operational planning.

CREATE VIEW vw_RecentProductionBatches AS
SELECT pb.batch_id, pb.start_date, pb.end_date, pb.produced_quantity,
       m.machine_name, m.status
FROM Production_Batches pb
JOIN Machines m ON pb.machine_id = m.machine_id
WHERE pb.start_date >= '2025-03-20';

