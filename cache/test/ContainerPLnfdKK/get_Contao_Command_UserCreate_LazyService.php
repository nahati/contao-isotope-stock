<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class get_Contao_Command_UserCreate_LazyService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private '.contao.command.user_create.lazy' shared service.
     *
     * @return \Symfony\Component\Console\Command\LazyCommand
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/console/Command/Command.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/console/Command/LazyCommand.php';

        return $container->privates['.contao.command.user_create.lazy'] = new \Symfony\Component\Console\Command\LazyCommand('contao:user:create', [], 'Create a new Contao back end user.', false, function () use ($container): \Contao\CoreBundle\Command\UserCreateCommand {
            return ($container->privates['contao.command.user_create'] ?? $container->load('getContao_Command_UserCreateService'));
        });
    }
}
