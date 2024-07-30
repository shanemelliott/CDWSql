# CDWSql
A collection of SQL scripts I have used for searching the CDW.

* Appointments 
    
    * Note thesse queries are against appt.appointment etc, the "old" Appointment tables, I have not started working with VSE Tables yet. 

    1. [Find all appointments for a Patient By ICN and Date Range](./Appts/find%20appointments%20with%20comments.sql) - This example uses patientIEN, but you could replace with patient SID, PatientICN etc. 

    2. [Find CHAR4 Value for a clinic](./Appts/CHAR4.sql)



* VEText  

    1. [Identify and Deactivate Clinics](./VEText/ZZ%20audit.sql)

* Databse Queries

    1. [Find Schema Connections](./Dba/findSchemaConnections.sql) - Use this to identify othr views related to the one you are working with. 

    2. [Find permissions of a db](./Dba/permissions1.sql)