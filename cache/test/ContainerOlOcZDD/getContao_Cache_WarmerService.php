<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Cache_WarmerService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.cache.warmer' shared service.
     *
     * @return \Contao\CoreBundle\Cache\ContaoCacheWarmer
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Cache/ContaoCacheWarmer.php';

        return $container->services['contao.cache.warmer'] = new \Contao\CoreBundle\Cache\ContaoCacheWarmer(($container->services['.container.private.filesystem'] ?? ($container->services['.container.private.filesystem'] = new \Symfony\Component\Filesystem\Filesystem())), ($container->services['contao.resource_finder'] ?? $container->getContao_ResourceFinderService()), ($container->services['contao.resource_locator'] ?? $container->load('getContao_ResourceLocatorService')), \dirname(__DIR__, 3), ($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()), ($container->services['contao.framework'] ?? $container->getContao_FrameworkService()), ($container->services['contao.intl.locales'] ?? $container->getContao_Intl_LocalesService()));
    }
}
