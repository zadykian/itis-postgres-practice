using System;

namespace Bars.Billing.Dapper.Crud.Tests.Configuration
{
	/// <summary>
	/// Исключение, возникающее при ошибке конфигурации приложения.
	/// </summary>
	public class ApplicationConfigurationException : Exception
	{
		internal ApplicationConfigurationException(string message) 
			: base(message)
		{
		}
	}
}