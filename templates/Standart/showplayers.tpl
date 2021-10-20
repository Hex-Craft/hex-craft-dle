<span class="name-rog">
{description}
<div class="news-link" style="padding:20px; margin-bottom: 0px; color: #828282; font-weight: 300; height: 600px;">
<iframe src="//minecraftrating.ru/server_chart/107461/" width="100%" height="250" frameborder="0" scrolling="no"></iframe>
{include file='/scripts/ServerMonitoring/ListPlayersClassic.php'}
<script>
$( document ).ready(function() {
	var iframe = document.getElementsByTagName('iframe')[0];
	var iframeDoc = iframe.contentWindow.document;
	if (iframeDoc.readyState == 'complete') {
		let element = window.frames[0].getElementsByClassName('highcharts-background');
		console.log(element);
		element[0].attr('style', 'fill: #333');
		iframeDoc.body.style.backgroundColor = 'green';
	}
})
</script>
</div>
</span>