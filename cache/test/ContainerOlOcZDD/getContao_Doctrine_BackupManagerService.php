<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Doctrine_BackupManagerService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.doctrine.backup_manager' shared service.
     *
     * @return \Contao\CoreBundle\Doctrine\Backup\BackupManager
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Doctrine/Backup/BackupManager.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Doctrine/Backup/DumperInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Doctrine/Backup/Dumper.php';

        return $container->privates['contao.doctrine.backup_manager'] = new \Contao\CoreBundle\Doctrine\Backup\BackupManager(($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()), ($container->privates['contao.doctrine.backup.dumper'] ?? ($container->privates['contao.doctrine.backup.dumper'] = new \Contao\CoreBundle\Doctrine\Backup\Dumper())), ($container->privates['contao.filesystem.virtual.backups'] ?? $container->load('getContao_Filesystem_Virtual_BackupsService')), [0 => 'tl_crawl_queue', 1 => 'tl_log', 2 => 'tl_search', 3 => 'tl_search_index', 4 => 'tl_search_term'], ($container->privates['contao.doctrine.backup.retention_policy'] ?? $container->load('getContao_Doctrine_Backup_RetentionPolicyService')));
    }
}
