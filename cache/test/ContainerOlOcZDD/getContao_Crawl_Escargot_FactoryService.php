<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Crawl_Escargot_FactoryService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.crawl.escargot.factory' shared service.
     *
     * @return \Contao\CoreBundle\Crawl\Escargot\Factory
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Crawl/Escargot/Factory.php';

        $container->services['contao.crawl.escargot.factory'] = $instance = new \Contao\CoreBundle\Crawl\Escargot\Factory(($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()), ($container->services['contao.framework'] ?? $container->getContao_FrameworkService()), [], []);

        $instance->addSubscriber(($container->privates['contao.crawl.escargot.broken_link_checker_subscriber'] ?? $container->load('getContao_Crawl_Escargot_BrokenLinkCheckerSubscriberService')));

        return $instance;
    }
}
