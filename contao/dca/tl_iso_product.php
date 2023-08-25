<?php

declare(strict_types=1);

/*
 * This file is part of Nahati/contao-isotope-stock
 *
 * (c) Ernst Jendritzki / Nachhaltig im web
 *
 * @license LGPL-3.0-or-later
 */

$GLOBALS['TL_DCA']['tl_iso_product']['fields']['quantity'] = [
    'label' => &$GLOBALS['TL_LANG']['tl_iso_product']['quantity'],
    'filter' => true,
    'sorting' => true,
    'inputType' => 'text',
    'eval' => ['mandatory' => false, 'doNotShow' => false, 'tl_class' => 'w50'],
    'attributes' => ['legend' => 'general_legend', 'multilingual' => false, 'fe_sorting' => true],
    'sql' => "varchar(255) default ''",
];

$GLOBALS['TL_DCA']['tl_iso_product']['fields']['inventory_status'] = [
    'label' => &$GLOBALS['TL_LANG']['tl_iso_product']['inventory_status'],
    'reference' => &$GLOBALS['TL_LANG']['MSC'],
    'filter' => true,
    'search' => true,
    'inputType' => 'radio',
    'options' => ['1', '2', '3', '4'],
    'eval' => ['feEditable' => true, 'feViewable' => true, 'tl_class' => 'w50'],
    'attributes' => ['legend' => 'general_legend', 'fe_filter' => true, 'fe_search' => true, 'fe_sorting' => true],
    'sql' => "char(1) default '2'",
];

$GLOBALS['TL_DCA']['tl_iso_product']['fields']['minQuantityPerOrder'] = [
    'label' => &$GLOBALS['TL_LANG']['tl_iso_product']['minQuantityPerOrder'],
    'filter' => true,
    'sorting' => true,
    'inputType' => 'text',
    'eval' => ['mandatory' => false, 'doNotShow' => false, 'tl_class' => 'w50'],
    'attributes' => ['legend' => 'general_legend', 'multilingual' => false, 'fe_sorting' => true],
    'sql' => "varchar(255) default ''",
];

$GLOBALS['TL_DCA']['tl_iso_product']['fields']['maxQuantityPerOrder'] = [
    'label' => &$GLOBALS['TL_LANG']['tl_iso_product']['maxQuantityPerOrder'],
    'filter' => true,
    'sorting' => true,
    'inputType' => 'text',
    'eval' => ['mandatory' => false, 'doNotShow' => false, 'tl_class' => 'w50'],
    'attributes' => ['legend' => 'general_legend', 'multilingual' => false, 'fe_sorting' => true],
    'sql' => "varchar(255) default ''",
];