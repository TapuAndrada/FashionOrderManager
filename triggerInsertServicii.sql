create trigger trig_insert_ on services instead of insert
as
declare @nserviciu varchar(40),@mduration int,@duration varchar(50)
select @nserviciu=ServiceName,@mduration=ManufacturingDuration,@duration=Duration
from inserted
if exists(select * 
		  from services
		  where @nserviciu=ServiceName)
begin
print 'Serviciu existent!'
end
else
begin
insert services(ServiceName,ManufacturingDuration,Duration)
values(@nserviciu,@mduration,@duration)
end