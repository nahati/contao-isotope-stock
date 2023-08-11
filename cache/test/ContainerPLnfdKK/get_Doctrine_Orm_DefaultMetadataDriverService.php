<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class get_Doctrine_Orm_DefaultMetadataDriverService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private '.doctrine.orm.default_metadata_driver' shared service.
     *
     * @return \Doctrine\Bundle\DoctrineBundle\Mapping\MappingDriver
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/doctrine/persistence/src/Persistence/Mapping/Driver/MappingDriver.php';
        include_once \dirname(__DIR__, 3).'/vendor/doctrine/doctrine-bundle/Mapping/MappingDriver.php';
        include_once \dirname(__DIR__, 3).'/vendor/doctrine/persistence/src/Persistence/Mapping/Driver/MappingDriverChain.php';

        $a = new \Doctrine\Persistence\Mapping\Driver\MappingDriverChain();
        $a->addDriver(($container->privates['doctrine.orm.default_annotation_metadata_driver'] ?? $container->load('getDoctrine_Orm_DefaultAnnotationMetadataDriverService')), 'Contao\\CoreBundle\\Entity');

        return $container->privates['.doctrine.orm.default_metadata_driver'] = new \Doctrine\Bundle\DoctrineBundle\Mapping\MappingDriver($a, ($container->privates['.service_locator.KLVvNIq'] ?? $container->load('get_ServiceLocator_KLVvNIqService')));
    }
}
