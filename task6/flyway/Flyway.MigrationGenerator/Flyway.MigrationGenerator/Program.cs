using System;

namespace Flyway.MigrationGenerator
{
	internal static class Program
	{
		private static void Main(string[] args)
		{
			var ruleText = $@"
				create rule update_child_0
				as on update to child_0
				where old.id != new.id and id % 10 = 1
				do instead
				insert into task_6.child_1 values (new.*);";
		}
	}
}