<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getSchebTwoFactor_Security_Access_AuthenticatedVoterService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'scheb_two_factor.security.access.authenticated_voter' shared service.
     *
     * @return \Scheb\TwoFactorBundle\Security\Authorization\Voter\TwoFactorInProgressVoter
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/scheb/2fa-bundle/Security/Authorization/Voter/TwoFactorInProgressVoter.php';

        return $container->privates['scheb_two_factor.security.access.authenticated_voter'] = new \Scheb\TwoFactorBundle\Security\Authorization\Voter\TwoFactorInProgressVoter();
    }
}
