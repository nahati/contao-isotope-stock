<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getMonolog_Logger_Contao_ErrorService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'monolog.logger.contao.error' shared service.
     *
     * @return \Contao\CoreBundle\Monolog\SystemLogger
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Monolog/SystemLogger.php';

        return $container->services['monolog.logger.contao.error'] = new \Contao\CoreBundle\Monolog\SystemLogger(($container->privates['contao._logger.monolog.logger.contao.error.inner'] ?? $container->load('getContao_Logger_Monolog_Logger_Contao_Error_InnerService')), 'ERROR');
    }
}
