<?php

namespace ContainerJfZHTtD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Command_UserPasswordService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.command.user_password' shared service.
     *
     * @return \Contao\CoreBundle\Command\UserPasswordCommand
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/console/Command/Command.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Command/UserPasswordCommand.php';

        $container->privates['contao.command.user_password'] = $instance = new \Contao\CoreBundle\Command\UserPasswordCommand(($container->services['contao.framework'] ?? $container->getContao_FrameworkService()), ($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()), ($container->services['security.password_hasher_factory'] ?? $container->load('getSecurity_PasswordHasherFactoryService')));

        $instance->setName('contao:user:password');
        $instance->setDescription('Changes the password of a Contao back end user.');

        return $instance;
    }
}
