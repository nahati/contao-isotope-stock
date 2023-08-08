<?php

namespace ContainerJfZHTtD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Picker_FileProviderService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.picker.file_provider' shared service.
     *
     * @return \Contao\CoreBundle\Picker\FilePickerProvider
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Picker/PickerProviderInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Picker/AbstractPickerProvider.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Picker/AbstractInsertTagPickerProvider.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Picker/DcaPickerProviderInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Framework/FrameworkAwareInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Framework/FrameworkAwareTrait.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Picker/FilePickerProvider.php';

        $container->privates['contao.picker.file_provider'] = $instance = new \Contao\CoreBundle\Picker\FilePickerProvider(($container->services['knp_menu.factory'] ?? $container->load('getKnpMenu_FactoryService')), ($container->services['router'] ?? $container->getRouterService()), ($container->services['translator'] ?? $container->getTranslatorService()), ($container->services['security.helper'] ?? $container->getSecurity_HelperService()), 'files');

        $instance->setFramework(($container->services['contao.framework'] ?? $container->getContao_FrameworkService()));

        return $instance;
    }
}
