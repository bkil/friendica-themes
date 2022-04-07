<?php
/*
 * Name: Clean
 * Description: A clean theme for ~friendica using bootstrag for mobile first responsive design.
 * Version: 0.5c
 * Author: Tobias Diekershoff <https://f.diekershoff.de/profile/tobias>
 */

use Friendica\App;

function clean_init(&$a) {
    $a->theme_info = array ('extends'=>'quattro', );
    $a->set_template_engine['smarty3'];
    $a->page['htmlhead'] .= '<script src="'.$a->get_baseurl().'/view/theme/quattro/js/quattro.js"></script>';
    $a->page['htmlhead'] .= '<script src="'.$a->get_baseurl().'/view/theme/quattro/tinycon.min.js"></script>';
    $a->page['htmlhead'] .= '<script src="'.$a->get_baseurl().'/view/theme/clean/bs/dist/js/bootstrap.min.js"></script>';
    // Different Colorsets overriding color things from
    // the default CSS files.
    // --> see style.php
}

