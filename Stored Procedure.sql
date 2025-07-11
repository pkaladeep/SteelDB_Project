/*
 Group 21
 Name: Prachi Kaladeep (1234832237) Ishita Ahuja (123398064)
 Steel Manufacturing Management System Tables
 IFT 530 Final Project - Spring 2025
*/
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
