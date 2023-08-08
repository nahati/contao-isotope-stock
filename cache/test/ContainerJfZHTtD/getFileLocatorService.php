<?php

namespace ContainerJfZHTtD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getFileLocatorService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'file_locator' shared service.
     *
     * @return \Symfony\Component\HttpKernel\Config\FileLocator
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/config/FileLocatorInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/config/FileLocator.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/http-kernel/Config/FileLocator.php';

        return $container->privates['file_locator'] = new \Symfony\Component\HttpKernel\Config\FileLocator(($container->services['kernel'] ?? $container->get('kernel', 1)));
    }
}
