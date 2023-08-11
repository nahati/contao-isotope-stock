<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Crawl_Escargot_BrokenLinkCheckerSubscriberService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.crawl.escargot.broken_link_checker_subscriber' shared service.
     *
     * @return \Contao\CoreBundle\Crawl\Escargot\Subscriber\BrokenLinkCheckerSubscriber
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/terminal42/escargot/src/Subscriber/SubscriberInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Crawl/Escargot/Subscriber/EscargotSubscriberInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/terminal42/escargot/src/EscargotAwareInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/terminal42/escargot/src/Subscriber/ExceptionSubscriberInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/terminal42/escargot/src/EscargotAwareTrait.php';
        include_once \dirname(__DIR__, 3).'/vendor/terminal42/escargot/src/SubscriberLoggerTrait.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Crawl/Escargot/Subscriber/BrokenLinkCheckerSubscriber.php';

        $container->privates['contao.crawl.escargot.broken_link_checker_subscriber'] = $instance = new \Contao\CoreBundle\Crawl\Escargot\Subscriber\BrokenLinkCheckerSubscriber(($container->services['translator'] ?? $container->getTranslatorService()));

        $instance->setLogger(($container->privates['monolog.logger'] ?? $container->getMonolog_LoggerService()));

        return $instance;
    }
}
