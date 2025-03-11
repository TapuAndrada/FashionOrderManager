create trigger trig_update_garments on garments instead of update
as
begin
declare @ngarment varchar(40),@mat varchar(50)
select @ngarment=Garment_Name,@mat=Material
from inserted
if exists(select * 
		  from garments
		  where @ngarment=Garment_Name)
begin
print 'Obiect vestimentar existent!Se va actualiza acesta.'
update garments
set Material=@mat
where Garment_Name=@ngarment
end

else

begin
print 'Obiectul vestimentar nu exista!Se va adauga!'
insert garments(Garment_Name,Material)
values(@ngarment,@mat)
end
end