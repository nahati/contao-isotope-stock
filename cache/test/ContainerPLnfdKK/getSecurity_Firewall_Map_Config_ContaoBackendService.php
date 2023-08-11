<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getSecurity_Firewall_Map_Config_ContaoBackendService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'security.firewall.map.config.contao_backend' shared service.
     *
     * @return \Symfony\Bundle\SecurityBundle\Security\FirewallConfig
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/security-bundle/Security/FirewallConfig.php';

        return $container->privates['security.firewall.map.config.contao_backend'] = new \Symfony\Bundle\SecurityBundle\Security\FirewallConfig('contao_backend', 'contao.security.user_checker', 'contao.routing.backend_matcher', true, false, 'contao.security.backend_user_provider', 'contao_backend', 'contao.security.authentication_entry_point', NULL, NULL, [0 => 'switch_user', 1 => 'contao_login', 2 => 'anonymous'], ['parameter' => '_switch_user', 'role' => 'ROLE_ALLOWED_TO_SWITCH']);
    }
}
