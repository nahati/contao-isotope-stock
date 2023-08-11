<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getSchebTwoFactor_Security_Listener_CheckBackupCodeService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'scheb_two_factor.security.listener.check_backup_code' shared service.
     *
     * @return \Scheb\TwoFactorBundle\Security\Http\EventListener\CheckBackupCodeListener
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/scheb/2fa-bundle/Security/Http/EventListener/AbstractCheckCodeListener.php';
        include_once \dirname(__DIR__, 3).'/vendor/scheb/2fa-backup-code/Security/Http/EventListener/CheckBackupCodeListener.php';

        return $container->privates['scheb_two_factor.security.listener.check_backup_code'] = new \Scheb\TwoFactorBundle\Security\Http\EventListener\CheckBackupCodeListener(($container->privates['scheb_two_factor.provider_preparation_recorder'] ?? $container->getSchebTwoFactor_ProviderPreparationRecorderService()), ($container->privates['scheb_two_factor.default_backup_code_manager'] ?? $container->load('getSchebTwoFactor_DefaultBackupCodeManagerService')));
    }
}
