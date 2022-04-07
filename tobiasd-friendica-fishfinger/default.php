<!DOCTYPE html >
<html>
<head>
    <title><?php if(x($page,'title')) echo $page['title'] ?></title>
    <script>var baseurl="<?php echo $a->get_baseurl() ?>";</script>
    <?php if(x($page,'htmlhead')) echo $page['htmlhead'] ?>
</head>
<body>
    <header><h1>
        <?php if(x($page,'title')) echo $page['title'] ?>
    </h1></header>
        
    <div id="main">
        <div id="primary">
            <div id="content" role="main">
                <?php if(x($page,'content')) echo $page['content']; ?>
            </div>
        </div>
        <div id="secondary"class="widget-area" role="complementary">
            <?php if(x($page,'aside')) echo $page['aside']; ?>
            <?php if(x($page,'right_aside')) echo $page['right_aside']; ?>
        </div>
    </div>
    
    <footer>
        <div id="site-generator">
            <?php if(x($page,'footer')) echo $page['footer']; ?>
        </div>                        
        <div id="f-logo">
            <a href="http://friendica.com"><img src="images/friendica-32.png" title="~friendica - The Internet is Our Social Network" alt="~friendica logo"></a>
        </div>
    </footer>
        <?php 
            if(x($page,'nav')){
                echo   str_replace("~config.sitename~",get_config('config','sitename'),
                       str_replace("~system.banner~",get_config('system','banner'),
                       $page['nav']
                ));};
        ?>
</body>
</html>

