namespace Postgres.Practice.ForeignTables
{
	public class Entity
	{
		public Entity(string name, RoutingKey routingKey)
		{
			Name = name;
			RoutingKey = routingKey;
		}
		
		public long Id { get; private set; }
		
		public string Name { get; private set; }
		
		public RoutingKey RoutingKey { get; private set; }
	}
}