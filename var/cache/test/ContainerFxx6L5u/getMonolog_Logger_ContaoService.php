<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getMonolog_Logger_ContaoService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'monolog.logger.contao' shared service.
     *
     * @return \Symfony\Bridge\Monolog\Logger
     */
    public static function do($container, $lazyLoad = true)
    {
        $container->services['monolog.logger.contao'] = $instance = new \Symfony\Bridge\Monolog\Logger('contao');

        $instance->pushProcessor(($container->privates['contao.monolog.processor'] ?? $container->getContao_Monolog_ProcessorService()));
        $instance->pushHandler(($container->privates['monolog.handler.null_internal'] ?? ($container->privates['monolog.handler.null_internal'] = new \Monolog\Handler\NullHandler())));

        return $instance;
    }
}
