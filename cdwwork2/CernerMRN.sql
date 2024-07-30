USE CDWWork2;
 
SELECT TOP 10
              A.PersonSID
              ,A.NameFullFormatted
              ,B.AliasPool
              ,B.PersonAliasType
              ,B.AliasName AS MRN
              ,C.AliasPool
              ,C.PersonAliasType
              ,C.AliasName AS ICN
FROM   SVeteranMill.SPerson A
              LEFT JOIN SVeteranMill.SPersonAlias B ON B.PersonSID = A.PersonSID
                     AND B.ActiveIndicator = 1
                     AND B.AliasPool = 'MRN'
                     AND B.PersonAliasType = 'MRN'
              LEFT JOIN SVeteranMill.SPersonAlias C ON C.PersonSID = A.PersonSID
                     AND C.ActiveIndicator = 1
                     AND C.AliasPool = 'ICN'
WHERE  A.ModifiedDateTime >= CONVERT(DATETIME2(0), '2023-11-08')
              AND A.ActiveIndicator = 1;