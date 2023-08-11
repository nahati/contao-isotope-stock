<?php

/**
 * This file has been auto-generated
 * by the Symfony Routing Component.
 */

return [
    false, // $matchHost
    [ // $staticRoutes
        '/contao' => [
            [['_route' => 'contao_backend', '_scope' => 'backend', '_token_check' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\BackendController::mainAction'], null, null, null, false, false, null],
            [['_route' => 'contao_backend_redirect', '_scope' => 'backend', '_controller' => 'Symfony\\Bundle\\FrameworkBundle\\Controller\\RedirectController::redirectAction', 'route' => 'contao_backend', 'permanent' => true], null, null, null, true, false, null],
        ],
        '/contao/login' => [[['_route' => 'contao_backend_login', '_scope' => 'backend', '_token_check' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\BackendController::loginAction'], null, null, null, false, false, null]],
        '/contao/logout' => [[['_route' => 'contao_backend_logout', '_scope' => 'backend', '_token_check' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\BackendController::logoutAction'], null, null, null, false, false, null]],
        '/contao/password' => [[['_route' => 'contao_backend_password', '_scope' => 'backend', '_token_check' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\BackendController::passwordAction'], null, null, null, false, false, null]],
        '/contao/confirm' => [[['_route' => 'contao_backend_confirm', '_scope' => 'backend', '_token_check' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\BackendController::confirmAction'], null, null, null, false, false, null]],
        '/contao/file' => [[['_route' => 'contao_backend_file', '_scope' => 'backend', '_token_check' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\BackendController::fileAction'], null, null, null, false, false, null]],
        '/contao/help' => [[['_route' => 'contao_backend_help', '_scope' => 'backend', '_token_check' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\BackendController::helpAction'], null, null, null, false, false, null]],
        '/contao/page' => [[['_route' => 'contao_backend_page', '_scope' => 'backend', '_token_check' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\BackendController::pageAction'], null, null, null, false, false, null]],
        '/contao/popup' => [[['_route' => 'contao_backend_popup', '_scope' => 'backend', '_token_check' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\BackendController::popupAction'], null, null, null, false, false, null]],
        '/contao/alerts' => [[['_route' => 'contao_backend_alerts', '_scope' => 'backend', '_token_check' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\BackendController::alertsAction'], null, null, null, false, false, null]],
        '/contao/picker' => [[['_route' => 'contao_backend_picker', '_scope' => 'backend', '_token_check' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\BackendController::pickerAction'], null, null, null, false, false, null]],
        '/contao/preview' => [[['_route' => 'contao_backend_preview', '_scope' => 'backend', '_allow_preview' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\BackendPreviewController'], null, null, null, false, false, null]],
        '/contao/preview_switch' => [[['_route' => 'contao_backend_switch', '_scope' => 'backend', '_allow_preview' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\BackendPreviewSwitchController'], null, null, null, false, false, null]],
        '/favicon.ico' => [[['_route' => 'contao_core_favicon__invoke', '_scope' => 'frontend', '_controller' => 'Contao\\CoreBundle\\Controller\\FaviconController'], null, null, null, false, false, null]],
        '/_contao/cron' => [[['_route' => 'contao_frontend_cron', '_scope' => 'frontend', '_token_check' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\FrontendController::cronAction'], null, null, null, false, false, null]],
        '/_contao/share' => [[['_route' => 'contao_frontend_share', '_scope' => 'frontend', '_token_check' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\FrontendController::shareAction'], null, null, null, false, false, null]],
        '/_contao/logout' => [[['_route' => 'contao_frontend_logout', '_scope' => 'frontend', '_token_check' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\FrontendController::logoutAction'], null, null, null, false, false, null]],
        '/_contao/check_cookies' => [[['_route' => 'contao_frontend_check_cookies', '_scope' => 'frontend', '_token_check' => false, '_controller' => 'Contao\\CoreBundle\\Controller\\FrontendController::checkCookiesAction'], null, null, null, false, false, null]],
        '/_contao/request_token_script' => [[['_route' => 'contao_frontend_request_token_script', '_scope' => 'frontend', '_token_check' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\FrontendController::requestTokenScriptAction'], null, null, null, false, false, null]],
        '/_contao/initialize' => [[['_route' => 'contao_initialize', '_controller' => 'Contao\\CoreBundle\\Controller\\InitializeController'], null, null, null, false, false, null]],
        '/robots.txt' => [[['_route' => 'contao_core_robotstxt__invoke', '_scope' => 'frontend', '_controller' => 'Contao\\CoreBundle\\Controller\\RobotsTxtController'], null, null, null, false, false, null]],
        '/sitemap.xml' => [[['_route' => 'contao_core_sitemap__invoke', '_scope' => 'frontend', '_controller' => 'Contao\\CoreBundle\\Controller\\SitemapController'], null, null, null, false, false, null]],
    ],
    [ // $regexpList
        0 => '{^(?'
                .'|/_contao/(?'
                    .'|captcha/([^/]++)(*:35)'
                    .'|preview/(\\d+)(*:55)'
                .')'
                .'|/assets/images/(.+)(*:82)'
            .')/?$}sDu',
    ],
    [ // $dynamicRoutes
        35 => [[['_route' => 'contao_frontend_captcha', '_scope' => 'frontend', '_controller' => 'Contao\\CoreBundle\\Controller\\CaptchaController'], ['_locale'], null, null, false, true, null]],
        55 => [[['_route' => 'contao_preview_link', '_scope' => 'frontend', '_allow_preview' => true, '_controller' => 'Contao\\CoreBundle\\Controller\\PreviewLinkController'], ['id'], null, null, false, true, null]],
        82 => [
            [['_route' => 'contao_images', '_controller' => 'Contao\\CoreBundle\\Controller\\ImagesController', '_bypass_maintenance' => true], ['path'], null, null, false, true, null],
            [null, null, null, null, false, false, 0],
        ],
    ],
    null, // $checkCondition
];
