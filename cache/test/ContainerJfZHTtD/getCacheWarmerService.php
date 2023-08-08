<?php

namespace ContainerJfZHTtD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getCacheWarmerService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'cache_warmer' shared service.
     *
     * @return \Symfony\Component\HttpKernel\CacheWarmer\CacheWarmerAggregate
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/http-kernel/CacheWarmer/CacheWarmerAggregate.php';

        return $container->services['cache_warmer'] = new \Symfony\Component\HttpKernel\CacheWarmer\CacheWarmerAggregate(new RewindableGenerator(function () use ($container) {
            yield 0 => ($container->privates['config_builder.warmer'] ?? $container->load('getConfigBuilder_WarmerService'));
            yield 1 => ($container->privates['translation.warmer'] ?? $container->load('getTranslation_WarmerService'));
            yield 2 => ($container->privates['router.cache_warmer'] ?? $container->load('getRouter_CacheWarmerService'));
            yield 3 => ($container->privates['annotations.cache_warmer'] ?? $container->load('getAnnotations_CacheWarmerService'));
            yield 4 => ($container->privates['twig.template_cache_warmer'] ?? $container->load('getTwig_TemplateCacheWarmerService'));
            yield 5 => ($container->services['contao.cache.warmer'] ?? $container->load('getContao_Cache_WarmerService'));
            yield 6 => ($container->privates['contao.doctrine.orm.fail_tolerant_proxy_cache_warmer'] ?? $container->load('getContao_Doctrine_Orm_FailTolerantProxyCacheWarmerService'));
            yield 7 => ($container->privates['contao.twig.filesystem_loader_warmer'] ?? $container->getContao_Twig_FilesystemLoaderWarmerService());
        }, 8), true, ($container->targetDir.''.'/Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainerDeprecations.log'));
    }
}
