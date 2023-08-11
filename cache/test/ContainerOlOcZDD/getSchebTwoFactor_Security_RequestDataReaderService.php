<?php

namespace ContainerOlOcZDD;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getSchebTwoFactor_Security_RequestDataReaderService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'scheb_two_factor.security.request_data_reader' shared service.
     *
     * @return \Scheb\TwoFactorBundle\Security\Http\Utils\RequestDataReader
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/scheb/2fa-bundle/Security/Http/Utils/RequestDataReader.php';

        return $container->privates['scheb_two_factor.security.request_data_reader'] = new \Scheb\TwoFactorBundle\Security\Http\Utils\RequestDataReader();
    }
}
