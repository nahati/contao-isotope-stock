<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Doctrine_DcaSchemaProviderService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.doctrine.dca_schema_provider' shared service.
     *
     * @return \Contao\CoreBundle\Doctrine\Schema\DcaSchemaProvider
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Doctrine/Schema/DcaSchemaProvider.php';

        $a = ($container->services['contao.framework'] ?? $container->getContao_FrameworkService());

        if (isset($container->privates['contao.doctrine.dca_schema_provider'])) {
            return $container->privates['contao.doctrine.dca_schema_provider'];
        }
        $b = ($container->privates['contao.doctrine.schema_provider'] ?? $container->load('getContao_Doctrine_SchemaProviderService'));

        if (isset($container->privates['contao.doctrine.dca_schema_provider'])) {
            return $container->privates['contao.doctrine.dca_schema_provider'];
        }

        return $container->privates['contao.doctrine.dca_schema_provider'] = new \Contao\CoreBundle\Doctrine\Schema\DcaSchemaProvider($a, ($container->services['doctrine'] ?? $container->load('getDoctrineService')), $b);
    }
}
