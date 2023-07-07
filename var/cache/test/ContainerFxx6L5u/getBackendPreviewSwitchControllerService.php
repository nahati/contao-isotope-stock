<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getBackendPreviewSwitchControllerService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'Contao\CoreBundle\Controller\BackendPreviewSwitchController' shared service.
     *
     * @return \Contao\CoreBundle\Controller\BackendPreviewSwitchController
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Controller/BackendPreviewSwitchController.php';

        return $container->services['Contao\\CoreBundle\\Controller\\BackendPreviewSwitchController'] = new \Contao\CoreBundle\Controller\BackendPreviewSwitchController(($container->services['contao.security.frontend_preview_authenticator'] ?? $container->load('getContao_Security_FrontendPreviewAuthenticatorService')), ($container->services['contao.security.token_checker'] ?? $container->getContao_Security_TokenCheckerService()), ($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()), ($container->services['security.helper'] ?? $container->getSecurity_HelperService()), ($container->services['.container.private.twig'] ?? $container->get_Container_Private_TwigService()), ($container->services['router'] ?? $container->getRouterService()), ($container->services['contao.csrf.token_manager'] ?? $container->getContao_Csrf_TokenManagerService()), ($container->services['translator'] ?? $container->getTranslatorService()), [], '');
    }
}
