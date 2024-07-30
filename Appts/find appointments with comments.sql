use cdwwork 
 
DECLARE @Sta3n smallint = 640;
DECLARE @patientIEN int = 9999;
 
select 
sta3nName,
a.sta3n
,d.sta6a
,cst.StaffName as CancelByStaff
,p.patientname
,p.PatientIEN
,p.patienticn
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
,AppointmentLength
,CancelNoShowCode
,CancelDateTime
into #t1 --drop table #t1
from cdwwork.appt.Appointment_Recent a
join cdwwork.dim.location l on l.locationSID = a.locationSID
join cdwwork.dim.division d on d.divisionsid=l.DivisionSID
join cdwwork.spatient.spatient p on a.patientSID = p.patientSID
join SPatient.AppointmentComment ac on ac.AppointmentSID=a.AppointmentSID
JOIN cdwwork.Dim.StopCode pc on l.PrimaryStopCodeSID = pc.StopCodeSID and pc.sta3n=@sta3n
left outer join cdwwork.sstaff.sstaff st on st.staffsid = a.dataentrystaffsid and st.Sta3n = @sta3n
left outer join cdwwork.sstaff.sstaff cst on cst.staffsid = a.CancelByStaffSID and cst.Sta3n = @sta3n
join cdwwork.dim.sta3n s on a.sta3n=s.sta3n 
where 
a.sta3n=@Sta3n and 
pc.stopcode='669'
and a.AppointmentDateTime > '01/26/2022'
and a.AppointmentDateTime < '07/20/2024'
and CancelDateTime is not null
and p.patientIEN=@patientIEN


