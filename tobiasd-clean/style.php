<?php
use Friendica\Core\Config;
use Friendica\Core\PConfig;
if (file_exists("$THEMEPATH/style.css")){
    echo file_get_contents("$THEMEPATH/style.css");
}
$s_bgimage = Config::get('clean','background-image');
$s_bgcolor = Config::get('clean','background-color');
$s_fontsize = Config::get('clean','fontsize');
$s_colorset = Config::get('clean','colorset');
$s_showaccesskeys = Config::get('clean','showaccesskeys');
$uid = get_theme_uid();
$bgimage = PConfig::get( $uid, 'clean', 'background-image');
$bgcolor = PConfig::get( $uid, 'clean', 'background-color');
$fontsize = PConfig::get( $uid, 'clean', 'fontsize');
$colorset = PConfig::get( $uid, 'clean', 'colorset');
$showaccesskeys = PConfig::get( $uid, 'clean', 'showaccesskeys');
if (!x($bgimage)) 
    $bgimage = $s_bgimage;
if (!x($bgcolor)) 
    $bgcolor = $s_bgcolor;
if (!x($fontsize)) 
    $fontsize = $s_fontsize;
if (!x($colorset)) 
    $colorset = $s_colorset;
if (!$colorset)
    $colorset = Config::get('clean', 'colorset');          // user setting have priority, then node settings
if (!$showaccesskeys)
    $showaccesskeys = $s_showaccesskeys;
if ($colorset) {
    if ($colorset == 'friendica')
        echo file_get_contents("$THEMEPATH/presets/friendica.css");
    if ($colorset == 'dark')
        echo file_get_contents("$THEMEPATH/presets/dark.css");
    if ($colorset == 'zenburn')
        echo file_get_contents("$THEMEPATH/presets/zenburn.css");
    if ($colorset == 'black')
        echo file_get_contents("$THEMEPATH/presets/black.css");
    if ($colorset == 'pink')
        echo file_get_contents("$THEMEPATH/presets/pink.css");
    if ($colorset == 'lime')
        echo file_get_contents("$THEMEPATH/presets/lime.css");
    if ($colorset == 'geo')
        echo file_get_contents("$THEMEPATH/presets/geo_bootstrap.min.css");
}
if ($fontsize) {
    echo "body, blockquote, .wall-item-container .wall-item-content, .wall-item-content blockquote, .type-link blockquote, .type-video blockquote { font-size: ".$fontsize."pt; line-height: ".$fontsize*1.5."pt; }\r\n";
}
if ($bgcolor) {
    echo "body { background-color: #".$bgcolor."; }\r\n";
    echo "#content, aside { background-color: #".$bgcolor."; border-radius: 7px; }\r\n";
}
if ($bgimage) {
    echo "body { background: url('$bgimage') no-repeat center center fixed; background-size: cover; }";
    echo "#content, aside { background-color: #".$bgcolor."; opacity: 0.9; border-radius: 7px; padding-top: 3px; }\r\n";
}
if ($showaccesskeys) {
    echo "*[accesskey]:after {content:' [' attr(accesskey) ']'}";
}
echo "/* end style.php */\n\r";
?>
