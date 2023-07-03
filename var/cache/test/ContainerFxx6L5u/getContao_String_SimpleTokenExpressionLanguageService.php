<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_String_SimpleTokenExpressionLanguageService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'contao.string.simple_token_expression_language' shared service.
     *
     * @return \Contao\CoreBundle\String\SimpleTokenExpressionLanguage
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/symfony/expression-language/ExpressionLanguage.php';
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/String/SimpleTokenExpressionLanguage.php';

        return $container->privates['contao.string.simple_token_expression_language'] = new \Contao\CoreBundle\String\SimpleTokenExpressionLanguage(NULL, new RewindableGenerator(function () use ($container) {
            return new \EmptyIterator();
        }, 0));
    }
}
