<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getFaviconControllerService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'Contao\CoreBundle\Controller\FaviconController' shared service.
     *
     * @return \Contao\CoreBundle\Controller\FaviconController
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Controller/FaviconController.php';

        return $container->services['Contao\\CoreBundle\\Controller\\FaviconController'] = new \Contao\CoreBundle\Controller\FaviconController(($container->services['contao.framework'] ?? $container->getContao_FrameworkService()), \dirname(__DIR__, 3), ($container->services['contao.cache.entity_tags'] ?? $container->load('getContao_Cache_EntityTagsService')));
    }
}
