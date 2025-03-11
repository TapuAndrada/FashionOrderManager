create procedure proc_stergere_client(@idClient varchar(50))
as 
if exists( select *from orders where CustomerID=@idClient )
begin 
delete  from orders
where CustomerID=@idClient
end
else
begin
print 'Nu exista niciun client cu acest ID!'
end
