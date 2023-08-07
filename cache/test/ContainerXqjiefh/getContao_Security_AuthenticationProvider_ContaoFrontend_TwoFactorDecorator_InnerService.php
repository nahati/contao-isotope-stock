<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Security_AuthenticationProvider_ContaoFrontend_TwoFactorDecorator_InnerService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.security.authentication_provider.contao_frontend.two_factor_decorator.inner' shared service.
     *
     * @return \Contao\CoreBundle\Security\Authentication\Provider\AuthenticationProvider
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/security-core/Authentication/AuthenticationManagerInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/security-core/Authentication/Provider/AuthenticationProviderInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/security-core/Authentication/Provider/UserAuthenticationProvider.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/security-core/Authentication/Provider/DaoAuthenticationProvider.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Security/Authentication/Provider/AuthenticationProvider.php';
        include_once \dirname(__DIR__, 3).'/vendor/scheb/2fa-bundle/Security/TwoFactor/AuthenticationContextFactoryInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/scheb/2fa-bundle/Security/TwoFactor/AuthenticationContextFactory.php';

        $a = ($container->privates['contao.security.frontend_user_provider'] ?? $container->load('getContao_Security_FrontendUserProviderService'));

        if (isset($container->privates['contao.security.authentication_provider.contao_frontend.two_factor_decorator.inner'])) {
            return $container->privates['contao.security.authentication_provider.contao_frontend.two_factor_decorator.inner'];
        }
        $b = ($container->privates['contao.security.user_checker'] ?? $container->load('getContao_Security_UserCheckerService'));

        if (isset($container->privates['contao.security.authentication_provider.contao_frontend.two_factor_decorator.inner'])) {
            return $container->privates['contao.security.authentication_provider.contao_frontend.two_factor_decorator.inner'];
        }
        $c = ($container->services['contao.framework'] ?? $container->getContao_FrameworkService());

        if (isset($container->privates['contao.security.authentication_provider.contao_frontend.two_factor_decorator.inner'])) {
            return $container->privates['contao.security.authentication_provider.contao_frontend.two_factor_decorator.inner'];
        }

        return $container->privates['contao.security.authentication_provider.contao_frontend.two_factor_decorator.inner'] = new \Contao\CoreBundle\Security\Authentication\Provider\AuthenticationProvider($a, $b, 'contao_frontend', ($container->services['security.password_hasher_factory'] ?? $container->load('getSecurity_PasswordHasherFactoryService')), $c, ($container->privates['security.authentication.provider.two_factor.contao_frontend'] ?? $container->load('getSecurity_Authentication_Provider_TwoFactor_ContaoFrontendService')), ($container->privates['scheb_two_factor.authenticated_token_handler'] ?? $container->load('getSchebTwoFactor_AuthenticatedTokenHandlerService')), ($container->privates['scheb_two_factor.authentication_context_factory'] ?? ($container->privates['scheb_two_factor.authentication_context_factory'] = new \Scheb\TwoFactorBundle\Security\TwoFactor\AuthenticationContextFactory('Scheb\\TwoFactorBundle\\Security\\TwoFactor\\AuthenticationContext'))), ($container->services['request_stack'] ?? ($container->services['request_stack'] = new \Symfony\Component\HttpFoundation\RequestStack())), ($container->services['contao.security.two_factor.trusted_device_manager'] ?? $container->load('getContao_Security_TwoFactor_TrustedDeviceManagerService')));
    }
}
