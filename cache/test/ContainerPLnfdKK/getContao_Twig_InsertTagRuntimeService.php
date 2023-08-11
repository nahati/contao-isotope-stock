<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Twig_InsertTagRuntimeService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.twig.insert_tag_runtime' shared service.
     *
     * @return \Contao\CoreBundle\Twig\Runtime\InsertTagRuntime
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/twig/twig/src/Extension/RuntimeExtensionInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Twig/Runtime/InsertTagRuntime.php';

        $a = ($container->services['contao.insert_tag.parser'] ?? $container->load('getContao_InsertTag_ParserService'));

        if (isset($container->privates['contao.twig.insert_tag_runtime'])) {
            return $container->privates['contao.twig.insert_tag_runtime'];
        }

        return $container->privates['contao.twig.insert_tag_runtime'] = new \Contao\CoreBundle\Twig\Runtime\InsertTagRuntime($a);
    }
}
