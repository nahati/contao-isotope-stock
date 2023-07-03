<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Image_DeferredImageStorageService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.image.deferred_image_storage' shared service.
     *
     * @return \Contao\Image\DeferredImageStorageFilesystem
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/contao/image/src/DeferredImageStorageInterface.php';
        include_once \dirname(__DIR__, 4).'/vendor/contao/image/src/DeferredImageStorageFilesystem.php';

        return $container->privates['contao.image.deferred_image_storage'] = new \Contao\Image\DeferredImageStorageFilesystem((\dirname(__DIR__, 3).'/assets/images'), ($container->services['.container.private.filesystem'] ?? ($container->services['.container.private.filesystem'] = new \Symfony\Component\Filesystem\Filesystem())));
    }
}
