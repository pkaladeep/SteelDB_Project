/*
 Group 21
 Name: Prachi Kaladeep (1234832237) Ishita Ahuja (123398064)
 Steel Manufacturing Management System Tables
 IFT 530 Final Project - Spring 2025
*/

CREATE FUNCTION dbo.fn_DaysToShip(@orderId INT)
RETURNS INT
AS
BEGIN
    DECLARE @orderDate DATE, @shipDate DATE;
    SELECT @orderDate = order_date FROM Orders WHERE order_id = @orderId;
    SELECT @shipDate = shipment_date FROM Shipments WHERE order_id = @orderId;
    RETURN DATEDIFF(DAY, @orderDate, @shipDate);
END;

