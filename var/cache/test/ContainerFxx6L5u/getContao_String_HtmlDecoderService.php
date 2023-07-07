<?php

namespace ContainerFxx6L5u;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getContao_String_HtmlDecoderService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the public 'contao.string.html_decoder' shared service.
     *
     * @return \Contao\CoreBundle\String\HtmlDecoder
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 4).'/vendor/contao/core-bundle/src/String/HtmlDecoder.php';

        return $container->services['contao.string.html_decoder'] = new \Contao\CoreBundle\String\HtmlDecoder(($container->services['contao.insert_tag.parser'] ?? $container->load('getContao_InsertTag_ParserService')));
    }
}
