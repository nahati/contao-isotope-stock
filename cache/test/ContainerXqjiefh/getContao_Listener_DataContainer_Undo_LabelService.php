<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Listener_DataContainer_Undo_LabelService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.listener.data_container.undo.label' shared service.
     *
     * @return \Contao\CoreBundle\EventListener\DataContainer\Undo\LabelListener
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/DataContainer/Undo/LabelListener.php';

        return $container->services['contao.listener.data_container.undo.label'] = new \Contao\CoreBundle\EventListener\DataContainer\Undo\LabelListener(($container->services['contao.framework'] ?? $container->getContao_FrameworkService()), ($container->services['.container.private.twig'] ?? $container->get_Container_Private_TwigService()));
    }
}
