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
			
			var ruleText = @"
				create rule update_child_{0}
				as on update to child_{0}
				where old.id != new.id and id % 10 = {1}
				do instead
				insert into task_6.child_{1} values (new.*);";

			using var fileStream = new FileStream(args[0], FileMode.Append);
			using var streamWriter = new StreamWriter(fileStream);
			
			foreach (var childTableNumber in Enumerable.Range(0, 9))
			{
				foreach (var destinationTableNumber in Enumerable
					.Range(0, 9)
					.Where(number => number != childTableNumber))
				{
					var ruleString = string.Format(ruleText, childTableNumber, destinationTableNumber);
					streamWriter.WriteLine(ruleString);
				}
			}
			
			streamWriter.Flush();
		}
	}
}