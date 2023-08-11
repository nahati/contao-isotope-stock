<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Fragment_Contao_FrontendModule_TemplateService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.fragment._contao.frontend_module.template' shared service.
     *
     * @return \Contao\CoreBundle\Controller\FrontendModule\TemplateController
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Fragment/FragmentOptionsAwareInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Controller/AbstractFragmentController.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Controller/FrontendModule/AbstractFrontendModuleController.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Controller/FrontendModule/TemplateController.php';

        $container->services['contao.fragment._contao.frontend_module.template'] = $instance = new \Contao\CoreBundle\Controller\FrontendModule\TemplateController();

        $a = $container->load('get_ServiceLocator__A7R9no_Contao_Fragment_Contao_FrontendModule_TemplateService');

        $instance->setContainer($a);
        $instance->setFragmentOptions(['category' => 'miscellaneous', 'type' => 'template', 'debugController' => 'Contao\\CoreBundle\\Controller\\FrontendModule\\TemplateController', 'template' => 'mod_template']);
        $instance->setContainer($a);

        return $instance;
    }
}
