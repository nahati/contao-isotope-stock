<?php

namespace ContainerJfZHTtD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Listener_Menu_BackendPreviewService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.listener.menu.backend_preview' shared service.
     *
     * @return \Contao\CoreBundle\EventListener\Menu\BackendPreviewListener
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/Menu/BackendPreviewListener.php';

        $a = ($container->services['security.helper'] ?? $container->getSecurity_HelperService());

        if (isset($container->privates['contao.listener.menu.backend_preview'])) {
            return $container->privates['contao.listener.menu.backend_preview'];
        }
        $b = ($container->services['router'] ?? $container->getRouterService());

        if (isset($container->privates['contao.listener.menu.backend_preview'])) {
            return $container->privates['contao.listener.menu.backend_preview'];
        }
        $c = ($container->services['translator'] ?? $container->getTranslatorService());

        if (isset($container->privates['contao.listener.menu.backend_preview'])) {
            return $container->privates['contao.listener.menu.backend_preview'];
        }
        $d = ($container->services['event_dispatcher'] ?? $container->getEventDispatcherService());

        if (isset($container->privates['contao.listener.menu.backend_preview'])) {
            return $container->privates['contao.listener.menu.backend_preview'];
        }

        return $container->privates['contao.listener.menu.backend_preview'] = new \Contao\CoreBundle\EventListener\Menu\BackendPreviewListener($a, $b, ($container->services['request_stack'] ?? ($container->services['request_stack'] = new \Symfony\Component\HttpFoundation\RequestStack())), $c, $d);
    }
}
