<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Fragment_Contao_ContentElement_MarkdownService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.fragment._contao.content_element.markdown' shared service.
     *
     * @return \Contao\CoreBundle\Controller\ContentElement\MarkdownController
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Fragment/FragmentOptionsAwareInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Controller/AbstractFragmentController.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Controller/ContentElement/AbstractContentElementController.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Controller/ContentElement/MarkdownController.php';

        $container->services['contao.fragment._contao.content_element.markdown'] = $instance = new \Contao\CoreBundle\Controller\ContentElement\MarkdownController();

        $a = $container->load('get_ServiceLocator_LmV1W6h_Contao_Fragment_Contao_ContentElement_MarkdownService');

        $instance->setContainer($a);
        $instance->setFragmentOptions(['category' => 'texts', 'type' => 'markdown', 'debugController' => 'Contao\\CoreBundle\\Controller\\ContentElement\\MarkdownController', 'template' => 'ce_markdown']);
        $instance->setContainer($a);

        return $instance;
    }
}
