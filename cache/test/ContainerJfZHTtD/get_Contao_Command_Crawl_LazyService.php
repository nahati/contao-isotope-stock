<?php

namespace ContainerJfZHTtD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class get_Contao_Command_Crawl_LazyService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private '.contao.command.crawl.lazy' shared service.
     *
     * @return \Symfony\Component\Console\Command\LazyCommand
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/console/Command/Command.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/console/Command/LazyCommand.php';

        return $container->privates['.contao.command.crawl.lazy'] = new \Symfony\Component\Console\Command\LazyCommand('contao:crawl', [], 'Crawls the Contao root pages with the desired subscribers.', false, function () use ($container): \Contao\CoreBundle\Command\CrawlCommand {
            return ($container->privates['contao.command.crawl'] ?? $container->load('getContao_Command_CrawlService'));
        });
    }
}
