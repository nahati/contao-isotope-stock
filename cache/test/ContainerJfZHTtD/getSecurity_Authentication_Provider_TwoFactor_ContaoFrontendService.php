<?php

namespace ContainerJfZHTtD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getSecurity_Authentication_Provider_TwoFactor_ContaoFrontendService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'security.authentication.provider.two_factor.contao_frontend' shared service.
     *
     * @return \Scheb\TwoFactorBundle\Security\Authentication\Provider\TwoFactorAuthenticationProvider
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/security-core/Authentication/AuthenticationManagerInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/security-core/Authentication/Provider/AuthenticationProviderInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/scheb/2fa-bundle/Security/Authentication/Provider/TwoFactorAuthenticationProvider.php';
        include_once \dirname(__DIR__, 3).'/vendor/scheb/2fa-backup-code/Security/TwoFactor/Backup/BackupCodeManagerInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Security/TwoFactor/BackupCodeManager.php';

        return $container->privates['security.authentication.provider.two_factor.contao_frontend'] = new \Scheb\TwoFactorBundle\Security\Authentication\Provider\TwoFactorAuthenticationProvider(($container->privates['contao.security.two_factor_firewall_config.contao_frontend'] ?? $container->load('getContao_Security_TwoFactorFirewallConfig_ContaoFrontendService')), ($container->privates['scheb_two_factor.provider_registry'] ?? $container->getSchebTwoFactor_ProviderRegistryService()), ($container->services['contao.security.two_factor.backup_code_manager'] ?? ($container->services['contao.security.two_factor.backup_code_manager'] = new \Contao\CoreBundle\Security\TwoFactor\BackupCodeManager())), ($container->privates['scheb_two_factor.provider_preparation_recorder'] ?? $container->getSchebTwoFactor_ProviderPreparationRecorderService()));
    }
}
