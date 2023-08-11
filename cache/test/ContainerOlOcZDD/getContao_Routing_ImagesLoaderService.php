<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Routing_ImagesLoaderService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.routing.images_loader' shared service.
     *
     * @return \Contao\CoreBundle\Routing\ImagesLoader
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/config/Loader/LoaderInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/config/Loader/Loader.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Routing/ImagesLoader.php';

        return $container->privates['contao.routing.images_loader'] = new \Contao\CoreBundle\Routing\ImagesLoader(\dirname(__DIR__, 3), (\dirname(__DIR__, 3).'/assets/images'));
    }
}
