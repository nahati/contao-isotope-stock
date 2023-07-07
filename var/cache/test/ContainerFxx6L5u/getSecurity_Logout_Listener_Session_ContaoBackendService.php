<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getSecurity_Logout_Listener_Session_ContaoBackendService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'security.logout.listener.session.contao_backend' shared service.
     *
     * @return \Symfony\Component\Security\Http\EventListener\SessionLogoutListener
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/symfony/security-http/EventListener/SessionLogoutListener.php';

        return $container->privates['security.logout.listener.session.contao_backend'] = new \Symfony\Component\Security\Http\EventListener\SessionLogoutListener();
    }
}
