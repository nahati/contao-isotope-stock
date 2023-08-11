<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getTwig_ErrorRenderer_HtmlService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'twig.error_renderer.html' shared service.
     *
     * @return \Symfony\Bridge\Twig\ErrorRenderer\TwigErrorRenderer
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/error-handler/ErrorRenderer/ErrorRendererInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/twig-bridge/ErrorRenderer/TwigErrorRenderer.php';

        return $container->privates['twig.error_renderer.html'] = new \Symfony\Bridge\Twig\ErrorRenderer\TwigErrorRenderer(($container->services['.container.private.twig'] ?? $container->get_Container_Private_TwigService()), ($container->privates['error_handler.error_renderer.html'] ?? $container->load('getErrorHandler_ErrorRenderer_HtmlService')), \Symfony\Bridge\Twig\ErrorRenderer\TwigErrorRenderer::isDebug(($container->services['request_stack'] ?? ($container->services['request_stack'] = new \Symfony\Component\HttpFoundation\RequestStack())), true));
    }
}
