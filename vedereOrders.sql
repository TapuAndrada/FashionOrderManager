create view vedere_orders as
select t1.CustomerID,t1.Quantity,t1.FinalPrice,t2.Customer_Name,t4.ServiceName,t5.Garment_Name
from orders t1,customer t2,service_garment t3,services t4,garments t5
where t1.CustomerID=t2.CustomerID and
	  t1.ServiceGarmentID=t3.ServiceGarmentID and
	  t3.ServiceID=t4.ServiceID and
	  t3.GarmentID=t5.GarmentID
	  