CREATE FUNCTION AAAA(
	@BaslangicTarihi DATE,
    @BitisTarihi DATE
)
RETURNS DATE
AS
BEGIN
    DECLARE @AradakiGunler INT;
    DECLARE @RandomGun INT;
    SET @AradakiGunler = DATEDIFF(DAY, @BaslangicTarihi, @BitisTarihi);
    SET @RandomGun = CAST(
    (
        SELECT * FROM vw_Random
    ) * 10000 AS INT) % @AradakiGunler;
    RETURN DATEADD(DAY, @RandomGun, @BaslangicTarihi);
END;



