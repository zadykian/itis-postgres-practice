using System;
using System.IO;
using System.Linq;

namespace Flyway.MigrationGenerator
{
	internal static class Program
	{
		private const string ruleText = @"
			create rule update_child_{0}_to_{1}
			as on update to child_{0}
			where old.id != new.id and new.id % 10 = {1}
			do instead
			insert into task_6.child_{1} values (new.*);";
		
		private static void Main(string[] args)
		{
			if (args.Length != 1)
			{
				Console.WriteLine("Invalid arguments count!");
				Environment.Exit(-1);
			}

			using var fileStream = new FileStream(args[0], FileMode.Append);
			using var streamWriter = new StreamWriter(fileStream);
			
			foreach (var childTableNumber in Enumerable.Range(0, 10))
			{
				foreach (var destinationTableNumber in Enumerable
					.Range(0, 10)
					.Where(number => number != childTableNumber))
				{
					var ruleString = string
						.Format(ruleText, childTableNumber, destinationTableNumber)
						.Replace("\t", string.Empty);
					
					streamWriter.WriteLine(ruleString);
				}
			}
		}
	}
}