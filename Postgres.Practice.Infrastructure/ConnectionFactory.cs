using System.Data;
using Bars.Billing.Dapper.Crud.Infrastructure.Tests.Configuration;
using Microsoft.Extensions.Configuration;
using Npgsql;

namespace Postgres.Practice.Infrastructure
{
	/// <summary>
	/// Фабрика подключений к базе данных.
	/// </summary>
	public static class ConnectionFactory
	{
		/// <summary>
		/// Получить новое подключение к базе данных.
		/// </summary>
		public static IDbConnection CreateConnection()
		{
			var connectionString = ConfigurationFactory.Configuration.GetConnectionString("Default");
			var connection = new NpgsqlConnection(connectionString);
			connection.Open();
			return connection;
		}

		/// <summary>
		/// Освободить подключение к базе данных.
		/// </summary>
		public static void ReleaseConnection(IDbConnection dbConnection)
		{
			dbConnection.Close();
			dbConnection.Dispose();
		}
	}
}