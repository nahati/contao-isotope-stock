<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getAnnotations_CachedReaderService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'annotations.cached_reader' shared service.
     *
     * @return \Doctrine\Common\Annotations\PsrCachedReader
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/doctrine/annotations/lib/Doctrine/Common/Annotations/Reader.php';
        include_once \dirname(__DIR__, 3).'/vendor/doctrine/annotations/lib/Doctrine/Common/Annotations/PsrCachedReader.php';

        return $container->privates['annotations.cached_reader'] = new \Doctrine\Common\Annotations\PsrCachedReader(($container->privates['annotations.reader'] ?? $container->load('getAnnotations_ReaderService')), ($container->privates['annotations.cache_adapter'] ?? $container->getAnnotations_CacheAdapterService()), true);
    }
}
