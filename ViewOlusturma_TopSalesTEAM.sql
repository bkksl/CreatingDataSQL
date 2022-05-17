--CREATE VIEW TopSalesTEAM
ALTER VIEW TopSalesTEAM
AS
SELECT TOP 5 T.Sales_Name + ' ' +T.Sales_Surname AS SalesNameSurname, SUM(SD.Total_Cost) AS Total_Cost, T.Country, T.City
FROM [staj].[dbo].[SalesTeam] T

LEFT JOIN [staj].[dbo].[Sales_Detail] SD ON SD.SalesTeam_ID = T.ID

GROUP BY T.Sales_Name, T.Sales_Surname, T.Country, T.City ORDER BY Total_Cost DESC

--SELECT * FROM TopSalesTEAM
--DELETE TopSalesTEAM
