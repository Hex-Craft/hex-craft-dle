<html>
    <head>
        <title>
            Сайт временно отключен
        </title>
        
        <style>
html, body {margin:0px; padding:0px; font-family:tahoma, arial; font-size:11px; cursor:default;}
body {background-position:50% 50px !important; background: linear-gradient(45deg,#5260d5,#42a4f3)!important; !important; color:#666;}
.box-out {background:rgba(0,0,0,0.4);border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;padding:8px;}
.box-in {background:#fff;border-radius:2px;-moz-border-radius:2px;-webkit-border-radius:2px;padding:10px;color:#666;font-size:12px;}
.box-in h2 {color:#666;}
h2 {
font-family:Cuprum,Tahoma,Arial,sans-serif;
font-size:25px;
font-weight:normal;
padding:0px;
margin:0px 0px 2px 0px;
color:#fff;
}
h3
font-family:Cuprum,Tahoma,Arial,sans-serif;
font-size:12x;
font-weight:normal;
padding:0px;
margin:0px 0px 2px 0px;
color:#fff;
}
        </style>
</head>
    <body>
        <center><h2>Сайт временно отключен.</h2></center>
        <br/>
        <div class="box-out">
            <div class="box-in">
                <center>
<span style="font-size: 1.2em; font-weight:bold;">Сайт временно не работает!</span>
<br /><br />{reason}<br />Через<span style="color: #f93; font-weight:bold; font-size: 2em; margin: 0 0.3em;" id="counter">60</span>секунд<br />страница обновится автоматически.<br /><br /><img src="https://acegif.com/wp-content/uploads/cat-typing-16.gif" height=600 width=600 />
</center>
</div>
<div id="liveInternetCounter"><img src="dk_files/hit" alt="" height="1" width="1" /></div>
            </center>
       <script type="text/javascript">
var changeCounter = function()
{
  if (document.getElementById('counter').innerHTML == 0)
  {
  window.location.reload();
  return;
  }

  document.getElementById('counter').innerHTML-=1;
  setTimeout('changeCounter()', 1000);
}
setTimeout('changeCounter()', 1000);
</script>
       
    </body>
</html>
