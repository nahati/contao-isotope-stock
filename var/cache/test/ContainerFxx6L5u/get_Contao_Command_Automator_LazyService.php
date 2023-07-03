<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class get_Contao_Command_Automator_LazyService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private '.contao.command.automator.lazy' shared service.
     *
     * @return \Symfony\Component\Console\Command\LazyCommand
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/symfony/console/Command/Command.php';
        include_once \dirname(__DIR__, 4).'/vendor/symfony/console/Command/LazyCommand.php';

        return $container->privates['.contao.command.automator.lazy'] = new \Symfony\Component\Console\Command\LazyCommand('contao:automator', [], 'Runs automator tasks on the command line.', false, function () use ($container): \Contao\CoreBundle\Command\AutomatorCommand {
            return ($container->privates['contao.command.automator'] ?? $container->load('getContao_Command_AutomatorService'));
        });
    }
}
