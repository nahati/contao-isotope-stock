<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Filesystem_Virtual_BackupsService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.filesystem.virtual.backups' shared service.
     *
     * @return \Contao\CoreBundle\Filesystem\VirtualFilesystem
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Filesystem/VirtualFilesystemInterface.php';
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Filesystem/VirtualFilesystem.php';

        return $container->privates['contao.filesystem.virtual.backups'] = ($container->privates['contao.filesystem.virtual_factory'] ?? $container->load('getContao_Filesystem_VirtualFactoryService'))->__invoke('backups', false);
    }
}