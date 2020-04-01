using System;
using System.IO;
using System.Linq;

namespace Flyway.MigrationGenerator
{
	internal static class Program
	{
		private static void Main(string[] args)
		{
			if (args.Length != 1)
			{
				Console.WriteLine("Invalid arguments count!");
				Environment.Exit(-1);
			}

			var ruleText = File.ReadAllText("create_rule.sql");
			
			using var fileStream = new FileStream(args[0], FileMode.Create);
			using var streamWriter = new StreamWriter(fileStream);
			
			foreach (var oldTableNumber in Enumerable.Range(0, 10))
			{
				foreach (var newTableNumber in Enumerable
					.Range(0, 10)
					.Where(number => number != oldTableNumber))
				{
					var ruleString = string.Format(ruleText, oldTableNumber, newTableNumber);
					streamWriter.WriteLine(ruleString);
					streamWriter.WriteLine();
				}
			}
		}
	}
}