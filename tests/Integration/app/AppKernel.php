<?php

declare(strict_types=1);

/*
 * This file is part of Nahati/contao-isotope-stock
 *
 * (c) Ernst Jendritzki / Nachhaltig im web
 *
 * @license LGPL-3.0-or-later
 */

namespace Nahati\ContaoIsotopeStockBundle\Tests\Integration\app;

use Contao\CoreBundle\ContaoCoreBundle;
use Doctrine\Bundle\DoctrineBundle\DoctrineBundle;
use Knp\Bundle\MenuBundle\KnpMenuBundle;
use Knp\Bundle\TimeBundle\KnpTimeBundle;
use Psr\Log\NullLogger;
use Scheb\TwoFactorBundle\SchebTwoFactorBundle;
use Symfony\Bundle\FrameworkBundle\FrameworkBundle;
use Symfony\Bundle\MonologBundle\MonologBundle;
use Symfony\Bundle\SecurityBundle\SecurityBundle;
use Symfony\Bundle\TwigBundle\TwigBundle;
use Symfony\Cmf\Bundle\RoutingBundle\CmfRoutingBundle;
use Symfony\Component\Config\Loader\LoaderInterface;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\HttpKernel\Kernel;
use Terminal42\ServiceAnnotationBundle\Terminal42ServiceAnnotationBundle;

class AppKernel extends Kernel
{
    /**
     * @return array<mixed>
     */
    public function registerBundles()
    {
        return [
            new FrameworkBundle(),
            new SecurityBundle(),
            new TwigBundle(),
            new MonologBundle(), // prevents a lot of [debug] lines in the console output (see #1927)
            new DoctrineBundle(),
            new SchebTwoFactorBundle(),
            new KnpTimeBundle(),
            new KnpMenuBundle(),
            new CmfRoutingBundle(),
            new Terminal42ServiceAnnotationBundle(),
            new ContaoCoreBundle(),
        ];
    }

    public function getProjectDir(): string
    {
        return \dirname(__DIR__, 3) . '/var';
    }

    /**
     * @deprecated since Symfony 4.2, use getProjectDir() instead
     */
    public function getRootDir(): string
    {
        return __DIR__;
    }

    public function getCacheDir(): string
    {
        return $this->getProjectDir() . '/cache/' . $this->environment;
    }

    public function getLogDir(): string
    {
        return $this->getProjectDir() . '/logs';
    }

    public function registerContainerConfiguration(LoaderInterface $loader): void
    {
        $loader->load(__DIR__ . '/config/config_' . $this->environment . '.yml');

        // Also load the Isotope config
        $loader->load(__DIR__ . '/config/config.php');
    }

    protected function build(ContainerBuilder $container): void
    {
        $container->register('monolog.logger.contao', NullLogger::class);
    }
}
