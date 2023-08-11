<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getSchebTwoFactor_DefaultHandlerConditionService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'scheb_two_factor.default_handler_condition' shared service.
     *
     * @return \Scheb\TwoFactorBundle\Security\TwoFactor\Condition\DefaultTwoFactorCondition
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/scheb/2fa-bundle/Security/TwoFactor/Condition/TwoFactorConditionInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/scheb/2fa-bundle/Security/TwoFactor/Condition/DefaultTwoFactorCondition.php';

        return $container->privates['scheb_two_factor.default_handler_condition'] = new \Scheb\TwoFactorBundle\Security\TwoFactor\Condition\DefaultTwoFactorCondition();
    }
}
