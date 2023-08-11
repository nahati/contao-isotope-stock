<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Listener_DataContainer_LayoutOptionsService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.listener.data_container.layout_options' shared service.
     *
     * @return \Contao\CoreBundle\EventListener\DataContainer\LayoutOptionsListener
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/DataContainer/LayoutOptionsListener.php';

        return $container->services['contao.listener.data_container.layout_options'] = new \Contao\CoreBundle\EventListener\DataContainer\LayoutOptionsListener(($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()));
    }
}
