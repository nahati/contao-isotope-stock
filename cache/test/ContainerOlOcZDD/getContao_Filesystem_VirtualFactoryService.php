<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Filesystem_VirtualFactoryService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.filesystem.virtual_factory' shared service.
     *
     * @return \Contao\CoreBundle\Filesystem\VirtualFilesystemFactory
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Filesystem/VirtualFilesystemFactory.php';

        $a = ($container->services['contao.filesystem.dbafs_manager'] ?? $container->load('getContao_Filesystem_DbafsManagerService'));

        if (isset($container->privates['contao.filesystem.virtual_factory'])) {
            return $container->privates['contao.filesystem.virtual_factory'];
        }

        return $container->privates['contao.filesystem.virtual_factory'] = new \Contao\CoreBundle\Filesystem\VirtualFilesystemFactory(($container->privates['contao.filesystem.mount_manager'] ?? $container->load('getContao_Filesystem_MountManagerService')), $a);
    }
}
