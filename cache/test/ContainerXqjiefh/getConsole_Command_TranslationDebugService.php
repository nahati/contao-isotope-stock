<?php

namespace ContainerXqjiefh;

use Symfony\Component\DependencyInjection\Argument\RewindableGenerator;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;

/**
 * @internal This class has been auto-generated by the Symfony Dependency Injection Component.
 */
class getConsole_Command_TranslationDebugService extends Nahati_ContaoIsotopeStockBundle_Tests_Integration_app_AppKernelTestDebugContainer
{
    /**
     * Gets the private 'console.command.translation_debug' shared service.
     *
     * @return \Symfony\Bundle\FrameworkBundle\Command\TranslationDebugCommand
     */
    public static function do($container, $lazyLoad = true)
    {
        include_once \dirname(__DIR__, 3).'/vendor/symfony/console/Command/Command.php';
        include_once \dirname(__DIR__, 3).'/vendor/symfony/framework-bundle/Command/TranslationDebugCommand.php';

        $container->privates['console.command.translation_debug'] = $instance = new \Symfony\Bundle\FrameworkBundle\Command\TranslationDebugCommand(($container->services['translator'] ?? $container->getTranslatorService()), ($container->privates['translation.reader'] ?? $container->load('getTranslation_ReaderService')), ($container->privates['translation.extractor'] ?? $container->load('getTranslation_ExtractorService')), (\dirname(__DIR__, 3).'/translations'), (\dirname(__DIR__, 3).'/templates'), [0 => (\dirname(__DIR__, 3).'/vendor/symfony/security-core/Resources/translations')], [0 => (\dirname(__DIR__, 3).'/vendor/knplabs/knp-menu/src/Knp/Menu/Resources/views'), 1 => (\dirname(__DIR__, 3).'/vendor/symfony/twig-bridge/Resources/views/Email'), 2 => (\dirname(__DIR__, 3).'/vendor/symfony/http-kernel/EventListener/LocaleAwareListener.php'), 3 => (\dirname(__DIR__, 3).'/vendor/symfony/framework-bundle/Command/TranslationDebugCommand.php'), 4 => (\dirname(__DIR__, 3).'/vendor/symfony/framework-bundle/CacheWarmer/TranslationsCacheWarmer.php'), 5 => (\dirname(__DIR__, 3).'/vendor/symfony/twig-bridge/Extension/TranslationExtension.php'), 6 => (\dirname(__DIR__, 3).'/vendor/knplabs/knp-time-bundle/src/DateTimeFormatter.php'), 7 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Controller/BackendCsvImportController.php'), 8 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Controller/BackendPreviewSwitchController.php'), 9 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/BackendLocaleListener.php'), 10 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/BackendRebuildCacheMessageListener.php'), 11 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/DataContainer/ContentCompositionListener.php'), 12 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/DataContainer/DisableAppConfiguredSettingsListener.php'), 13 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/DataContainer/DisableCanonicalFieldsListener.php'), 14 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/DataContainer/MemberGroupsListener.php'), 15 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/DataContainer/PageUrlListener.php'), 16 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/DataContainer/PreviewLinkListener.php'), 17 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/DataContainer/ThemeTemplatesListener.php'), 18 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/DataContainer/Undo/JumpToParentButtonListener.php'), 19 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/DataContainer/ValidateCustomRgxpListener.php'), 20 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/InsertTags/TranslationListener.php'), 21 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/LocaleSubscriber.php'), 22 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/Menu/BackendMenuListener.php'), 23 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/Menu/BackendLogoutListener.php'), 24 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/Menu/BackendPreviewListener.php'), 25 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/Widget/CustomRgxpListener.php'), 26 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/Widget/HttpUrlListener.php'), 27 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/EventListener/Widget/RootPageDependentSelectListener.php'), 28 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Migration/Version404/Version447Update.php'), 29 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Crawl/Escargot/Subscriber/BrokenLinkCheckerSubscriber.php'), 30 => (\dirname(__DIR__, 3).'/vendor/terminal42/escargot/src/EscargotAwareTrait.php'), 31 => (\dirname(__DIR__, 3).'/vendor/psr/log/src/LoggerAwareTrait.php'), 32 => (\dirname(__DIR__, 3).'/vendor/terminal42/escargot/src/SubscriberLoggerTrait.php'), 33 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Image/ImageSizes.php'), 34 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Intl/Countries.php'), 35 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Intl/Locales.php'), 36 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Mailer/AvailableTransports.php'), 37 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Picker/ArticlePickerProvider.php'), 38 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Picker/FilePickerProvider.php'), 39 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Framework/FrameworkAwareTrait.php'), 40 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Picker/PagePickerProvider.php'), 41 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Picker/TablePickerProvider.php'), 42 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Slug/ValidCharacters.php'), 43 => (\dirname(__DIR__, 3).'/vendor/contao/core-bundle/src/Twig/Finder/FinderFactory.php')], []);

        $instance->setName('debug:translation');
        $instance->setDescription('Display translation messages information');

        return $instance;
    }
}
