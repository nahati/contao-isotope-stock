<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Migration_Version412_AllowedExcludedFieldsService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.migration.version_412.allowed_excluded_fields' shared service.
     *
     * @return \Contao\CoreBundle\Migration\Version412\AllowedExcludedFieldsMigration
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Migration/MigrationInterface.php';
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Migration/AbstractMigration.php';
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Migration/Version412/AllowedExcludedFieldsMigration.php';

        return $container->privates['contao.migration.version_412.allowed_excluded_fields'] = new \Contao\CoreBundle\Migration\Version412\AllowedExcludedFieldsMigration(($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()));
    }
}