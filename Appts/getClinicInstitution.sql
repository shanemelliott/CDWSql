USE CDWWORK
DECLARE @Sta3n smallint = 605;


DROP TABLE IF EXISTS #T1
select a.sta3n,b.sta6a,locationName,LocationIEN, 
a.PatientFriendlyLocationName,
case when a.InstitutionSID < 0 then 'No Institution'
else 'Institution'end as InstitutionCheck,
case when a.InstitutionSID <>b.InstitutionSID then 'MisMatch'
else 'good' end as InstitutionCheckName,
a.institutionSID,
b.institutionSID as dvisionInstitutionSID,
a.divisionSID, b.divisionname,
a.physicallocation,
c.institutionName,
d.institutionName as DivisionInstitutionName
into #t1
from [Dim].[Location] a
join dim.division b on a.divisionsid=b.divisionsid
join dim.Institution c on c.InstitutionSID=a.InstitutionSID
join dim.institution d on d.institutionsid=b.InstitutionSID
where 
a.sta3n=@Sta3n
and a.LocationName not like 'ZZ%' and
a.InactivationDateTime is null
and locationtype='clinic'

select * from #t1
