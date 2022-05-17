DECLARE @I AS INT=0
WHILE @I<11000
BEGIN
DECLARE @Sales_Channel AS INT
DECLARE @Order_Date AS DATETIME
DECLARE @Ship_Date AS DATETIME
DECLARE @Delivery_Date AS DATETIME
DECLARE @SalesTeam_ID AS INT
DECLARE @Customer_ID AS INT
DECLARE @Store_ID AS INT
DECLARE @Product_ID AS INT
DECLARE @Size AS INT
DECLARE @Address_ID AS INT
DECLARE @Order_Quantity AS INT
DECLARE @Unit_Price AS FLOAT
DECLARE @Total_Cost AS FLOAT

DECLARE @RAND AS INT
DECLARE @RANDO AS INT
DECLARE @RANDsize AS INT  --20

--SELECT @Rastgele = ROUND(((@Baslangic - @Bitis) * RAND() + @Bitis), 0)

SET @RAND = RAND()*4
SELECT @Sales_Channel = ID FROM [staj].[dbo].[Sales_Channel] WHERE ID = @RAND

SELECT @Order_Date = dbo.AAA('20170101', '20171231');
SELECT @Ship_Date = dbo.AAA(@Order_Date, '20171231');
SELECT @Delivery_Date = dbo.AAA(@Ship_Date, '20171231');

SET @RAND = RAND()*16 --32
SELECT @SalesTeam_ID = ID FROM [staj].[dbo].[SalesTeam] WHERE ID = @RAND

SET @RAND = RAND()*1001
SELECT @Customer_ID = ID FROM [staj].[dbo].[Customer] WHERE ID = @RAND

SET @RAND = RAND()*8
SELECT @Store_ID = ID FROM [staj].[dbo].[Store_ID] WHERE ID = @RAND
--40
SET @RANDO = RAND()*32
SELECT @Product_ID = ID FROM [staj].[dbo].[Product] WHERE ID = @RANDO

SET @RANDsize = RAND()*4
SELECT @Size = ID FROM [staj].[dbo].[Product_Size] WHERE ID = @RANDsize --45

SET @RAND = RAND()*16
SELECT @Address_ID = ID FROM [staj].[dbo].[Address] WHERE ID = @RAND

SET @RAND = RAND()*101
SELECT @Order_Quantity= @RAND

SELECT @Unit_Price = Price*@Size FROM [staj].[dbo].[Product] WHERE ID = @Product_ID

SELECT @Total_Cost = @Unit_Price*@Order_Quantity

--
INSERT INTO [staj].[dbo].[Sales_Detail] (Sales_Channel, Order_Date, Ship_Date, Delivery_Date, SalesTeam_ID, Customer_ID, Store_ID, Product_ID, Size, Address_ID, Order_Quantity, Unit_Price, Total_Cost)
VALUES (@Sales_Channel, @Order_Date, @Ship_Date, @Delivery_Date, @SalesTeam_ID, @Customer_ID, @Store_ID, @Product_ID, @Size, @Address_ID, @Order_Quantity, @Unit_Price, @Total_Cost)

SET @I = @I + 1
END
SELECT * FROM [staj].[dbo].[Sales_Detail]

 

--DELETE [staj].[dbo].[Sales_Detail]

/*
SELECT * FROM [staj].[dbo].[Sales_Detail]
WHERE Address_ID = '15'
*/