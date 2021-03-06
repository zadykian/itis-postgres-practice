﻿using System;
using System.Linq;
using Bars.Billing.Dapper.Crud.Extensions;
using Bars.Billing.Dapper.Crud.Tests.Configuration;
using Dapper.FluentMap;
using Microsoft.Extensions.Configuration;
using Npgsql;

namespace Postgres.Practice.ForeignTables
{
	internal class Program
	{
		private static readonly Random random = new Random();

		private static void Main()
		{
			FluentMapper.Initialize(configuration =>
			{
				configuration
					.AddAllAssemblyCrudEntityMaps()
					.UseForCrudOperations();
			});

			var connectionString = ConfigurationFactory.Configuration.GetConnectionString("AmazonRds");
			using var connection = new NpgsqlConnection(connectionString);
			connection.Open();

			// generate entity objects with random routing keys.
			var entitiesToInsert = Enumerable
				.Range(1, 10000)
				.Select(_ => new Entity("some_name", (RoutingKey) random.Next(0, 3)))
				.ToArray();

			connection.InsertManyInTransaction(entitiesToInsert);
			Console.ReadKey();
		}
	}
}