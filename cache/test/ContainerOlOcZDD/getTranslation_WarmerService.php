<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getTranslation_WarmerService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'translation.warmer' shared service.
     *
     * @return \Symfony\Bundle\FrameworkBundle\CacheWarmer\TranslationsCacheWarmer
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/framework-bundle/CacheWarmer/TranslationsCacheWarmer.php';

        return $container->privates['translation.warmer'] = new \Symfony\Bundle\FrameworkBundle\CacheWarmer\TranslationsCacheWarmer((new \Symfony\Component\DependencyInjection\Argument\ServiceLocator($container->getService, [
            'translator' => ['services', 'translator', 'getTranslatorService', false],
        ], [
            'translator' => '?',
        ]))->withContext('translation.warmer', $container));
    }
}
