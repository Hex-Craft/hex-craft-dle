<div class="static-container">
	<img src="https://hex-craft.ru/uploads/posts/2020-09/1600077324_kits.png" alt="" class="fr-dib">
	<div class="news-container">
	
		<div class="info-panel">
			<span style="font-size: 20px;"><i class="fas fa-info-circle"></i> Киты можно получать каждый день (за исключением кита Eggs который доступен раз в два дня). Команда для получения предметов: /kit &lt;KitName&gt;</span>
		</div>
	
		<span style="font-size:22px;">Выберите сервер:</span>
		<br>
		<a href="/?do=static&page=kits&server=classic" class="server-btn green-gradient color server-btn-font" style="border-radius: 6px 0 0 6px;">
			<i class="fas fa-leaf"></i>
			Classic
		</a>
		<a href="/?do=static&page=kits&server=hitech" class="server-btn red-gradient color server-btn-font" style="border-radius: 0;">
			<i class="fas fa-wrench"></i>
			Hi-Tech
		</a>
		<a href="#" class="server-btn blue-gradient color server-btn-font"  style="border-radius: 0 6px 6px 0;">
			<i class="fas fa-magic"></i>
			Magic
		</a>
		
		{if isset($server)}
			<div style="display: inline-flex; justify-content: space-between; flex-wrap: wrap;">
				<a class="highslide" href="/img/kits/{$server}/start.png" target="_blank"><img src="/img/kits/{$server}/start.png" alt="" class="fr-dib" style="width: 400px; margin-top: 20px!important;"></a>
				<a class="highslide" href="/img/kits/{$server}/vip.png" target="_blank"><img src="/img/kits/{$server}/vip.png" alt="" class="fr-dib" style="width: 400px; margin-top: 20px!important;"></a>
				<a class="highslide" href="/img/kits/{$server}/premium.png" target="_blank"><img src="/img/kits/{$server}/premium.png" alt="" class="fr-dib" style="width: 400px; margin-top: 20px!important;"></a>
				<a class="highslide" href="/img/kits/{$server}/techpack.png" target="_blank"><img src="/img/kits/{$server}/techpack.png" alt="" class="fr-dib" style="width: 400px; margin-top: 20px!important;"></a>
				<a class="highslide" href="/img/kits/{$server}/ultra.png" target="_blank"><img src="/img/kits/{$server}/ultra.png" alt="" class="fr-dib" style="width: 400px; margin-top: 20px!important;"></a>
				<a class="highslide" href="/img/kits/{$server}/eggs.png" target="_blank"><img src="/img/kits/{$server}/eggs.png" alt="" class="fr-dib" style="width: 400px; margin-top: 20px!important;"></a>
				<a class="highslide" href="/img/kits/{$server}/elite.png" target="_blank"><img src="/img/kits/{$server}/elite.png" alt="" class="fr-dib" style="width: 400px; margin-top: 20px!important;"></a>
			</div>
		{/if}
	</div>
</div>