<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Twig_LegacyTemplateFunctionsRuntimeService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.twig.legacy_template_functions_runtime' shared service.
     *
     * @return \Contao\CoreBundle\Twig\Runtime\LegacyTemplateFunctionsRuntime
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/twig/twig/src/Extension/RuntimeExtensionInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Twig/Runtime/LegacyTemplateFunctionsRuntime.php';

        $a = ($container->services['contao.framework'] ?? $container->getContao_FrameworkService());

        if (isset($container->privates['contao.twig.legacy_template_functions_runtime'])) {
            return $container->privates['contao.twig.legacy_template_functions_runtime'];
        }

        return $container->privates['contao.twig.legacy_template_functions_runtime'] = new \Contao\CoreBundle\Twig\Runtime\LegacyTemplateFunctionsRuntime(($container->services['request_stack'] ?? ($container->services['request_stack'] = new \Symfony\Component\HttpFoundation\RequestStack())), $a, ($container->services['contao.routing.scope_matcher'] ?? $container->getContao_Routing_ScopeMatcherService()));
    }
}
