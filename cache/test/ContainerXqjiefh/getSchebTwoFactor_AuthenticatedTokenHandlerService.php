<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getSchebTwoFactor_AuthenticatedTokenHandlerService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'scheb_two_factor.authenticated_token_handler' shared service.
     *
     * @return \Scheb\TwoFactorBundle\Security\TwoFactor\Handler\AuthenticatedTokenHandler
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/scheb/2fa-bundle/Security/TwoFactor/Handler/AuthenticationHandlerInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/scheb/2fa-bundle/Security/TwoFactor/Handler/AuthenticatedTokenHandler.php';

        return $container->privates['scheb_two_factor.authenticated_token_handler'] = new \Scheb\TwoFactorBundle\Security\TwoFactor\Handler\AuthenticatedTokenHandler(($container->privates['scheb_two_factor.ip_whitelist_handler'] ?? $container->load('getSchebTwoFactor_IpWhitelistHandlerService')), $container->parameters['scheb_two_factor.security_tokens']);
    }
}
