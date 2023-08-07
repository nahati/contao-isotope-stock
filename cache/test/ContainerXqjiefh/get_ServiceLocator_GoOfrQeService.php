<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class get_ServiceLocator_GoOfrQeService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private '.service_locator.GoOfrQe' shared service.
     *
     * @return \Symfony\Component\DependencyInjection\ServiceLocator
     */
    public static function do($container, $lazyLoad = true)
    {
        return $container->privates['.service_locator.GoOfrQe'] = new \Symfony\Component\DependencyInjection\Argument\ServiceLocator($container->getService, [
            'contao.cache.entity_tags' => ['services', 'contao.cache.entity_tags', 'getContao_Cache_EntityTagsService', true],
            'contao.csrf.token_manager' => ['services', 'contao.csrf.token_manager', 'getContao_Csrf_TokenManagerService', false],
            'contao.framework' => ['services', 'contao.framework', 'getContao_FrameworkService', false],
            'contao.routing.scope_matcher' => ['services', 'contao.routing.scope_matcher', 'getContao_Routing_ScopeMatcherService', false],
            'doctrine' => ['services', 'doctrine', 'getDoctrineService', true],
            'event_dispatcher' => ['services', 'event_dispatcher', 'getEventDispatcherService', false],
            'http_kernel' => ['services', 'http_kernel', 'getHttpKernelService', false],
            'logger' => ['privates', 'monolog.logger', 'getMonolog_LoggerService', false],
            'parameter_bag' => ['privates', 'parameter_bag', 'getParameterBagService', false],
            'request_stack' => ['services', 'request_stack', 'getRequestStackService', false],
            'router' => ['services', 'router', 'getRouterService', false],
            'security.authorization_checker' => ['services', '.container.private.security.authorization_checker', 'get_Container_Private_Security_AuthorizationCheckerService', false],
            'security.csrf.token_manager' => ['services', '.container.private.security.csrf.token_manager', 'get_Container_Private_Security_Csrf_TokenManagerService', true],
            'security.token_storage' => ['services', '.container.private.security.token_storage', 'get_Container_Private_Security_TokenStorageService', false],
            'session' => ['privates', '.session.deprecated', 'get_Session_DeprecatedService', true],
            'twig' => ['services', '.container.private.twig', 'get_Container_Private_TwigService', false],
        ], [
            'contao.cache.entity_tags' => '?',
            'contao.csrf.token_manager' => 'Contao\\CoreBundle\\Csrf\\ContaoCsrfTokenManager',
            'contao.framework' => '?',
            'contao.routing.scope_matcher' => '?',
            'doctrine' => '?',
            'event_dispatcher' => '?',
            'http_kernel' => '?',
            'logger' => '?',
            'parameter_bag' => '?',
            'request_stack' => '?',
            'router' => '?',
            'security.authorization_checker' => '?',
            'security.csrf.token_manager' => '?',
            'security.token_storage' => '?',
            'session' => '.session.deprecated',
            'twig' => '?',
        ]);
    }
}
