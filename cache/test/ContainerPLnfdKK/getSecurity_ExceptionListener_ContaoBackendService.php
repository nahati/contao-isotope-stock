<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getSecurity_ExceptionListener_ContaoBackendService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'security.exception_listener.contao_backend' shared service.
     *
     * @return \Symfony\Component\Security\Http\Firewall\ExceptionListener
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/security-http/Firewall/ExceptionListener.php';

        $a = ($container->privates['contao.security.authentication_entry_point'] ?? $container->load('getContao_Security_AuthenticationEntryPointService'));

        if (isset($container->privates['security.exception_listener.contao_backend'])) {
            return $container->privates['security.exception_listener.contao_backend'];
        }

        return $container->privates['security.exception_listener.contao_backend'] = new \Symfony\Component\Security\Http\Firewall\ExceptionListener(($container->services['.container.private.security.token_storage'] ?? $container->get_Container_Private_Security_TokenStorageService()), ($container->services['security.authentication.trust_resolver'] ?? $container->getSecurity_Authentication_TrustResolverService()), ($container->privates['security.http_utils'] ?? $container->load('getSecurity_HttpUtilsService')), 'contao_backend', $a, NULL, NULL, ($container->privates['monolog.logger.security'] ?? $container->load('getMonolog_Logger_SecurityService')), false);
    }
}
