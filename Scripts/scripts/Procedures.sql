USE BalanceDb
GO

CREATE OR ALTER PROCEDURE dbo.Sp_AssignBalancesToManagers
AS
BEGIN

    SET NOCOUNT ON;

    DELETE FROM dbo.BalanceAssignment;

    DECLARE @managersCount INT;
    DECLARE @loops INT;
    DECLARE @balanceId INT, @managerId INT, @loop INT = 1;

    SELECT @managersCount = COUNT(*)
    FROM dbo.PaymentManagers;

    SELECT @loops = CEILING(CAST(COUNT(*) AS FLOAT) / @managersCount)
    FROM dbo.Balances;


    DECLARE managersCursor CURSOR FOR 
    SELECT Id
    FROM dbo.PaymentManagers;

    OPEN managersCursor;

    FETCH NEXT FROM managersCursor INTO @managerId

    WHILE @@FETCH_STATUS = 0 AND @loop <= @loops
    BEGIN

        INSERT INTO dbo.BalanceAssignment
            (balanceId,paymentManagerId)
        SELECT b.Id, @managerId
        FROM dbo.Balances b
        ORDER BY  b.Amount DESC

        FETCH NEXT FROM managersCursor INTO @managerId;

        INSERT INTO dbo.BalanceAssignment
            (balanceId,paymentManagerId)
        SELECT b.Id, @managerId
        FROM dbo.Balances b
        ORDER BY  b.Amount DESC

        FETCH NEXT FROM managersCursor INTO @managerId;
        SET @loop = @loop + 1
    END;

    CLOSE managersCursor;
    DEALLOCATE managersCursor;

END

GO

CREATE OR ALTER PROC dbo.Sp_FetchBalancesWithManagers 
AS
BEGIN
    SELECT pm.Name, b.Amount balance
    FROM dbo.PaymentManagers pm JOIN dbo.BalanceAssignment bas ON bas.paymentManagerId = pm.Id JOIN dbo.Balances b ON b.Id = bas.balanceId
END;