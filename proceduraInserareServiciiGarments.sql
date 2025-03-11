create procedure proc_inserare_serviciu(
										@nserviciu varchar(50),
										@ngarment varchar(50),
										@pret money)
as 
if not exists( select *from services where ServiceName=@nserviciu )
begin 
insert services(ServiceName) values(@nserviciu)
end
if not exists( select *from garments where Garment_Name=@ngarment)
begin 
insert garments(Garment_Name) values(@ngarment)
end
declare @sId int=(select ServiceID from services where ServiceName=@nserviciu)
declare @gId int=(select GarmentID from garments where Garment_Name=@ngarment)
if  exists(select * 
			  from service_garment
			  where ServiceID=@sId and GarmentID=@gId)

begin
print 'Serviciul exista deja'
end
else
begin
INSERT [service_garment] ([ServiceID],[GarmentID],[Price])
values(@sId,@gId,@pret)
end