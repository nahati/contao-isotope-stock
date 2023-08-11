<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Filesystem_DbafsManagerService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.filesystem.dbafs_manager' shared service.
     *
     * @return \Contao\CoreBundle\Filesystem\Dbafs\DbafsManager
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Filesystem/Dbafs/DbafsManager.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Filesystem/Dbafs/DbafsInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Filesystem/Dbafs/Dbafs.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Filesystem/Dbafs/Hashing/HashGeneratorInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Filesystem/Dbafs/Hashing/HashGenerator.php';

        $container->services['contao.filesystem.dbafs_manager'] = $instance = new \Contao\CoreBundle\Filesystem\Dbafs\DbafsManager();

        $a = ($container->privates['contao.filesystem.dbafs_factory'] ?? $container->load('getContao_Filesystem_DbafsFactoryService'))->__invoke(($container->privates['contao.filesystem.virtual.files'] ?? $container->load('getContao_Filesystem_Virtual_FilesService')), ($container->privates['contao.filesystem.hash_generator.files'] ?? ($container->privates['contao.filesystem.hash_generator.files'] = new \Contao\CoreBundle\Filesystem\Dbafs\Hashing\HashGenerator('md5', true))), 'tl_files');
        $a->useLastModified(true);
        $a->setDatabasePathPrefix('files');

        $instance->register($a, 'files');

        return $instance;
    }
}
