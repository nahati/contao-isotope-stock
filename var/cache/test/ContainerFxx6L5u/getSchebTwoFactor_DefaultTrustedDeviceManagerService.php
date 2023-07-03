<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getSchebTwoFactor_DefaultTrustedDeviceManagerService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'scheb_two_factor.default_trusted_device_manager' shared service.
     *
     * @return \Scheb\TwoFactorBundle\Security\TwoFactor\Trusted\TrustedDeviceManager
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/scheb/2fa-trusted-device/Security/TwoFactor/Trusted/TrustedDeviceManagerInterface.php';
        include_once \dirname(__DIR__, 4).'/vendor/scheb/2fa-trusted-device/Security/TwoFactor/Trusted/TrustedDeviceManager.php';

        return $container->privates['scheb_two_factor.default_trusted_device_manager'] = new \Scheb\TwoFactorBundle\Security\TwoFactor\Trusted\TrustedDeviceManager(($container->privates['scheb_two_factor.trusted_token_storage'] ?? $container->getSchebTwoFactor_TrustedTokenStorageService()));
    }
}
