create function dbo.f_calculatPretFinal (@CustomerName NVARCHAR(50))
returns money
as
begin
    declare @TotalPrice money;
    
    select @TotalPrice = t1.Quantity * t3.Price
    from orders t1
    join  customer t2 on t1.CustomerID = t2.CustomerID
    join service_garment t3 on t1.ServiceGarmentID = t3.ServiceGarmentID
    where t2.Customer_Name = @CustomerName;

    return @TotalPrice;
end

