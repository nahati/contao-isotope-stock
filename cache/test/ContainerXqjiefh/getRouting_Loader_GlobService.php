<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getRouting_Loader_GlobService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'routing.loader.glob' shared service.
     *
     * @return \Symfony\Component\Routing\Loader\GlobFileLoader
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/config/Loader/LoaderInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/config/Loader/Loader.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/config/Loader/FileLoader.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/routing/Loader/GlobFileLoader.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/config/FileLocatorInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/config/FileLocator.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/http-kernel/Config/FileLocator.php';

        return $container->privates['routing.loader.glob'] = new \Symfony\Component\Routing\Loader\GlobFileLoader(($container->privates['file_locator'] ?? ($container->privates['file_locator'] = new \Symfony\Component\HttpKernel\Config\FileLocator(($container->services['kernel'] ?? $container->get('kernel', 1))))), 'test');
    }
}
