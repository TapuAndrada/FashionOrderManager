CREATE PROCEDURE update_pretFinal( @client VARCHAR(50))
AS
BEGIN
    UPDATE orders
    SET FinalPrice = dbo.f_calculatPretFinal(@client)
    WHERE CustomerID IN (SELECT CustomerID
                         FROM customer
                         WHERE Customer_Name = @client);
END;
