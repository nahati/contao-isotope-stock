<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Filesystem_DbafsFactoryService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.filesystem.dbafs_factory' shared service.
     *
     * @return \Contao\CoreBundle\Filesystem\Dbafs\DbafsFactory
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Filesystem/Dbafs/DbafsFactory.php';

        return $container->privates['contao.filesystem.dbafs_factory'] = new \Contao\CoreBundle\Filesystem\Dbafs\DbafsFactory(($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()), ($container->services['event_dispatcher'] ?? $container->getEventDispatcherService()));
    }
}
