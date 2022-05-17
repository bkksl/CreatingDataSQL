ALTER VIEW ALLSalesTEAM
AS
SELECT TOP 15 T.Sales_Name + ' ' +T.Sales_Surname AS SalesNameSurname, T.Country, T.City, SUM(SD.Total_Cost) AS Total_Cost
FROM [staj].[dbo].[SalesTeam] T

LEFT JOIN [staj].[dbo].[Sales_Detail] SD ON SD.SalesTeam_ID = T.ID

GROUP BY T.Sales_Name, T.Sales_Surname, T.Country, T.City ORDER BY Total_Cost DESC

--SELECT * FROM ALLSalesTEAM
--DELETE ALLSalesTEAM
