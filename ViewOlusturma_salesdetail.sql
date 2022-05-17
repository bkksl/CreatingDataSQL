CREATE VIEW SALESDETAIL
AS
SELECT
	S.Order_ID, S.Order_Date, S.Ship_Date, S.Delivery_Date, S.Address_ID, S.Order_Quantity, S.Unit_Price, S.Total_Cost,
	C.Sales_Channel,
	T.Sales_Name + ' ' +T.Sales_Surname AS SalesNameSurname,
	cust.NAME + ' ' +cust.SURNAME AS CustomerNameSurname, cust.CITY, cust.COUNTRY,
	store.Country_Code AS StoreCountry,
	P.Product_Name,
	PS.Size

FROM [staj].[dbo].[Sales_Detail] AS S

LEFT JOIN [staj].[dbo].[Sales_Channel] C ON C.ID = S.Sales_Channel
LEFT JOIN [staj].[dbo].[SalesTeam] T ON T.ID = S.SalesTeam_ID
LEFT JOIN [staj].[dbo].[Customer] cust ON cust.ID = S.Customer_ID
LEFT JOIN [staj].[dbo].[Store_ID] store ON store.ID = S.Store_ID
LEFT JOIN [staj].[dbo].[Product] P ON P.ID = S.Product_ID
LEFT JOIN [staj].[dbo].[Product_Size] PS ON PS.ID = S.Size

--SELECT * FROM SALESDETAIL
/*
SELECT CustomerNameSurname, SUM(Order_Quantity) FROM SALESDETAIL
WHERE CustomerNameSurname = 'Hutton Windsor'
GROUP BY CustomerNameSurname ORDER BY 2
*/