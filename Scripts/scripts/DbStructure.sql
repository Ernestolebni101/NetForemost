USE master;
GO

IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'BalanceDb')
    CREATE DATABASE BalanceDb;
ELSE
    USE BalanceDb
GO


DROP TABLE IF EXISTS dbo.BalanceAssignment
DROP TABLE IF EXISTS dbo.Balances
DROP TABLE IF EXISTS dbo.PaymentManagers

CREATE TABLE dbo.Balances
(
    Id INT IDENTITY(1,1),
    Amount DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_Balances_Id PRIMARY KEY CLUSTERED(Id)
);
GO

CREATE TABLE dbo.PaymentManagers(
    Id INT IDENTITY(1,1),
    [Name] NVARCHAR(120),
    CONSTRAINT PK_PaymentManager_Id PRIMARY KEY CLUSTERED(Id)
);
GO

CREATE TABLE dbo.BalanceAssignment
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    paymentManagerId INT,
    balanceId INT,
    CONSTRAINT FK_BalanceAssignment_paymentManagerId_PaymentManager_paymentManagerId FOREIGN KEY (paymentManagerId) REFERENCES dbo.PaymentManagers(Id) ON DELETE CASCADE,
    CONSTRAINT FK_BalanceAssignment_balanceId_Balances_balanceId FOREIGN KEY (balanceId) REFERENCES dbo.Balances(Id) ON DELETE CASCADE
);
GO

DELETE FROM dbo.PaymentManagers;
GO

INSERT INTO dbo.PaymentManagers ([Name]) VALUES
('Gestor 1'), ('Gestor 2'), ('Gestor 3'), ('Gestor 4'), ('Gestor 5'),
('Gestor 6'), ('Gestor 7'), ('Gestor 8'), ('Gestor 9'), ('Gestor 10');
GO

DELETE FROM dbo.Balances;
GO

INSERT INTO dbo.Balances (Amount) VALUES
(2277), (3953), (4726), (1414), (627), (1784), (1634), (3958), (2156), (1347), 
(2166), (820), (2325), (3613), (2389), (4130), (2007), (3027), (2591), (3940), 
(3888), (2975), (4470), (2291), (3393), (3588), (3286), (2293), (4353), (3315), 
(4900), (794), (4424), (4505), (2643), (2217), (4193), (2893), (4120), (3352), 
(2355), (3219), (3064), (4893), (272), (1299), (4725), (1900), (4927), (4011);


