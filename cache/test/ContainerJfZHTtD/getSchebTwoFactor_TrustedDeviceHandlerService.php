<?php

namespace ContainerJfZHTtD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getSchebTwoFactor_TrustedDeviceHandlerService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'scheb_two_factor.trusted_device_handler' shared service.
     *
     * @return \Scheb\TwoFactorBundle\Security\TwoFactor\Handler\TrustedDeviceHandler
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/scheb/2fa-bundle/Security/TwoFactor/Handler/AuthenticationHandlerInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/scheb/2fa-trusted-device/Security/TwoFactor/Handler/TrustedDeviceHandler.php';

        return $container->privates['scheb_two_factor.trusted_device_handler'] = new \Scheb\TwoFactorBundle\Security\TwoFactor\Handler\TrustedDeviceHandler(($container->privates['scheb_two_factor.provider_handler'] ?? $container->load('getSchebTwoFactor_ProviderHandlerService')), ($container->privates['scheb_two_factor.default_trusted_device_manager'] ?? $container->load('getSchebTwoFactor_DefaultTrustedDeviceManagerService')), false);
    }
}
