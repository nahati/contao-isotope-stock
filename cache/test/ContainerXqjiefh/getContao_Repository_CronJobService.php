<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_Repository_CronJobService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.repository.cron_job' shared service.
     *
     * @return \Contao\CoreBundle\Repository\CronJobRepository
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/doctrine/persistence/src/Persistence/ObjectRepository.php';
        include_once \dirname(__DIR__, 3).'/vendor/doctrine/collections/lib/Doctrine/Common/Collections/Selectable.php';
        include_once \dirname(__DIR__, 3).'/vendor/doctrine/orm/lib/Doctrine/ORM/EntityRepository.php';
        include_once \dirname(__DIR__, 3).'/vendor/doctrine/doctrine-bundle/Repository/ServiceEntityRepositoryInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/var-exporter/Internal/LazyObjectTrait.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/var-exporter/LazyGhostTrait.php';
        include_once \dirname(__DIR__, 3).'/vendor/doctrine/doctrine-bundle/Repository/LazyServiceEntityRepository.php';
        include_once \dirname(__DIR__, 3).'/vendor/doctrine/doctrine-bundle/Repository/ServiceEntityRepository.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Repository/CronJobRepository.php';

        return $container->privates['contao.repository.cron_job'] = new \Contao\CoreBundle\Repository\CronJobRepository(($container->services['doctrine'] ?? $container->load('getDoctrineService')));
    }
}
