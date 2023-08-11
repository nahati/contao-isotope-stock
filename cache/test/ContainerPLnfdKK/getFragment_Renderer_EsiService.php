<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getFragment_Renderer_EsiService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'fragment.renderer.esi' shared service.
     *
     * @return \Symfony\Component\HttpKernel\Fragment\EsiFragmentRenderer
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/http-kernel/Fragment/FragmentRendererInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/http-kernel/Fragment/RoutableFragmentRenderer.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/http-kernel/Fragment/AbstractSurrogateFragmentRenderer.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/http-kernel/Fragment/EsiFragmentRenderer.php';

        $a = ($container->privates['fragment.renderer.inline'] ?? $container->load('getFragment_Renderer_InlineService'));

        if (isset($container->privates['fragment.renderer.esi'])) {
            return $container->privates['fragment.renderer.esi'];
        }

        $container->privates['fragment.renderer.esi'] = $instance = new \Symfony\Component\HttpKernel\Fragment\EsiFragmentRenderer(($container->privates['esi'] ?? ($container->privates['esi'] = new \Symfony\Component\HttpKernel\HttpCache\Esi())), $a, ($container->services['uri_signer'] ?? ($container->services['uri_signer'] = new \Symfony\Component\HttpKernel\UriSigner($container->getEnv('APP_SECRET')))));

        $instance->setFragmentPath('/_fragment');

        return $instance;
    }
}
