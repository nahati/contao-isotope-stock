<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class get_ServiceLocator_GoOfrQe_Contao_Fragment_Contao_ContentElement_TemplateService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private '.service_locator.GoOfrQe.contao.fragment._contao.content_element.template' shared service.
     *
     * @return \Symfony\Component\DependencyInjection\ServiceLocator
     */
    public static function do($container, $lazyLoad = true)
    {
        return ($container->privates['.service_locator.GoOfrQe'] ?? $container->load('get_ServiceLocator_GoOfrQeService'))->withContext('contao.fragment._contao.content_element.template', $container);
    }
}
