<html class="js" lang="ru">
<head>
	<meta charset="utf-8" />
    <meta name="format-detection" content="telephone=no">
    <meta name="robots" content="all">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta property="og:title" content="Hex-Craft">
	<meta property="og:image" content="/uploads/fotos/LOGO_ICON.png">
	<meta property="og:description" content="Комплексный майнкрафт проект. Classic, Hi-Tech, Magic.">
	<meta property="og:url" content="https://hex-craft.ru/">
	{headers}
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style_main_min.css?=v3">
	<!-- <link rel="stylesheet" href="/css/snow.css"> -->
	<script>
		function applyTheme(theme) {
			document.body.classList.remove("theme-light", "theme-dark");
			document.body.classList.add(theme);
		}
		document.addEventListener("DOMContentLoaded", () => {
			const savedTheme = localStorage.getItem("theme") || "auto";
			applyTheme(savedTheme);
			for (const optionElement of document.querySelectorAll("#theme option")) {
				optionElement.selected = savedTheme === optionElement.value;
			}
		});
	</script>
	<link rel="shortcut icon" href="/icons/favicon.svg" type="image/x-icon">
	<link rel="icon" href="/icons/favicon.svg" type="image/x-icon">
	<link rel="apple-touch-icon" href="/icons/favicon.svg">
	<!-- Yandex.Metrika counter -->
	<script>
	   (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
	   m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
	   (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");
	   ym(67841206, "init", {
			clickmap:true,
			trackLinks:true,
			accurateTrackBounce:true
	   });
	</script>
	<noscript><div><img src="https://mc.yandex.ru/watch/67841206" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
	<!-- /Yandex.Metrika counter -->
</head>
<body>
	<!--LiveInternet counter-->
	<script>
	new Image().src = "//counter.yadro.ru/hit?r"+
	escape(document.referrer)+((typeof(screen)=="undefined")?"":
	";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
	screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
	";h"+escape(document.title.substring(0,150))+
	";"+Math.random();
	</script>
	<!--/LiveInternet-->
   {AJAX}
    <div class="page-content">
		<div id="scrolltopper"></div>
			<nav id="main-nav" class="main-nav fixed">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="nav-header d-flex justify-content-between align-items-center">
                            <a href="/" class="logo">
                                <!--<img src="/img/NewYear.png" id="im" alt="Happy New Year!" style="position: absolute; left: -6px; top: -15px;">-->
                                <img class="logo-img" src="data:image/svg+xml;charset=utf8,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%3E%3C/svg%3E" id="im" alt="Hex-Craft">
								<!-- <i class="fas fa-heart" style="color: #eef3fa;font-size: 26px;position: absolute;left: 26px;top: 15px;-webkit-text-stroke-width: 4px;-webkit-text-stroke-color: #2e3338;-webkit-transform: rotate(45deg);" aria-hidden="true"><use xlink:href="#icon-like"></use></i> -->
                            </a>
                        </div>
                        {include file="navwrap.tpl"}
                    </div>
                </div>
            </div>
        </nav>

        {include file="top.tpl"}
		<script src="/js/theme.js"></script>
		
        <div class="container">
            <div class="row">
                <div class="col-lg-9 col-md-9">
                    {info}
                    {content}
                </div>
                {include file="right.tpl"}
            </div>
        </div>
		
        <footer class="section site-footer bg-dark">
		<!--LiveInternet logo-->
		<a href="//www.liveinternet.ru/click" target="_blank" style="position: absolute">
			<img src="//counter.yadro.ru/logo?29.5" title="LiveInternet: показано количество просмотров и посетителей" alt="Счётчик посетителей" style="border:0" width="88" height="120"/>
		</a>
		<!--/LiveInternet-->
		
            <div class="container">
                <div class="row" style="margin-top: 10px;">
                    <div style="width: 340px">
                        <a href="/" title="Hex-Craft - Главная" ><img class="logo-img my-3" src="/img/hexcraft.svg" alt="Hex-Craft" style="position: relative; top: 8px; -webkit-filter: invert(100%); filter: invert(100%);"></a>
                    </div>
                    <div class="col-lg-6 col-md-6 text-center" style="width: 600px!important; max-width: 100%!important; flex: 0 0 40%!important;">
                        <p class="footer-text" style="width: 500px;">Hex-Craft © 2020-2021 Копирование элементов сайта строго запрещено. 
						<br><i class="fas fa-envelope"></i> admin@hex-craft.ru | <i class="fas fa-phone"></i>+38(066)-695-3745
						<br>Сделано с <i class="fa fa-heart"></i> и <i class="fa fa-coffee"></i></p>
						<a href="/?do=static&page=policy" style="float: left;">Политика конфеденциальности</a>
						<span style="float: left; line-height: 20px;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
						<a href="/?do=static&page=brand" style="float: left;">Бренд</a>
						<span style="float: left; line-height: 20px;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
						<a href="/?do=static&page=public_offer">Публичная оферта</a>
                    </div>
                        <ul class="ft-nav social-nav my-3" style="margin-left: 20px;">
                            <li class="mx-1"><a href="//vk.com/hex_craft" title="Вконтакте" rel="noopener"><i style=" line-height: 35px !important; " class="fab fa-vk"></i></a></li>
                            <li class="mx-1"><a href="//www.instagram.com/hex_craft_server" title="Инстаграм" rel="noopener"><i style=" line-height: 35px !important; " class="fab fa-instagram"></i></a></li>
                        </ul>
                </div>
            </div>
        </footer>
    </div>
	<button class="scroller" id="scroll_top" style="background: rgba(0,0,0,0); height: 0px; width: 0px;"><i class="fa fa-arrow-circle-up" aria-hidden="true" style="font-size: 80px; color: #828282; float: right"></i></button>
	
	<script>
		var current_players = '{include file="/scripts/ServerMonitoring/PlayersCountClassic.php"}';
		var current_players2 = '{include file="/scripts/ServerMonitoring/PlayersCountHitech.php"}';
		var current_players3 = '{include file="/scripts/ServerMonitoring/PlayersCountMagic.php"}';
	</script>
	{include file="/scripts/Referer.php"}
	<link rel="stylesheet" href="/css/swiper-bundle.min.css">
	<link rel="stylesheet" href="/engine/classes/highslide/highslide.css">
    <script src="/js/swiper-bundle.min.js"></script>
	<script src="/js/main.min.js"></script>
	<script src="/js/kit_fontawesome.js" crossorigin="anonymous"></script>
	<!--<div class="snowContainer">
		<div id="snow"></div>
	</div>-->
</body>
</html>