using System;
using System.IO;
using System.Linq;

namespace Flyway.MigrationGenerator.Task3
{
	internal class Program
	{
		private static readonly Random random = new Random();
		
		private static void Main(string[] args)
		{
			if (args.Length != 1)
			{
				Console.WriteLine("Invalid arguments count!");
				Environment.Exit(-1);
			}

			using var fileStream = new FileStream(args[0], FileMode.Create);
			using var streamWriter = new StreamWriter(fileStream);
			
			streamWriter.WriteLine($"insert into task_3.table_to_cluster (id, name) values");

			foreach (var randomValue in Enumerable
				.Range(1, 10000)
				.Select(_ => random.Next(0, int.MaxValue)))
			{
				streamWriter.WriteLine($"\t({randomValue}, 'some_name'),");
			}
		}
	}
}