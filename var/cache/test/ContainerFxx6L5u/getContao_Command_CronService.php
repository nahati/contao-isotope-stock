<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Command_CronService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.command.cron' shared service.
     *
     * @return \Contao\CoreBundle\Command\CronCommand
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/symfony/console/Command/Command.php';
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Command/CronCommand.php';

        $container->privates['contao.command.cron'] = $instance = new \Contao\CoreBundle\Command\CronCommand(($container->services['contao.cron'] ?? $container->load('getContao_CronService')));

        $instance->setName('contao:cron');
        $instance->setDescription('Runs all registered cron jobs on the command line.');

        return $instance;
    }
}
