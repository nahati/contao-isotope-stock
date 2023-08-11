<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getSecurity_Firewall_Map_Config_ContaoFrontendService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'security.firewall.map.config.contao_frontend' shared service.
     *
     * @return \Symfony\Bundle\SecurityBundle\Security\FirewallConfig
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/security-bundle/Security/FirewallConfig.php';

        return $container->privates['security.firewall.map.config.contao_frontend'] = new \Symfony\Bundle\SecurityBundle\Security\FirewallConfig('contao_frontend', 'contao.security.user_checker', 'contao.routing.frontend_matcher', true, false, 'contao.security.frontend_user_provider', 'contao_frontend', 'contao.security.authentication_entry_point', NULL, NULL, [0 => 'contao_login', 1 => 'remember_me', 2 => 'anonymous'], NULL);
    }
}
