<?php

namespace ContainerJfZHTtD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getPreviewLinkControllerService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'Contao\CoreBundle\Controller\PreviewLinkController' shared service.
     *
     * @return \Contao\CoreBundle\Controller\PreviewLinkController
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Controller/PreviewLinkController.php';

        return $container->services['Contao\\CoreBundle\\Controller\\PreviewLinkController'] = new \Contao\CoreBundle\Controller\PreviewLinkController(($container->services['contao.security.frontend_preview_authenticator'] ?? $container->load('getContao_Security_FrontendPreviewAuthenticatorService')), ($container->services['uri_signer'] ?? ($container->services['uri_signer'] = new \Symfony\Component\HttpKernel\UriSigner($container->getEnv('APP_SECRET')))), ($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()));
    }
}
