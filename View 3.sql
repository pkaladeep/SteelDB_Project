/*
 Group 21
 Name: Prachi Kaladeep (1234832237) Ishita Ahuja (123398064)
 Steel Manufacturing Management System Tables
 IFT 530 Final Project - Spring 2025
*/
-- Use: Highlights batches needing QA review.

CREATE VIEW vw_QualityConcerns AS
SELECT qr.report_id, qr.batch_id, qr.quality_rating, qr.notes,
       pb.produced_quantity
FROM Quality_Reports qr
JOIN Production_Batches pb ON qr.batch_id = pb.batch_id
WHERE qr.quality_rating IN ('B', 'C');

