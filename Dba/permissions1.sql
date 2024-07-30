
use OVAC_VETExt
SELECT DP1.name AS DatabaseRoleName,
    ISNULL(DP2.name, 'No members') AS DatabaseUserName
FROM sys.database_role_members AS DRM
RIGHT JOIN sys.database_principals AS DP1
    ON DRM.role_principal_id = DP1.principal_id
LEFT JOIN sys.database_principals AS DP2
    ON DRM.member_principal_id = DP2.principal_id
WHERE DP1.is_fixed_role = 1
ORDER BY DP1.name;