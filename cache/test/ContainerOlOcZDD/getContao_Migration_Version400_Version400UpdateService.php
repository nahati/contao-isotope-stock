<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Migration_Version400_Version400UpdateService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.migration.version_400.version_400_update' shared service.
     *
     * @return \Contao\CoreBundle\Migration\Version400\Version400Update
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Migration/MigrationInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Migration/AbstractMigration.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Migration/Version400/Version400Update.php';

        return $container->privates['contao.migration.version_400.version_400_update'] = new \Contao\CoreBundle\Migration\Version400\Version400Update(($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()));
    }
}
