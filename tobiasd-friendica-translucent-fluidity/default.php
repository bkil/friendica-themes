<!DOCTYPE html >
<html>
<head>
  <title><?php if(x($page,'title')) echo $page['title'] ?></title>
  <script>var baseurl="<?php echo $a->get_baseurl() ?>";</script>
  <?php if(x($page,'htmlhead')) echo $page['htmlhead'] ?>
</head>
<body>
    <div id="page">
        <?php 
            if(x($page,'nav')){
                echo   str_replace("~config.sitename~",get_config('config','sitename'),
                       str_replace("~system.banner~",get_config('system','banner'),
                       $page['nav']
                ));};
        ?>
        
        <div id="main">
            <div id="primary">
                <div id="content" role="main"><div id="innercontent">
                    <?php 
                        if(x($page,'content')) echo $page['content'];
                    ?>
                </div></div>
            </div>
            <div id="secondary" class="widget-area" role="complementary">
                <?php if(x($page,'aside')) echo $page['aside']; ?>
                <?php if(x($page,'right_aside')) echo $page['right_aside']; ?>
            </div>
        </div>
        <footer id="colophon" role="contentinfo">
            <div id="site-generator">
                <?php if(x($page,'footer')) echo $page['footer']; ?>
            </div>                        
        </footer>
    </div>
</body>
</html>

