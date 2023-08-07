<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Doctrine_Schema_MysqlInnodbRowSizeCalculatorService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.doctrine.schema.mysql_innodb_row_size_calculator' shared service.
     *
     * @return \Contao\CoreBundle\Doctrine\Schema\MysqlInnodbRowSizeCalculator
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Doctrine/Schema/MysqlInnodbRowSizeCalculator.php';

        return $container->privates['contao.doctrine.schema.mysql_innodb_row_size_calculator'] = new \Contao\CoreBundle\Doctrine\Schema\MysqlInnodbRowSizeCalculator(($container->services['doctrine.dbal.default_connection'] ?? $container->getDoctrine_Dbal_DefaultConnectionService()));
    }
}
