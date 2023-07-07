<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Migration_Version413_RelLightboxService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.migration.version_413.rel_lightbox' shared service.
     *
     * @return \Contao\CoreBundle\Migration\Version413\RelLightboxMigration
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Migration/MigrationInterface.php';
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Migration/AbstractMigration.php';
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Migration/Version413/RelLightboxMigration.php';

        return $container->privates['contao.migration.version_413.rel_lightbox'] = new \Contao\CoreBundle\Migration\Version413\RelLightboxMigration(($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()), ($container->services['contao.framework'] ?? $container->getContao_FrameworkService()), ($container->services['contao.resource_finder'] ?? $container->getContao_ResourceFinderService()));
    }
}
