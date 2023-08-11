<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_SlugService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.slug' shared service.
     *
     * @return \Contao\CoreBundle\Slug\Slug
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Slug/Slug.php';
        include_once \dirname(__DIR__, 3).'/vendor/ausi/slug-generator/src/SlugGeneratorInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/ausi/slug-generator/src/SlugGenerator.php';

        return $container->services['contao.slug'] = new \Contao\CoreBundle\Slug\Slug(($container->services['contao.slug.generator'] ?? ($container->services['contao.slug.generator'] = new \Ausi\SlugGenerator\SlugGenerator(['validChars' => '0-9a-z']))), ($container->services['contao.framework'] ?? $container->getContao_FrameworkService()));
    }
}
