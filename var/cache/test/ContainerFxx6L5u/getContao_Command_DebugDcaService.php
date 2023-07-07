<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Command_DebugDcaService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.command.debug_dca' shared service.
     *
     * @return \Contao\CoreBundle\Command\DebugDcaCommand
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/symfony/console/Command/Command.php';
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Command/DebugDcaCommand.php';

        $container->privates['contao.command.debug_dca'] = $instance = new \Contao\CoreBundle\Command\DebugDcaCommand(($container->services['contao.framework'] ?? $container->getContao_FrameworkService()));

        $instance->setName('debug:dca');
        $instance->setDescription('Dumps the DCA configuration for a table.');

        return $instance;
    }
}
