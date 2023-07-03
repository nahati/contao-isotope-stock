<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_String_SimpleTokenParserService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.string.simple_token_parser' shared service.
     *
     * @return \Contao\CoreBundle\String\SimpleTokenParser
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/String/SimpleTokenParser.php';

        $container->services['contao.string.simple_token_parser'] = $instance = new \Contao\CoreBundle\String\SimpleTokenParser(($container->privates['contao.string.simple_token_expression_language'] ?? $container->load('getContao_String_SimpleTokenExpressionLanguageService')));

        $instance->setLogger(($container->privates['monolog.logger'] ?? $container->getMonolog_LoggerService()));

        return $instance;
    }
}
