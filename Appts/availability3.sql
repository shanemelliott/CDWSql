use OVAC_VETEXT

SELECT * FROM [Dflt].[VISTALINK_Accounts] WHERE STATIONNO ='575'

declare @sta3n varchar(10) =        '575'
declare @locationIen nvarchar(50) = '5547'
declare @startDate date =           '2024-01-24'
declare @endDate  date =            '2024-01-26'



declare @tomorrow date = dateadd(day, 1, getDate())
declare @sql nvarchar(max)

 

if @tomorrow > @startDate 
begin
set @startDate = @tomorrow
end

 

set @sql = N'
select * 
from App.COVID_Vaccine_ClinicAvailability 
where locationIen in ( ' + @locationIen + ' )
and sta3n = ' + @sta3n + '
and PatternDate between ''' + convert(nvarchar, @startDate, 101) + ''' and ''' + convert(nvarchar, @endDate, 101) + '''
order by PatternDate
'
exec sp_executesql @sql

 

set @sql = N'
select sum(CountUnused)
from App.COVID_Vaccine_ClinicAvailability 
where locationIen in ( ' + @locationIen + ' )
and sta3n = ' + @sta3n + '
and PatternDate between ''' + convert(nvarchar, @startDate, 101) + ''' and ''' + convert(nvarchar, @endDate, 101) + '''
'
exec sp_executesql @sql

 

set @sql = N'
select * 
from  LSV.BISL_Collab.ClinicAvailability
where locationIen in ( ' + @locationIen + ' )
and sta3n = ' + @sta3n + '
and PatternDate between ''' + convert(nvarchar, @startDate, 101) + ''' and ''' + convert(nvarchar, @endDate, 101) + '''
order by PatternDate
'
exec sp_executesql @sql

 

set @sql = N'
select sum(CountUnused)
from  LSV.BISL_Collab.ClinicAvailability 
where locationIen in ( ' + @locationIen + ' )
and sta3n = ' + @sta3n + '
and PatternDate between ''' + convert(nvarchar, @startDate, 101) + ''' and ''' + convert(nvarchar, @endDate, 101) + '''
'
exec sp_executesql @sql