<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Cron_PurgePreviewLinksService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.cron.purge_preview_links' shared service.
     *
     * @return \Contao\CoreBundle\Cron\PurgePreviewLinksCron
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Cron/PurgePreviewLinksCron.php';

        $a = ($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService());

        if (isset($container->privates['contao.cron.purge_preview_links'])) {
            return $container->privates['contao.cron.purge_preview_links'];
        }

        return $container->privates['contao.cron.purge_preview_links'] = new \Contao\CoreBundle\Cron\PurgePreviewLinksCron($a);
    }
}
