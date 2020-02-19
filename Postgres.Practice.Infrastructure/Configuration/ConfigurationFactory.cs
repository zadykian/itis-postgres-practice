using System.IO;
using Microsoft.Extensions.Configuration;

namespace Bars.Billing.Dapper.Crud.Infrastructure.Tests.Configuration
{
    /// <summary>
    /// Фабрика <see cref="IConfiguration"/>.
    /// </summary>
    internal static class ConfigurationFactory
    {
        static ConfigurationFactory()
        {
            Configuration = CreateConfiguration();
        }
        
        /// <summary>
        /// Конфигурация приложения.
        /// </summary>
        public static IConfiguration Configuration { get; }
        
        /// <summary>
        /// Создать объект конфигурации <see cref="IConfiguration"/>.
        /// </summary>
        /// <exception cref="ApplicationConfigurationException">
        /// Выбрасывается в случае, если не найден файл конфигурации 'appsettings.local.json' или 'appsettings.json'. 
        /// </exception>
        private static IConfiguration CreateConfiguration()
        {
            var configurationBuilder = new ConfigurationBuilder();
            
            if (configurationBuilder.TryAddConfigurationFile("appsettings.local.json"))
            {
                return configurationBuilder.Build();
            }
            
            if (configurationBuilder.TryAddConfigurationFile("appsettings.json"))
            {
                return configurationBuilder.Build();
            }
                
            var message = "Не найден файл конфигурации.";
            throw new ApplicationConfigurationException(message);
        }

        /// <summary>
        /// Добавить в конфигурацию приложения .json файл, если он найден в директории приложения.
        /// </summary>
        /// <param name="configurationBuilder">
        /// Строитель конфигурации приложения.
        /// </param>
        /// <param name="fileName">
        /// Имя файла (без полного пути).
        /// </param>
        /// <returns>
        /// true, если файл найден, в противном случае - false.
        /// </returns>
        private static bool TryAddConfigurationFile(this IConfigurationBuilder configurationBuilder,
            string fileName)
        {
            var directory = Directory.GetCurrentDirectory();
            var filePath = Path.Combine(directory, fileName);

            if (!File.Exists(filePath))
            {
                return false;
            }
            
            configurationBuilder.AddJsonFile(filePath);
            return true;
        }
    }
}