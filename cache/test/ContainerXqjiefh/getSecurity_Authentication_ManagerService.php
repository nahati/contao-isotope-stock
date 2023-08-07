<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getSecurity_Authentication_ManagerService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'security.authentication.manager' shared service.
     *
     * @return \Symfony\Component\Security\Core\Authentication\AuthenticationProviderManager
     *
     * @deprecated Since symfony/security-bundle 5.3: The "security.authentication.manager" service is deprecated, use the new authenticator system instead.
     */
    public static function do($container, $lazyLoad = true)
    {
        trigger_deprecation('symfony/security-bundle', '5.3', 'The "security.authentication.manager" service is deprecated, use the new authenticator system instead.');

        $container->privates['security.authentication.manager'] = $instance = new \Symfony\Component\Security\Core\Authentication\AuthenticationProviderManager(new RewindableGenerator(function () use ($container) {
            yield 0 => ($container->privates['contao.security.authentication_provider.contao_backend.two_factor_decorator'] ?? $container->load('getContao_Security_AuthenticationProvider_ContaoBackend_TwoFactorDecoratorService'));
            yield 1 => ($container->privates['security.authentication.provider.anonymous.contao_backend.two_factor_decorator'] ?? $container->load('getSecurity_Authentication_Provider_Anonymous_ContaoBackend_TwoFactorDecoratorService'));
            yield 2 => ($container->privates['contao.security.authentication_provider.contao_frontend.two_factor_decorator'] ?? $container->load('getContao_Security_AuthenticationProvider_ContaoFrontend_TwoFactorDecoratorService'));
            yield 3 => ($container->privates['security.authentication.provider.rememberme.contao_frontend.two_factor_decorator'] ?? $container->load('getSecurity_Authentication_Provider_Rememberme_ContaoFrontend_TwoFactorDecoratorService'));
            yield 4 => ($container->privates['security.authentication.provider.anonymous.contao_frontend.two_factor_decorator'] ?? $container->load('getSecurity_Authentication_Provider_Anonymous_ContaoFrontend_TwoFactorDecoratorService'));
        }, 5), true);

        $instance->setEventDispatcher(($container->services['event_dispatcher'] ?? $container->getEventDispatcherService()));

        return $instance;
    }
}
