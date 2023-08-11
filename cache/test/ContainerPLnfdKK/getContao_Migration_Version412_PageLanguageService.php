<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Migration_Version412_PageLanguageService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.migration.version_412.page_language' shared service.
     *
     * @return \Contao\CoreBundle\Migration\Version412\PageLanguageMigration
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Migration/MigrationInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Migration/AbstractMigration.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Migration/Version412/PageLanguageMigration.php';

        return $container->privates['contao.migration.version_412.page_language'] = new \Contao\CoreBundle\Migration\Version412\PageLanguageMigration(($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()));
    }
}
