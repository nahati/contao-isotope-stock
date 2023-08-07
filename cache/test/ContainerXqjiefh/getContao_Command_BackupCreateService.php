<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Command_BackupCreateService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.command.backup_create' shared service.
     *
     * @return \Contao\CoreBundle\Command\Backup\BackupCreateCommand
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/console/Command/Command.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Command/Backup/AbstractBackupCommand.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Command/Backup/BackupCreateCommand.php';

        $container->privates['contao.command.backup_create'] = $instance = new \Contao\CoreBundle\Command\Backup\BackupCreateCommand(($container->privates['contao.doctrine.backup_manager'] ?? $container->load('getContao_Doctrine_BackupManagerService')));

        $instance->setName('contao:backup:create');
        $instance->setDescription('Creates a new database backup.');

        return $instance;
    }
}
