<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Listener_DataContainer_PageRoutingService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.listener.data_container.page_routing' shared service.
     *
     * @return \Contao\CoreBundle\EventListener\DataContainer\PageRoutingListener
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/DataContainer/PageRoutingListener.php';

        return $container->services['contao.listener.data_container.page_routing'] = new \Contao\CoreBundle\EventListener\DataContainer\PageRoutingListener(($container->services['contao.framework'] ?? $container->getContao_FrameworkService()), ($container->services['contao.routing.page_registry'] ?? $container->getContao_Routing_PageRegistryService()), ($container->services['.container.private.twig'] ?? $container->get_Container_Private_TwigService()));
    }
}
