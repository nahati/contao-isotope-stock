<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getSecurity_Authentication_Provider_Rememberme_ContaoFrontend_TwoFactorDecorator_InnerService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'security.authentication.provider.rememberme.contao_frontend.two_factor_decorator.inner' shared service.
     *
     * @return \Symfony\Component\Security\Core\Authentication\Provider\RememberMeAuthenticationProvider
     *
     * @deprecated Since symfony/security-bundle 5.3: The "security.authentication.provider.rememberme.contao_frontend.two_factor_decorator.inner" service is deprecated, use the new authenticator system instead.
     */
    public static function do($container, $lazyLoad = true)
    {
        trigger_deprecation('symfony/security-bundle', '5.3', 'The "security.authentication.provider.rememberme.contao_frontend.two_factor_decorator.inner" service is deprecated, use the new authenticator system instead.');

        $a = ($container->privates['contao.security.user_checker'] ?? $container->load('getContao_Security_UserCheckerService'));

        if (isset($container->privates['security.authentication.provider.rememberme.contao_frontend.two_factor_decorator.inner'])) {
            return $container->privates['security.authentication.provider.rememberme.contao_frontend.two_factor_decorator.inner'];
        }

        return $container->privates['security.authentication.provider.rememberme.contao_frontend.two_factor_decorator.inner'] = new \Symfony\Component\Security\Core\Authentication\Provider\RememberMeAuthenticationProvider($a, $container->getEnv('APP_SECRET'), 'contao_frontend');
    }
}
