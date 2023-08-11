<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Listener_Widget_RootPageDependentSelectService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.listener.widget.root_page_dependent_select' shared service.
     *
     * @return \Contao\CoreBundle\EventListener\Widget\RootPageDependentSelectListener
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/Widget/RootPageDependentSelectListener.php';

        return $container->services['contao.listener.widget.root_page_dependent_select'] = new \Contao\CoreBundle\EventListener\Widget\RootPageDependentSelectListener(($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()), ($container->services['router'] ?? $container->getRouterService()), ($container->services['translator'] ?? $container->getTranslatorService()), ($container->services['contao.csrf.token_manager'] ?? $container->getContao_Csrf_TokenManagerService()));
    }
}
