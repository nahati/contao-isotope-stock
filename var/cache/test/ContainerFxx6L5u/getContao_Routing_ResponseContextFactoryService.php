<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Routing_ResponseContextFactoryService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.routing.response_context_factory' shared service.
     *
     * @return \Contao\CoreBundle\Routing\ResponseContext\CoreResponseContextFactory
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Routing/ResponseContext/CoreResponseContextFactory.php';

        return $container->services['contao.routing.response_context_factory'] = new \Contao\CoreBundle\Routing\ResponseContext\CoreResponseContextFactory(($container->services['contao.routing.response_context_accessor'] ?? $container->load('getContao_Routing_ResponseContextAccessorService')), ($container->services['event_dispatcher'] ?? $container->getEventDispatcherService()), ($container->services['contao.security.token_checker'] ?? $container->getContao_Security_TokenCheckerService()), ($container->services['contao.string.html_decoder'] ?? $container->load('getContao_String_HtmlDecoderService')), ($container->services['request_stack'] ?? ($container->services['request_stack'] = new \Symfony\Component\HttpFoundation\RequestStack())), ($container->services['contao.insert_tag.parser'] ?? $container->load('getContao_InsertTag_ParserService')));
    }
}