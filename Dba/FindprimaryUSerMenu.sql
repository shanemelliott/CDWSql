use cdwwork;

with data as (
select 
 a.sta3n,
 a.StaffName,
 a.BIRTHDATETIME,
 d.menuOptionName as SecondaryMenu,
 a.StaffIEN,
 a.StaffSID,
 a.NetworkUserName,
 a.serviceSection,
 a.emailAddress,
 b.ProviderClass,
 e.MenuText,
 e.menuoptionname,
 a.VAPersonIdentificationNumber,
a.PositionTitle,
a.DisUserFlag
from sstaff.sstaff a
join Dim.ProviderClass b   on a.providerclasssid=b.providerclasssid
join StaffSub.SecondaryMenuOption c on c.staffsid=a.staffsid
join dim.menuOption d on d.menuoptionsid=c.menuoptionsid
join dim.menuOption e on e.menuoptionsid=a.PrimaryMenuOptionSID
where a.Sta3n=605 and 
a.TerminationDateTime is  null and (DisUserFlag ='n'or DisUserFlag is null)
)


select count(*),sta3n, menuoptionname from data 
where menuoptionname <> '*Missing*'
group by menuoptionname, sta3n
order by count(*) desc

