<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getServicesResetterService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'services_resetter' shared service.
     *
     * @return \Symfony\Component\HttpKernel\DependencyInjection\ServicesResetter
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/http-kernel/DependencyInjection/ServicesResetter.php';

        return $container->services['services_resetter'] = new \Symfony\Component\HttpKernel\DependencyInjection\ServicesResetter(new RewindableGenerator(function () use ($container) {
            if (isset($container->services['cache.app'])) {
                yield 'cache.app' => ($container->services['cache.app'] ?? null);
            }
            if (isset($container->services['cache.system'])) {
                yield 'cache.system' => ($container->services['cache.system'] ?? null);
            }
            if (false) {
                yield 'cache.validator' => null;
            }
            if (false) {
                yield 'cache.serializer' => null;
            }
            if (isset($container->privates['cache.annotations'])) {
                yield 'cache.annotations' => ($container->privates['cache.annotations'] ?? null);
            }
            if (false) {
                yield 'cache.property_info' => null;
            }
            if (isset($container->privates['http_client'])) {
                yield 'http_client' => ($container->privates['http_client'] ?? null);
            }
            if (isset($container->privates['mailer.message_logger_listener'])) {
                yield 'mailer.message_logger_listener' => ($container->privates['mailer.message_logger_listener'] ?? null);
            }
            if (isset($container->services['debug.stopwatch'])) {
                yield 'debug.stopwatch' => ($container->services['debug.stopwatch'] ?? null);
            }
            if (isset($container->services['event_dispatcher'])) {
                yield 'debug.event_dispatcher' => ($container->services['event_dispatcher'] ?? null);
            }
            if (isset($container->services['.container.private.security.token_storage'])) {
                yield 'security.token_storage' => ($container->services['.container.private.security.token_storage'] ?? null);
            }
            if (isset($container->privates['cache.security_expression_language'])) {
                yield 'cache.security_expression_language' => ($container->privates['cache.security_expression_language'] ?? null);
            }
            if (isset($container->services['doctrine'])) {
                yield 'doctrine' => ($container->services['doctrine'] ?? null);
            }
            if (isset($container->services['contao.listener.data_container.layout_options'])) {
                yield 'contao.listener.data_container.layout_options' => ($container->services['contao.listener.data_container.layout_options'] ?? null);
            }
            if (isset($container->privates['contao.listener.merge_http_headers'])) {
                yield 'contao.listener.merge_http_headers' => ($container->privates['contao.listener.merge_http_headers'] ?? null);
            }
            if (isset($container->privates['contao.listener.subrequest_cache'])) {
                yield 'contao.listener.subrequest_cache' => ($container->privates['contao.listener.subrequest_cache'] ?? null);
            }
            if (isset($container->services['contao.csrf.token_manager'])) {
                yield 'contao.csrf.token_manager' => ($container->services['contao.csrf.token_manager'] ?? null);
            }
            if (isset($container->privates['contao.csrf.token_storage'])) {
                yield 'contao.csrf.token_storage' => ($container->privates['contao.csrf.token_storage'] ?? null);
            }
            if (false) {
                yield 'contao.data_collector' => null;
            }
            if (isset($container->services['contao.framework'])) {
                yield 'contao.framework' => ($container->services['contao.framework'] ?? null);
            }
            if (isset($container->services['contao.image.sizes'])) {
                yield 'contao.image.sizes' => ($container->services['contao.image.sizes'] ?? null);
            }
            if (isset($container->services['contao.insert_tag.parser'])) {
                yield 'contao.insert_tag.parser' => ($container->services['contao.insert_tag.parser'] ?? null);
            }
            if (false) {
                yield 'contao.monolog.handler' => null;
            }
            if (isset($container->privates['contao.security.backend_access_voter'])) {
                yield 'contao.security.backend_access_voter' => ($container->privates['contao.security.backend_access_voter'] ?? null);
            }
            if (false) {
                yield 'contao.translation.data_collector_translator' => null;
            }
            if (isset($container->services['contao.twig.filesystem_loader'])) {
                yield 'contao.twig.filesystem_loader' => ($container->services['contao.twig.filesystem_loader'] ?? null);
            }
            if (false) {
                yield 'contao.filesystem.dbafs.files' => null;
            }
        }, function () use ($container) {
            return 0 + (int) (isset($container->services['cache.app'])) + (int) (isset($container->services['cache.system'])) + (int) (false) + (int) (false) + (int) (isset($container->privates['cache.annotations'])) + (int) (false) + (int) (isset($container->privates['http_client'])) + (int) (isset($container->privates['mailer.message_logger_listener'])) + (int) (isset($container->services['debug.stopwatch'])) + (int) (isset($container->services['event_dispatcher'])) + (int) (isset($container->services['.container.private.security.token_storage'])) + (int) (isset($container->privates['cache.security_expression_language'])) + (int) (isset($container->services['doctrine'])) + (int) (isset($container->services['contao.listener.data_container.layout_options'])) + (int) (isset($container->privates['contao.listener.merge_http_headers'])) + (int) (isset($container->privates['contao.listener.subrequest_cache'])) + (int) (isset($container->services['contao.csrf.token_manager'])) + (int) (isset($container->privates['contao.csrf.token_storage'])) + (int) (false) + (int) (isset($container->services['contao.framework'])) + (int) (isset($container->services['contao.image.sizes'])) + (int) (isset($container->services['contao.insert_tag.parser'])) + (int) (false) + (int) (isset($container->privates['contao.security.backend_access_voter'])) + (int) (false) + (int) (isset($container->services['contao.twig.filesystem_loader'])) + (int) (false);
        }), ['cache.app' => [0 => 'reset'], 'cache.system' => [0 => 'reset'], 'cache.validator' => [0 => 'reset'], 'cache.serializer' => [0 => 'reset'], 'cache.annotations' => [0 => 'reset'], 'cache.property_info' => [0 => 'reset'], 'http_client' => [0 => '?reset'], 'mailer.message_logger_listener' => [0 => 'reset'], 'debug.stopwatch' => [0 => 'reset'], 'debug.event_dispatcher' => [0 => 'reset'], 'security.token_storage' => [0 => 'disableUsageTracking', 1 => 'setToken'], 'cache.security_expression_language' => [0 => 'reset'], 'doctrine' => [0 => 'reset'], 'contao.listener.data_container.layout_options' => [0 => 'reset'], 'contao.listener.merge_http_headers' => [0 => 'reset'], 'contao.listener.subrequest_cache' => [0 => 'reset'], 'contao.csrf.token_manager' => [0 => 'reset'], 'contao.csrf.token_storage' => [0 => 'reset'], 'contao.data_collector' => [0 => 'reset'], 'contao.framework' => [0 => 'reset'], 'contao.image.sizes' => [0 => 'reset'], 'contao.insert_tag.parser' => [0 => 'reset'], 'contao.monolog.handler' => [0 => 'reset'], 'contao.security.backend_access_voter' => [0 => 'reset'], 'contao.translation.data_collector_translator' => [0 => 'reset'], 'contao.twig.filesystem_loader' => [0 => 'reset'], 'contao.filesystem.dbafs.files' => [0 => 'reset']]);
    }
}
