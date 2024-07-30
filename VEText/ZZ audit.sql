use clinical
declare @sta3n  varchar(10) = '660';
declare @active int = 0;

with data as (SELECT 
	a.id,
	a.[stationId]
	,b.stationName
	,b.stationNo
     ,[clinicName]
     ,[clinicIen]
     ,[stopCode]
     ,[creditStopCode]
 	 ,c.name
     ,[message3TimeFrameDays]
	 ,message3TemplateId
     ,a.[active]
     ,a.[dateCreated]
     ,a.[dateModified]
  FROM [Clinical].[dbo].[smsApptRemindersClinic] a
  join smsstation b on a.stationId=b.id
  left join smsMessageTemplate c on c.id=a.message3TemplateId
   where 
   clinicName like 'ZZ%' and a.active=@active)

   select * from data where stationNo=@sta3n 
/*
  ##################### UPDATE - DEACTIVATE ########################
   declare @sta3n  varchar(10) = '660';
   update [Clinical].[dbo].[smsApptRemindersClinic]
   set active=0 
   where id in (
   select a.id 
   fROM [Clinical].[dbo].[smsApptRemindersClinic] a
  join smsstation b on a.stationId=b.id
   where 
   clinicName like 'ZZ%' and a.active=1
   and  b.stationNo=@sta3n 
   )

   ##################################################################
 
   **************************DELETE DELETE DELETE********************

   declare @sta3n  varchar(10) = '666';
   delete from  [Clinical].[dbo].[smsApptRemindersClinic]
   where id in (
   select a.id 
   fROM [Clinical].[dbo].[smsApptRemindersClinic] a
  join smsstation b on a.stationId=b.id
   where 
   clinicName like 'ZZ%' and a.active=0
   and  b.stationNo=@sta3n 
   )
   ****************************************************
   */