<?php

namespace ContainerJfZHTtD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getMonolog_Logger_Contao_ConfigurationService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'monolog.logger.contao.configuration' shared service.
     *
     * @return \Contao\CoreBundle\Monolog\SystemLogger
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Monolog/SystemLogger.php';

        return $container->services['monolog.logger.contao.configuration'] = new \Contao\CoreBundle\Monolog\SystemLogger(($container->privates['contao._logger.monolog.logger.contao.configuration.inner'] ?? $container->load('getContao_Logger_Monolog_Logger_Contao_Configuration_InnerService')), 'CONFIGURATION');
    }
}
