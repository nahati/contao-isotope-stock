<?php

namespace ContainerJfZHTtD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Command_UserCreateService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.command.user_create' shared service.
     *
     * @return \Contao\CoreBundle\Command\UserCreateCommand
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/console/Command/Command.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Command/UserCreateCommand.php';

        $container->privates['contao.command.user_create'] = $instance = new \Contao\CoreBundle\Command\UserCreateCommand(($container->services['contao.framework'] ?? $container->getContao_FrameworkService()), ($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()), ($container->services['security.password_hasher_factory'] ?? $container->load('getSecurity_PasswordHasherFactoryService')), ($container->services['contao.intl.locales'] ?? $container->getContao_Intl_LocalesService()));

        $instance->setName('contao:user:create');
        $instance->setDescription('Create a new Contao back end user.');

        return $instance;
    }
}
