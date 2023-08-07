<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Security_MemberGroupVoterService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.security.member_group_voter' shared service.
     *
     * @return \Contao\CoreBundle\Security\Voter\MemberGroupVoter
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/security-core/Authorization/Voter/Voter.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Security/Voter/MemberGroupVoter.php';

        return $container->privates['contao.security.member_group_voter'] = new \Contao\CoreBundle\Security\Voter\MemberGroupVoter();
    }
}
