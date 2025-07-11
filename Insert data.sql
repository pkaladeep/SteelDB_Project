/*
 Group 21
 Name: Prachi Kaladeep (1234832237) Ishita Ahuja (123398064)
 Steel Manufacturing Management System Tables
 IFT 530 Final Project - Spring 2025
*/


INSERT INTO Raw_Materials VALUES
(1, 'Iron Ore', 'Metal', 'Odisha Mining Corp', '2025-03-02', 83.13, 'Kg'),
(2, 'Coking Coal', 'Fuel', 'Bharat Coal Ltd', '2025-03-03', 34.80, 'Kg'),
(3, 'Limestone', 'Additive', 'Chhattisgarh Minerals', '2025-03-04', 152.14, 'Kg'),
(4, 'Dolomite', 'Additive', 'Madhya Bharat Mines', '2025-03-05', 75.76, 'Kg'),
(5, 'Scrap Steel', 'Recycled', 'EcoScrap India', '2025-03-06', 110.34, 'Tons'),
(6, 'Silicon Manganese', 'Alloy', 'Sarda Metals', '2025-03-07', 103.01, 'Tons'),
(7, 'Ferro Chrome', 'Alloy', 'Tata Steel Alloys', '2025-03-08', 186.34, 'Tons'),
(8, 'Aluminium Ingot', 'Alloy', 'Nalco', '2025-03-09', 44.55, 'Kg'),
(9, 'Zinc Dust', 'Additive', 'Hindustan Zinc', '2025-03-10', 187.73, 'Tons'),
(10, 'Nickel Powder', 'Alloy', 'Jindal Powders', '2025-03-11', 132.66, 'Kg');

INSERT INTO Machines VALUES
(1, 'Blast Furnace A', 'BF-1000', '2023-06-10', 'Out Of Service'),
(2, 'Rolling Mill B', 'RM-2000', '2022-08-19', 'Out Of Service'),
(3, 'Crusher Unit C', 'CR-450', '2021-04-16', 'Out Of Service'),
(4, 'Conveyor System D', 'CV-550', '2023-09-07', 'Out Of Service'),
(5, 'Electric Arc Furnace', 'EAF-650', '2023-12-21', 'Under Maintenance'),
(6, 'Lathe Machine', 'LT-890', '2022-06-26', 'Operational'),
(7, 'Heat Treatment Oven', 'HT-770', '2021-12-11', 'Out Of Service'),
(8, 'Mixer Z', 'MX-920', '2019-06-09', 'Out Of Service'),
(9, 'Billet Cutter', 'BC-101', '2020-12-16', 'Out Of Service'),
(10, 'Cooling Tower', 'CT-690', '2024-04-06', 'Under Maintenance');

INSERT INTO Employees VALUES
(1, 'Aditya', 'Desai', 'Manager', '2020-07-12', 'Operations'),
(2, 'Aarav', 'Sharma', 'Manager', '2023-10-30', 'Operations'),
(3, 'Ananya', 'Sharma', 'Electrician', '2023-03-17', 'Maintenance'),
(4, 'Aditya', 'Sharma', 'Manager', '2020-04-16', 'Management'),
(5, 'Neha', 'Mehta', 'Supervisor', '2021-09-06', 'Scheduling'),
(6, 'Isha', 'Singh', 'Manager', '2023-04-21', 'Production'),
(7, 'Aarav', 'Verma', 'Electrician', '2023-02-03', 'Scheduling'),
(8, 'Neha', 'Kapoor', 'Technician', '2022-03-01', 'Scheduling'),
(9, 'Ananya', 'Mehta', 'Technician', '2020-03-16', 'Operations'),
(10, 'Neha', 'Sharma', 'Electrician', '2021-05-03', 'Production');

INSERT INTO Customers VALUES
(1, 'BuildStrong Inc.', 'Alice Walker', 'alice@buildstrong.com', '5551234567', '123 Industrial Rd, NY'),
(2, 'SteelForge Ltd.', 'Bob Wright', 'bob@steelforge.com', '5552345678', '45 Metal Ave, PA'),
(3, 'IronEdge', 'Carol Johnson', 'carol@ironedge.com', '5553456789', '789 Edge St, TX'),
(4, 'Metallix', 'David King', 'david@metallix.com', '5554567890', '321 Alloy Blvd, CA'),
(5, 'TitaniumTech', 'Eva Smith', 'eva@titaniumtech.com', '5555678901', '66 Tech Park, WA'),
(6, 'HeavySteel', 'Frank Green', 'frank@heavysteel.com', '5556789012', '12 Bulk Zone, IL'),
(7, 'IronClad Corp', 'Grace Lee', 'grace@ironclad.com', '5557890123', '555 Mill St, NJ'),
(8, 'ForgeWorks', 'Henry Adams', 'henry@forgeworks.com', '5558901234', '888 Forge Rd, OH'),
(9, 'MegaSteel Ltd.', 'Irene Hall', 'irene@megasteel.com', '5559012345', '777 Mega Ave, MI'),
(10, 'SteelSmiths', 'Jack White', 'jack@steelsmiths.com', '5550123456', '101 Foundry Ln, FL');

INSERT INTO Production_Batches VALUES
(1, 6, 3, '2025-03-17', '2025-03-20', 228.88, 'Morning'),
(2, 3, 3, '2025-03-10', '2025-03-11', 68.75, 'Morning'),
(3, 10, 5, '2025-03-27', '2025-03-29', 455.60, 'Afternoon'),
(4, 5, 5, '2025-03-19', '2025-03-22', 411.58, 'Night'),
(5, 7, 2, '2025-03-26', '2025-03-27', 196.57, 'Afternoon'),
(6, 1, 4, '2025-03-11', '2025-03-13', 348.22, 'Night'),
(7, 9, 6, '2025-03-22', '2025-03-24', 189.90, 'Afternoon'),
(8, 2, 9, '2025-03-12', '2025-03-14', 92.43, 'Morning'),
(9, 4, 8, '2025-03-13', '2025-03-15', 256.76, 'Night'),
(10, 8, 1, '2025-03-21', '2025-03-23', 312.19, 'Afternoon'),
(11, 6, 4, '2025-03-25', '2025-03-26', 199.99, 'Morning'),
(12, 3, 2, '2025-03-14', '2025-03-15', 275.00, 'Night'),
(13, 7, 7, '2025-03-28', '2025-03-30', 485.67, 'Afternoon'),
(14, 1, 5, '2025-03-18', '2025-03-20', 212.54, 'Morning'),
(15, 2, 6, '2025-03-19', '2025-03-21', 144.33, 'Night'),
(16, 10, 10, '2025-03-20', '2025-03-22', 176.45, 'Morning'),
(17, 5, 3, '2025-03-15', '2025-03-17', 368.12, 'Afternoon'),
(18, 8, 2, '2025-03-23', '2025-03-25', 159.77, 'Morning'),
(19, 9, 1, '2025-03-29', '2025-03-30', 206.85, 'Night'),
(20, 4, 7, '2025-03-24', '2025-03-26', 141.60, 'Afternoon'),
(21, 6, 9, '2025-03-10', '2025-03-12', 329.88, 'Morning'),
(22, 1, 8, '2025-03-16', '2025-03-17', 297.47, 'Afternoon'),
(23, 3, 10, '2025-03-11', '2025-03-13', 177.12, 'Morning'),
(24, 2, 7, '2025-03-28', '2025-03-29', 114.26, 'Night'),
(25, 4, 10, '2025-03-15', '2025-03-17', 121.39, 'Morning');

INSERT INTO Orders VALUES
(1, 8, '2025-04-04', 150.38, 'Processing'),
(2, 6, '2025-04-02', 245.80, 'Completed'),
(3, 6, '2025-04-03', 225.88, 'Completed'),
(4, 1, '2025-04-07', 68.03, 'Processing'),
(5, 3, '2025-04-02', 101.38, 'Processing'),
(6, 5, '2025-04-11', 378.92, 'Cancelled'),
(7, 9, '2025-04-12', 487.12, 'Processing'),
(8, 4, '2025-04-01', 298.00, 'Pending'),
(9, 2, '2025-04-06', 199.25, 'Processing'),
(10, 10, '2025-04-03', 276.63, 'Completed'),
(11, 7, '2025-04-13', 311.40, 'Processing'),
(12, 1, '2025-04-08', 183.77, 'Cancelled'),
(13, 5, '2025-04-10', 341.55, 'Pending'),
(14, 6, '2025-04-14', 267.00, 'Processing'),
(15, 3, '2025-04-05', 91.28, 'Completed'),
(16, 2, '2025-04-09', 402.66, 'Processing'),
(17, 7, '2025-04-12', 137.99, 'Completed'),
(18, 9, '2025-04-07', 320.88, 'Cancelled'),
(19, 8, '2025-04-02', 279.40, 'Pending'),
(20, 10, '2025-04-11', 489.20, 'Completed'),
(21, 4, '2025-04-03', 119.30, 'Processing'),
(22, 1, '2025-04-05', 233.56, 'Processing'),
(23, 6, '2025-04-13', 312.90, 'Completed'),
(24, 3, '2025-04-06', 105.75, 'Processing'),
(25, 2, '2025-04-14', 322.55, 'Cancelled');

INSERT INTO Quality_Reports VALUES
(1, 5, '2025-04-07', 'B', 'Minor deviation noted in round 1.'),
(2, 13, '2025-04-04', 'B', 'Minor deviation noted in round 2.'),
(3, 5, '2025-04-06', 'C', 'Minor deviation noted in round 3.'),
(4, 13, '2025-04-01', 'C', 'Minor deviation noted in round 4.'),
(5, 10, '2025-04-02', 'B', 'Minor deviation noted in round 5.'),
(6, 21, '2025-04-06', 'A', 'Inspection round 6, all within threshold.'),
(7, 9, '2025-04-03', 'A', 'Inspection round 7, all within threshold.'),
(8, 12, '2025-04-08', 'B', 'Minor deviation noted in round 8.'),
(9, 6, '2025-04-02', 'A', 'Inspection round 9, all within threshold.'),
(10, 3, '2025-04-05', 'C', 'Minor deviation noted in round 10.'),
(11, 18, '2025-04-07', 'B', 'Minor deviation noted in round 11.'),
(12, 24, '2025-04-04', 'C', 'Minor deviation noted in round 12.'),
(13, 1, '2025-04-01', 'A', 'Inspection round 13, all within threshold.'),
(14, 20, '2025-04-09', 'A', 'Inspection round 14, all within threshold.'),
(15, 14, '2025-04-06', 'B', 'Minor deviation noted in round 15.'),
(16, 8, '2025-04-03', 'C', 'Minor deviation noted in round 16.'),
(17, 16, '2025-04-08', 'A', 'Inspection round 17, all within threshold.'),
(18, 22, '2025-04-05', 'B', 'Minor deviation noted in round 18.'),
(19, 7, '2025-04-04', 'C', 'Minor deviation noted in round 19.'),
(20, 11, '2025-04-07', 'B', 'Minor deviation noted in round 20.'),
(21, 15, '2025-04-06', 'A', 'Inspection round 21, all within threshold.'),
(22, 4, '2025-04-01', 'B', 'Minor deviation noted in round 22.'),
(23, 17, '2025-04-09', 'C', 'Minor deviation noted in round 23.'),
(24, 19, '2025-04-08', 'B', 'Minor deviation noted in round 24.'),
(25, 23, '2025-04-10', 'A', 'Inspection round 25, all within threshold.');

INSERT INTO Shipments VALUES
(1, 15, '2025-04-20', 'IndianPost', 'TRK0001481', 'In Transit'),
(2, 2, '2025-04-18', 'VRL Logistics', 'TRK0002261', 'Delivered'),
(3, 8, '2025-04-15', 'BlueDart', 'TRK0003711', 'Delayed'),
(4, 21, '2025-04-17', 'IndianPost', 'TRK0004896', 'Delivered'),
(5, 2, '2025-04-20', 'VRL Logistics', 'TRK0005157', 'Delivered'),
(6, 3, '2025-04-12', 'Delhivery', 'TRK0006011', 'Shipped'),
(7, 9, '2025-04-16', 'GATI', 'TRK0007558', 'In Transit'),
(8, 5, '2025-04-19', 'BlueDart', 'TRK0008242', 'Shipped'),
(9, 11, '2025-04-11', 'Delhivery', 'TRK0009020', 'Delivered'),
(10, 4, '2025-04-13', 'GATI', 'TRK0009994', 'Delayed'),
(11, 18, '2025-04-14', 'VRL Logistics', 'TRK0010653', 'Delivered'),
(12, 1, '2025-04-16', 'IndianPost', 'TRK0011789', 'Shipped'),
(13, 6, '2025-04-17', 'Delhivery', 'TRK0012983', 'Delivered'),
(14, 7, '2025-04-19', 'GATI', 'TRK0013457', 'In Transit'),
(15, 17, '2025-04-10', 'BlueDart', 'TRK0014792', 'Delayed'),
(16, 22, '2025-04-15', 'VRL Logistics', 'TRK0015527', 'Delivered'),
(17, 10, '2025-04-18', 'IndianPost', 'TRK0016381', 'Shipped'),
(18, 13, '2025-04-11', 'GATI', 'TRK0017119', 'In Transit'),
(19, 19, '2025-04-20', 'BlueDart', 'TRK0018990', 'Delivered'),
(20, 12, '2025-04-13', 'Delhivery', 'TRK0020012', 'Shipped'),
(21, 14, '2025-04-12', 'IndianPost', 'TRK0021174', 'Shipped'),
(22, 16, '2025-04-10', 'VRL Logistics', 'TRK0022455', 'Delayed'),
(23, 20, '2025-04-19', 'BlueDart', 'TRK0023726', 'Delivered'),
(24, 25, '2025-04-15', 'GATI', 'TRK0024863', 'In Transit'),
(25, 24, '2025-04-18', 'Delhivery', 'TRK0025092', 'Shipped');


