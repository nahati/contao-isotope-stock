<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Listener_DataContainer_PreviewLinkService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.listener.data_container.preview_link' shared service.
     *
     * @return \Contao\CoreBundle\EventListener\DataContainer\PreviewLinkListener
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/DataContainer/PreviewLinkListener.php';

        return $container->services['contao.listener.data_container.preview_link'] = new \Contao\CoreBundle\EventListener\DataContainer\PreviewLinkListener(($container->services['contao.framework'] ?? $container->getContao_FrameworkService()), ($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()), ($container->services['security.helper'] ?? $container->getSecurity_HelperService()), ($container->services['request_stack'] ?? ($container->services['request_stack'] = new \Symfony\Component\HttpFoundation\RequestStack())), ($container->services['translator'] ?? $container->getTranslatorService()), ($container->services['router'] ?? $container->getRouterService()), ($container->services['uri_signer'] ?? ($container->services['uri_signer'] = new \Symfony\Component\HttpKernel\UriSigner($container->getEnv('APP_SECRET')))), '');
    }
}
