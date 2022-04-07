<?php

use Friendica\Core\Config;
use Friendica\Core\PConfig;

?>
<!DOCTYPE html >
<html itemscope itemtype="http://schema.org/Blog" lang="<?php echo $lang; ?>">
<head>
    <title><?php if(x($page,'title')) echo $page['title'] ?></title>
    <meta name="viewport" content="initial-scale=1.0">
    <script>var baseurl="<?php echo $a->get_baseurl() ?>";</script>
    <?php if(x($page,'htmlhead')) echo $page['htmlhead'] ?>
</head>
<body>
<a href="<?php echo $a->get_baseurl(). $_SERVER["REQUEST_URI"] ?>/#content" class="sr-only sr-only-focusable">Skip to main content</a>
<?php 
    if(x($page,'nav')){
	echo   str_replace("~config.sitename~",Config::get('config','sitename'),
	       str_replace("~system.banner~",Config::get('system','banner'),
	       $page['nav']
	));};
?>
<div class="row">
 <div class="col-md-offset-1 col-md-8" id="content">
    <section><?php if(x($page,'content')) echo $page['content']; ?></section>
    <div id="pause"></div> <!-- The pause/resume Ajax indicator -->
 </div>
 <div class="col-md-3"><aside>
    <?php if(x($page,'aside')) echo $page['aside']; ?>
    <?php if(x($page,'right_aside')) echo $page['right_aside']; ?>
 </aside></div>
</div>
<div class="row">
  <div class="col-md-9">
    <?php if(x($page,'footer')) echo $page['footer']; ?>
  </div>
</div>
</body>
