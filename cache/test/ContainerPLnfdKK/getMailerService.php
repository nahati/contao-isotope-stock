<?php

namespace ContainerPLnfdKK;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getMailerService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'mailer' shared service.
     *
     * @return \Contao\CoreBundle\Mailer\ContaoMailer
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/mailer/MailerInterface.php';
        include_once \dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Mailer/ContaoMailer.php';

        return $container->services['mailer'] = new \Contao\CoreBundle\Mailer\ContaoMailer(($container->privates['contao.mailer.inner'] ?? $container->load('getContao_Mailer_InnerService')), ($container->services['contao.mailer.available_transports'] ?? $container->load('getContao_Mailer_AvailableTransportsService')), ($container->services['request_stack'] ?? ($container->services['request_stack'] = new \Symfony\Component\HttpFoundation\RequestStack())));
    }
}
