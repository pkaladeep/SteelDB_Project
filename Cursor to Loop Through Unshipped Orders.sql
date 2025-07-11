/*
 Group 21
 Name: Prachi Kaladeep (1234832237) Ishita Ahuja (123398064)
 Steel Manufacturing Management System Tables
 IFT 530 Final Project - Spring 2025
*/
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
