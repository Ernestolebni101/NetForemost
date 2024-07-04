// See https://aka.ms/new-console-template for more information
using balances;
using ConsoleTables;
using Dapper;
using Microsoft.Data.SqlClient;
using System.Data;

IDbConnection dbConnection = new SqlConnection(Constants.connectionString);

Console.WriteLine("Assign Balance to Managers...");

await dbConnection.ExecuteAsync(sql: ScriptManager.Sp_AssignBalancesToManagers);

var result = await dbConnection.QueryAsync(sql: ScriptManager.Sp_FetchBalancesWithManagers);

var balanceTable = new ConsoleTable("Gestor", "saldo");

result.ToList().ForEach(r => balanceTable.AddRow(r.Name, r.balance));

Console.WriteLine("Display Result...");

balanceTable.Write();

Console.ReadLine();