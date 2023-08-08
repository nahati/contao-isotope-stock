<?php

namespace ContainerJfZHTtD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Command_MigrateService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.command.migrate' shared service.
     *
     * @return \Contao\CoreBundle\Command\MigrateCommand
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/console/Command/Command.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Command/MigrateCommand.php';

        $container->privates['contao.command.migrate'] = $instance = new \Contao\CoreBundle\Command\MigrateCommand(($container->privates['contao.migration.collection'] ?? $container->load('getContao_Migration_CollectionService')), ($container->services['contao.resource_locator'] ?? $container->load('getContao_ResourceLocatorService')), \dirname(__DIR__, 3), ($container->services['contao.framework'] ?? $container->getContao_FrameworkService()), ($container->privates['contao.doctrine.backup_manager'] ?? $container->load('getContao_Doctrine_BackupManagerService')), ($container->privates['contao.doctrine.schema_provider'] ?? $container->load('getContao_Doctrine_SchemaProviderService')), ($container->privates['contao.doctrine.schema.mysql_innodb_row_size_calculator'] ?? $container->load('getContao_Doctrine_Schema_MysqlInnodbRowSizeCalculatorService')), ($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()), NULL);

        $instance->setName('contao:migrate');
        $instance->setDescription('Executes migrations and updates the database schema.');

        return $instance;
    }
}
