<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Picker_PageProviderService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.picker.page_provider' shared service.
     *
     * @return \Contao\CoreBundle\Picker\PagePickerProvider
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Picker/PickerProviderInterface.php';
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Picker/AbstractPickerProvider.php';
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Picker/AbstractInsertTagPickerProvider.php';
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Picker/DcaPickerProviderInterface.php';
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Picker/PagePickerProvider.php';

        return $container->privates['contao.picker.page_provider'] = new \Contao\CoreBundle\Picker\PagePickerProvider(($container->services['knp_menu.factory'] ?? $container->load('getKnpMenu_FactoryService')), ($container->services['router'] ?? $container->getRouterService()), ($container->services['translator'] ?? $container->getTranslatorService()), ($container->services['security.helper'] ?? $container->getSecurity_HelperService()));
    }
}
