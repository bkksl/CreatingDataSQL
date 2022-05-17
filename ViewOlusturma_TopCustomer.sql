--CREATE VIEW TopCustomer
ALTER VIEW TopCustomer
AS
SELECT TOP 10 C.NAME + ' ' +C.SURNAME AS SalesNameSurname, C.COUNTRY, C.CITY, C.BIRTDATE, C.GENDER, SUM(SD.Total_Cost) AS Total_Cost
FROM [staj].[dbo].[Customer] C

LEFT JOIN [staj].[dbo].[Sales_Detail] SD ON SD.Customer_ID= C.ID


GROUP BY C.NAME, C.SURNAME, C.COUNTRY, C.CITY, C.BIRTDATE, C.GENDER ORDER BY Total_Cost DESC

--SELECT * FROM TopCustomer
--DELETE TopCustomer
/*
SELECT CustomerNameSurname, SUM(Order_Quantity) FROM SALESDETAIL
WHERE CustomerNameSurname = 'Hutton Windsor'
GROUP BY CustomerNameSurname ORDER BY 2
*/