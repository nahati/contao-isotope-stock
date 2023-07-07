<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Command_ResizeImagesService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.command.resize_images' shared service.
     *
     * @return \Contao\CoreBundle\Command\ResizeImagesCommand
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/symfony/console/Command/Command.php';
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/Command/ResizeImagesCommand.php';

        $container->privates['contao.command.resize_images'] = $instance = new \Contao\CoreBundle\Command\ResizeImagesCommand(($container->services['contao.image.factory'] ?? $container->load('getContao_Image_FactoryService')), ($container->services['contao.image.legacy_resizer'] ?? $container->load('getContao_Image_LegacyResizerService')), (\dirname(__DIR__, 3).'/assets/images'), ($container->privates['contao.image.deferred_image_storage'] ?? $container->load('getContao_Image_DeferredImageStorageService')), ($container->services['.container.private.filesystem'] ?? ($container->services['.container.private.filesystem'] = new \Symfony\Component\Filesystem\Filesystem())));

        $instance->setName('contao:resize-images');
        $instance->setDescription('Resizes deferred images that have not been processed yet.');

        return $instance;
    }
}
