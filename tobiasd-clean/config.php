<?php

/**
 * Theme settings
 */

use Friendica\App;
use Friendica\Core\Config;
use Friendica\Core\PConfig;
use Friendica\Core\L10n;

function theme_content(&$a){
    if(!local_user()) {
        return;	
    }	

    $bgcolor        = PConfig::get( local_user(), 'clean', 'background-color');
    $bgimg          = PConfig::get( local_user(), 'clean', 'background-image');
    $colorset       = PConfig::get( local_user(), 'clean', 'colorset');
    $fontsize       = PConfig::get( local_user(), 'clean', 'fontsize');
    $showaccesskeys = PConfig::get( local_user(), 'clean', 'showaccesskeys');
    $user = true;

    return clean_form($a,$bgcolor, $bgimg, $colorset, $fontsize, $showaccesskeys, $user);
}

function theme_post(&$a){
    if(! local_user())
        return;
    
    if (isset($_POST['clean-settings-submit'])){
        PConfig::set(local_user(), 'clean', 'background-color', $_POST['clean_bgcolor']);
        PConfig::set(local_user(), 'clean', 'background-image', $_POST['clean_bgimg']);
        PConfig::set(local_user(), 'clean', 'fontsize', $_POST['clean_fontsize']);
        PConfig::set(local_user(), 'clean', 'colorset', $_POST['clean_colorset']);
        PConfig::set(local_user(), 'clean', 'showaccesskeys', intval($_POST['clean_showaccesskeys']));
    }
}


function theme_admin(&$a){
    $bgcolor = Config::get( 'clean', 'background-color');
    $bgimg = Config::get( 'clean', 'background-image');
    $colorset = Config::get( 'clean', 'colorset');
    $fontsize = Config::get( 'clean', 'fontsize');
    $showaccesskeys = Config::get( 'clean', 'showaccesskeys');
    $user = false;

    return clean_form($a,$bgcolor, $bgimg, $colorset, $fontsize, $showaccesskeys, $user);
}

function theme_admin_post(&$a){
    if (isset($_POST['clean-settings-submit'])){
        Config::set('clean', 'background-color', $_POST['clean_bgcolor']);
        Config::set('clean', 'background-image', $_POST['clean_bgimg']);
        Config::set('clean', 'fontsize', $_POST['clean_fontsize']);
        Config::set('clean', 'colorset', $_POST['clean_colorset']);
        Config::set('clean', 'showaccesskeys', intval($_POST['clean_showaccesskeys']));
    }
}


function clean_form(&$a, &$bgcolor, &$bgimg, &$colorset, &$fontsize, $showaccesskeys, $user){
    $colorset = array(
	'default'=>L10n::t('default'), 
        'friendica'=>L10n::t('Friendica'),
        'dark'=>L10n::t('Midnight'),
        'zenburn'=>L10n::t('Zenburn'),
        'black'=>L10n::t('Bootstrap'),
        'pink'=>L10n::t('Shades of Pink'),
        'lime'=>L10n::t('Lime and Orange'),
        'geo'=>L10n::t('GeoCities Retro'),
    );
    
    $fs = array (
        "10"=>"10pt",
        "11"=>"11pt",
	"12"=>"12pt",
	"13"=>"13pt",
        "14"=>"14pt",
        "16"=>"16pt",
        "18"=>"18pt",
    );
    //$bgimg = PConfig::get(local_user(),'clean','background-image');
    //$bgcolor = PConfig::get(local_user(),'clean', 'background-color');
    if ($user) {
        $color = PConfig::get(local_user(), 'clean', 'colorset');
    } else {
        $color = Config::get( 'clean', 'colorset');
    }
    //$fs = PConfig::get( local_user(), 'clean', 'fontsize');
    $t = get_markup_template("theme_settings.tpl" );
    $o .= replace_macros($t, array(
        '$submit' => L10n::t('Submit'),
        '$baseurl' => $a->get_baseurl(),
        '$title' => L10n::t("Theme settings"),
        '$bgimg' => array(
            'clean_bgimg', 
            L10n::t('Background Image'), 
            $bgimg, 
            L10n::t('The URL to a picture (e.g. from your photo album) that should be used as background image.'),
            ''
        ),
        '$bgcolor' => array(
            'clean_bgcolor', 
            L10n::t('Background Color'), 
            $bgcolor, 
            L10n::t('HEX value for the background color. Don\'t include the #'),
            ''
        ),
        '$colorset' => array(
            'clean_colorset', 
            L10n::t('Color scheme'), 
            $color, 
            '', 
            $colorset
        ),
        '$fontsize' => array(
            'clean_fontsize', 
            L10n::t('font size'), 
            $fontsize, 
            L10n::t('base font size for your interface'), 
            $fs
        ),
        '$showaccesskeys' => array(
            'clean_showaccesskeys', 
            L10n::t('Display Accesskeys'), 
            intval($showaccesskeys), 
            L10n::t('Diaplay the access keys assigned to some menu element in the web interface.')
        ),
    ));
    return $o;
}
