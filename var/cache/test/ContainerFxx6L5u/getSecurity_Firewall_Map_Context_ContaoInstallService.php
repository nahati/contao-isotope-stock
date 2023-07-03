<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getSecurity_Firewall_Map_Context_ContaoInstallService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'security.firewall.map.context.contao_install' shared service.
     *
     * @return \Symfony\Bundle\SecurityBundle\Security\FirewallContext
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/symfony/security-bundle/Security/FirewallContext.php';

        return $container->privates['security.firewall.map.context.contao_install'] = new \Symfony\Bundle\SecurityBundle\Security\FirewallContext(new RewindableGenerator(function () use ($container) {
            return new \EmptyIterator();
        }, 0), NULL, NULL, ($container->privates['security.firewall.map.config.contao_install'] ?? $container->load('getSecurity_Firewall_Map_Config_ContaoInstallService')));
    }
}
