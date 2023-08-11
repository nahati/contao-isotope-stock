<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Command_UserListService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.command.user_list' shared service.
     *
     * @return \Contao\CoreBundle\Command\UserListCommand
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/console/Command/Command.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Command/UserListCommand.php';

        $container->privates['contao.command.user_list'] = $instance = new \Contao\CoreBundle\Command\UserListCommand(($container->services['contao.framework'] ?? $container->getContao_FrameworkService()));

        $instance->setName('contao:user:list');
        $instance->setDescription('Lists Contao back end users.');

        return $instance;
    }
}
