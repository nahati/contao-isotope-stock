<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Security_AuthenticationProvider_ContaoBackend_TwoFactorDecoratorService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.security.authentication_provider.contao_backend.two_factor_decorator' shared service.
     *
     * @return \Scheb\TwoFactorBundle\Security\Authentication\Provider\AuthenticationProviderDecorator
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/security-core/Authentication/AuthenticationManagerInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/security-core/Authentication/Provider/AuthenticationProviderInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/scheb/2fa-bundle/Security/Authentication/Provider/AuthenticationProviderDecorator.php';
        include_once \dirname(__DIR__, 3).'/vendor/scheb/2fa-bundle/Security/TwoFactor/AuthenticationContextFactoryInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/scheb/2fa-bundle/Security/TwoFactor/AuthenticationContextFactory.php';

        $a = ($container->privates['contao.security.authentication_provider.contao_backend.two_factor_decorator.inner'] ?? $container->load('getContao_Security_AuthenticationProvider_ContaoBackend_TwoFactorDecorator_InnerService'));

        if (isset($container->privates['contao.security.authentication_provider.contao_backend.two_factor_decorator'])) {
            return $container->privates['contao.security.authentication_provider.contao_backend.two_factor_decorator'];
        }
        $b = ($container->services['security.firewall.map'] ?? $container->getSecurity_Firewall_MapService());

        if (isset($container->privates['contao.security.authentication_provider.contao_backend.two_factor_decorator'])) {
            return $container->privates['contao.security.authentication_provider.contao_backend.two_factor_decorator'];
        }

        return $container->privates['contao.security.authentication_provider.contao_backend.two_factor_decorator'] = new \Scheb\TwoFactorBundle\Security\Authentication\Provider\AuthenticationProviderDecorator($a, ($container->privates['scheb_two_factor.condition_handler'] ?? $container->load('getSchebTwoFactor_ConditionHandlerService')), ($container->privates['scheb_two_factor.authentication_context_factory'] ?? ($container->privates['scheb_two_factor.authentication_context_factory'] = new \Scheb\TwoFactorBundle\Security\TwoFactor\AuthenticationContextFactory('Scheb\\TwoFactorBundle\\Security\\TwoFactor\\AuthenticationContext'))), $b, ($container->services['request_stack'] ?? ($container->services['request_stack'] = new \Symfony\Component\HttpFoundation\RequestStack())));
    }
}
