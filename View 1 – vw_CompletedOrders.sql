/*
 Group 21
 Name: Prachi Kaladeep (1234832237) Ishita Ahuja (123398064)
 Steel Manufacturing Management System Tables
 IFT 530 Final Project - Spring 2025
*/

--Use: Helps sales and operations teams see fulfilled orders by customer.

CREATE VIEW vw_CompletedOrders AS
SELECT o.order_id, o.order_date, o.order_quantity, c.company_name, c.contact_name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.status = 'Completed';
