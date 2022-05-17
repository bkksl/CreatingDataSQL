CREATE PROCEDURE TopStore_PROCEDURE
--ALTER PROCEDURE TopStore_PROCEDURE
AS
SELECT TOP 7 S.City, S.District, S.Country, SUM(SD.Total_Cost) AS Total_Cost
FROM [staj].[dbo].[Store_ID] S

LEFT JOIN [staj].[dbo].[Sales_Detail] SD ON SD.Store_ID= S.ID


GROUP BY S.City, S.District, S.Country ORDER BY Total_Cost DESC

--TopStore_PROCEDURE