<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Image_FallbackPreviewProviderService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.image.fallback_preview_provider' shared service.
     *
     * @return \Contao\CoreBundle\Image\Preview\FallbackPreviewProvider
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Image/Preview/PreviewProviderInterface.php';
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Image/Preview/FallbackPreviewProvider.php';

        return $container->privates['contao.image.fallback_preview_provider'] = new \Contao\CoreBundle\Image\Preview\FallbackPreviewProvider();
    }
}
