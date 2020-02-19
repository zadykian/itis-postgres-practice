using System.Collections.Generic;
using System.Data;
using Dapper;
using NUnit.Framework;
using Postgres.Practice.Infrastructure;

namespace Postgres.Practice.Task1
{
	/// <summary>
	/// Compare all possible TOAST strategies.
	/// </summary>
	public class ToastStrategiesTests
	{
		private static IDbConnection dbConnection;
		private const string schemaName = "toast_strategies_task";
		
		/// <summary>
		/// Get database connection and create schema for test tables.
		/// </summary>
		[OneTimeSetUp]
		public static void OneTimeSetUp()
		{
			dbConnection = ConnectionFactory.CreateConnection();
			
			var commandText = $@"
				create schema {schemaName};
				set search_path to {schemaName};";
			dbConnection.Execute(commandText);
		}

		/// <summary>
		/// Drop schema and release database connection.
		/// </summary>
		[OneTimeTearDown]
		public static void OneTimeTearDown()
		{
			dbConnection.Execute($"drop schema {schemaName};");
			ConnectionFactory.ReleaseConnection(dbConnection);
		}

		/// <summary>
		/// Insert generated data into test table and get metrics.
		/// </summary>
		[Test]
		[TestCaseSource(nameof(GetToastStrategies))]
		public void InsertDataAndGetMetrics(string toastStrategy)
		{
			CreateTable(toastStrategy);
			
			
		}

		/// <summary>
		/// Get TOAST strategies statements.
		/// </summary>
		private static IEnumerable<string> GetToastStrategies()
		{
			return new[]
			{
				"plain",
				"extended",
				"external",
				"main"
			};
		}

		/// <summary>
		/// Create test table and specify TOAST strategy for column.
		/// </summary>
		private static void CreateTable(string toastStrategy)
		{
			var commandText = $@"
				create table {toastStrategy}_strategy
				(
					text_column varchar(4096)
				);

				alter table {toastStrategy}_strategy
				alter column text_column
				set storage {toastStrategy};";

			dbConnection.Execute(commandText);
		}
	}
}