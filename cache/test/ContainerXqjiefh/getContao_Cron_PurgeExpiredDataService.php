<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Cron_PurgeExpiredDataService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.cron.purge_expired_data' shared service.
     *
     * @return \Contao\CoreBundle\Cron\PurgeExpiredDataCron
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Cron/PurgeExpiredDataCron.php';

        $a = ($container->services['contao.framework'] ?? $container->getContao_FrameworkService());

        if (isset($container->privates['contao.cron.purge_expired_data'])) {
            return $container->privates['contao.cron.purge_expired_data'];
        }
        $b = ($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService());

        if (isset($container->privates['contao.cron.purge_expired_data'])) {
            return $container->privates['contao.cron.purge_expired_data'];
        }

        return $container->privates['contao.cron.purge_expired_data'] = new \Contao\CoreBundle\Cron\PurgeExpiredDataCron($a, $b);
    }
}
