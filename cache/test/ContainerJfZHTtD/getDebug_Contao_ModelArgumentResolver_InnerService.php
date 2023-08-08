<?php

namespace ContainerJfZHTtD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getDebug_Contao_ModelArgumentResolver_InnerService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'debug.contao.model_argument_resolver.inner' shared service.
     *
     * @return \Contao\CoreBundle\HttpKernel\ModelArgumentResolver
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/http-kernel/Controller/ArgumentValueResolverInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/HttpKernel/ModelArgumentResolver.php';

        $a = ($container->services['contao.framework'] ?? $container->getContao_FrameworkService());

        if (isset($container->privates['debug.contao.model_argument_resolver.inner'])) {
            return $container->privates['debug.contao.model_argument_resolver.inner'];
        }

        return $container->privates['debug.contao.model_argument_resolver.inner'] = new \Contao\CoreBundle\HttpKernel\ModelArgumentResolver($a, ($container->services['contao.routing.scope_matcher'] ?? $container->getContao_Routing_ScopeMatcherService()));
    }
}
