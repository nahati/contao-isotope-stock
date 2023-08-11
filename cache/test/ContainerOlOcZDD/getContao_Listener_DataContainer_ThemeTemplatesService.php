<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Listener_DataContainer_ThemeTemplatesService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.listener.data_container.theme_templates' shared service.
     *
     * @return \Contao\CoreBundle\EventListener\DataContainer\ThemeTemplatesListener
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/DataContainer/ThemeTemplatesListener.php';

        return $container->services['contao.listener.data_container.theme_templates'] = new \Contao\CoreBundle\EventListener\DataContainer\ThemeTemplatesListener(($container->privates['contao.twig.filesystem_loader_warmer'] ?? $container->getContao_Twig_FilesystemLoaderWarmerService()), ($container->privates['contao.twig.loader.theme_namespace'] ?? ($container->privates['contao.twig.loader.theme_namespace'] = new \Contao\CoreBundle\Twig\Loader\ThemeNamespace())), ($container->services['translator'] ?? $container->getTranslatorService()));
    }
}
