DECLARE @View varchar(50) = 'location'
 
SELECT TOP 1000 [FKSchemaName]
,[FKViewName]
,[FKViewFieldName]
,[PKSchemaName]
,[PKViewName]
,[PKViewFieldName]
FROM [CDWWork].[Meta].[DWViewForeignKey]
WHERE PKSchemaName LIKE '%'+@View+'%' OR FKSchemaName LIKE '%'+@View+'%' OR
PKViewName LIKE '%'+@View+'%' OR FKViewName LIKE '%'+@View+'%' 
order by FKViewName
