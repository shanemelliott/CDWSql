DECLARE @Sta3n smallint = 640;
DECLARE @CancelDate date = '2024-05-23'



use cdwwork
DROP TABLE IF EXISTS #t1;
select 
sta3nName,
a.sta3n
,cst.StaffName as CancelByStaff
,p.patientname
,p.PatientIEN
,p.patientssn
,st.staffien
,a.AppointmentDateTime
,ac.AppointmentComment
,overbookflag
,l.LocationIEN
,l.locationName
,pc.StopCode
,a.consultSID
,DesiredAppointmentDate
,appointmentmadedate 
,st.staffname
,a.CancelByStaffSID
,AppointmentLength
,CancelNoShowCode
,CancelDateTime
into #t1 --drop table #t1
from cdwwork.appt.Appointment_Recent a
join cdwwork.dim.location l on l.locationSID = a.locationSID
join cdwwork.spatient.spatient p on a.patientSID = p.patientSID
join SPatient.AppointmentComment ac on ac.AppointmentSID=a.AppointmentSID
JOIN cdwwork.Dim.StopCode pc on l.PrimaryStopCodeSID = pc.StopCodeSID and pc.sta3n=@sta3n
left outer join cdwwork.sstaff.sstaff st on st.staffsid = a.dataentrystaffsid and st.Sta3n = @sta3n
left outer join cdwwork.sstaff.sstaff cst on cst.staffsid = a.CancelByStaffSID and cst.Sta3n = @sta3n
join cdwwork.dim.sta3n s on a.sta3n=s.sta3n 
where 
a.sta3n=@Sta3n 
and a.AppointmentDateTime > '05/14/2024'
and a.AppointmentDateTime < '06/16/2024'
and CONVERT(DATE,CancelDateTime) = @CancelDate
and CancelDateTime is not null
and cst.staffname ='AVSCONNECTOR,PAL'



Select * from #t1 --27
