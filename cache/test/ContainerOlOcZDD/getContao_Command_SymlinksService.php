<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Command_SymlinksService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.command.symlinks' shared service.
     *
     * @return \Contao\CoreBundle\Command\SymlinksCommand
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/console/Command/Command.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Command/SymlinksCommand.php';

        $container->services['contao.command.symlinks'] = $instance = new \Contao\CoreBundle\Command\SymlinksCommand(\dirname(__DIR__, 3), 'files', (\dirname(__DIR__, 3).'/logs'), ($container->services['contao.resource_finder'] ?? $container->getContao_ResourceFinderService()), ($container->services['event_dispatcher'] ?? $container->getEventDispatcherService()));

        $instance->setName('contao:symlinks');
        $instance->setDescription('Symlinks the public resources into the public directory.');

        return $instance;
    }
}
