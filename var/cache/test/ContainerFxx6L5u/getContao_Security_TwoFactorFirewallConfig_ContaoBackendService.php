<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Security_TwoFactorFirewallConfig_ContaoBackendService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.security.two_factor_firewall_config.contao_backend' shared service.
     *
     * @return \Scheb\TwoFactorBundle\Security\TwoFactor\TwoFactorFirewallConfig
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/scheb/2fa-bundle/Security/TwoFactor/TwoFactorFirewallConfig.php';
        include_once \dirname(__DIR__, 4).'/vendor/scheb/2fa-bundle/Security/Http/Utils/RequestDataReader.php';

        return $container->privates['contao.security.two_factor_firewall_config.contao_backend'] = new \Scheb\TwoFactorBundle\Security\TwoFactor\TwoFactorFirewallConfig(['remember_me' => false, 'require_previous_session' => false], 'contao_backend', ($container->privates['security.http_utils'] ?? $container->load('getSecurity_HttpUtilsService')), ($container->privates['scheb_two_factor.security.request_data_reader'] ?? ($container->privates['scheb_two_factor.security.request_data_reader'] = new \Scheb\TwoFactorBundle\Security\Http\Utils\RequestDataReader())));
    }
}