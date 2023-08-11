<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getTranslation_ProviderCollectionFactoryService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'translation.provider_collection_factory' shared service.
     *
     * @return \Symfony\Component\Translation\Provider\TranslationProviderCollectionFactory
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/translation/Provider/TranslationProviderCollectionFactory.php';

        return $container->privates['translation.provider_collection_factory'] = new \Symfony\Component\Translation\Provider\TranslationProviderCollectionFactory(new RewindableGenerator(function () use ($container) {
            yield 0 => ($container->privates['translation.provider_factory.null'] ?? ($container->privates['translation.provider_factory.null'] = new \Symfony\Component\Translation\Provider\NullProviderFactory()));
        }, 1), []);
    }
}
