USE CDWWORK
DECLARE @Sta3n smallint = 640;
DECLARE @LocationIEN varchar(50) = '18138';
DECLARE @LocationSID int = 800139771;

SELECT A.LocationIEN,A.LocationName,D.NationalChar4,D.NationalChar4Description FROM 
DIM.LOCATION A
JOIN DIM.DSSLOCATION C ON A.LocationSID=C.LocationSID
JOIN DIM.DSSLocationStopCode D ON D.DSSLocationStopCodeSID=C.DSSLocationStopCodeSID
WHERE A.LOCATIONSID = @LocationSID


SELECT A.LocationIEN,A.LocationName,D.NationalChar4,D.NationalChar4Description FROM 
DIM.LOCATION A
JOIN DIM.DSSLOCATION C ON A.LocationSID=C.LocationSID
JOIN DIM.DSSLocationStopCode D ON D.DSSLocationStopCodeSID=C.DSSLocationStopCodeSID
WHERE A.LOCATIONIEN = @LocationIEN AND A.STA3N=@sta3n
