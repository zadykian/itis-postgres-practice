using Bars.Billing.Dapper.Crud;
using Bars.Billing.Dapper.Crud.EntityMap;

namespace Postgres.Practice.ForeignTables
{
	public class EntityMap : CrudEntityMap<Entity>
	{
		public EntityMap()
		{
			MapToTable(entity => TableQualifiedName.New("task_4", $"entity_{(byte) entity.RoutingKey}"));
			
			Map(entity => entity.Id).ToColumn("id").AsPrimaryKey();
			Map(entity => entity.Name).ToColumn("name");
		}
	}
}