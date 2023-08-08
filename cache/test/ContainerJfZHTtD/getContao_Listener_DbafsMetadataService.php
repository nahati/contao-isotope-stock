<?php

namespace ContainerJfZHTtD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Listener_DbafsMetadataService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.listener.dbafs_metadata' shared service.
     *
     * @return \Contao\CoreBundle\EventListener\DbafsMetadataSubscriber
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/DbafsMetadataSubscriber.php';

        return $container->privates['contao.listener.dbafs_metadata'] = new \Contao\CoreBundle\EventListener\DbafsMetadataSubscriber();
    }
}
