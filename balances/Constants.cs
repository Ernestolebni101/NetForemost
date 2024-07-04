namespace balances;

public static class Constants
{
    /// <summary>
    /// Replace with your connection string
    /// </summary>
    public const string connectionString = @"Server=localhost;Database=BalanceDb;User Id=sa;Password=popolatito202300**;TrustServerCertificate=True;";
}

public static class ScriptManager
{

    public const string Sp_AssignBalancesToManagers = "dbo.Sp_AssignBalancesToManagers";

    public const string Sp_FetchBalancesWithManagers = "dbo.Sp_FetchBalancesWithManagers";
}