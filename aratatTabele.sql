select * from orders
select * from customer
select * from measurements
select * from appoitments

select * from service_garment
select * from services
select * from garments

select dbo.f_calculatPretFinal('Luis Fernández') as PretFinal;

exec update_pretFinal 'Andrei Popescu'
exec proc_inserare_serviciu 'serviciu_04','garment_04',200
exec proc_stergere_client 'ABC01'

select * from vedere_orders

insert into services(ServiceName,ManufacturingDuration,Duration)
values('serviciu_13',5,'days')
select * from services


update garments
set Material='m'
where Garment_Name='garment_04'
select * from garments






