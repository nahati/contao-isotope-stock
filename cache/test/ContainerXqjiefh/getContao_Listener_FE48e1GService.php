<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Listener_FE48e1GService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.listener.fE48e1G' shared service.
     *
     * @return \Contao\CoreBundle\EventListener\GlobalsMapListener
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/GlobalsMapListener.php';

        return $container->services['contao.listener.fE48e1G'] = new \Contao\CoreBundle\EventListener\GlobalsMapListener(['TL_CTE' => ['texts' => ['markdown' => 'Contao\\ContentProxy'], 'includes' => ['template' => 'Contao\\ContentProxy']]]);
    }
}
