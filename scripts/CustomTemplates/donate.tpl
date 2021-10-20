<div class="static-container" style="border-radius: 6px 6px 0 0;">
	<img src="https://hex-craft.ru/uploads/posts/2020-09/1600106639_donation.png" alt="" class="fr-dib">
	<div class="news-container" style="overflow: auto;">
		<h4 style="margin: 0;">Купить привилегию на сервер: {if isset($server)}{$server|upper}{/if}</h4>
		{if !isset($server)}
		<a href="/donate.html?server=classic" class="server-btn green-gradient color server-btn-font" style="border-radius: 6px 0 0 6px;">
			<i class="fas fa-leaf"></i>
			Classic
		</a>
		<a href="/donate.html?server=hitech" class="server-btn red-gradient color server-btn-font" style="border-radius: 0;">
			<i class="fas fa-wrench"></i>
			Hi-Tech
		</a>
		<a href="/donate.html?server=magic" class="server-btn blue-gradient color server-btn-font"  style="border-radius: 0 6px 6px 0;">
			<i class="fas fa-magic"></i>
			Magic
		</a>
		{/if}
	</div>
</div>
{if isset($server)}
<div class="news-link" style="padding:0 20px 20px 20px; border-radius: 0 0 6px 6px;">

	<div class="info-panel">
		<span style="font-size: 22px;"><i class="fas fa-info-circle" aria-hidden="true"></i> <b>Что такое спонсор?</b></span><br>
		<span>Привилегии с припиской SPONSOR имеют цену в 6 раз больше стандартной и выдаются навсегда.</span>
	</div>

	<form method="GET" id="ajax_form">
		<div class="donate-radios">
			<div style="width: 640px; margin-bottom: 10px;">
				<span style="font-size: 22px; padding: 3px 20px; position: absolute;">Кол-во хекселей:</span>
				<input type="number" name="hexels_count" id="hexels" min="0" max="10000000" oninput="validity.valid||(value='');" style="float: right; width: 420px;">
			</div>
			<div class="form_radio_btn">
				<input id="radio-0" type="radio" name="type" value="hexels">
				<label for="radio-0"><p class="donate-price">1:1000</p>HEXELS</label>
			</div>
			<div class="form_radio_btn">
				<input id="radio-1" type="radio" name="type" value="fly">
				<label for="radio-1"><p class="donate-price">50</p>FLY</label>
			</div>
			<div class="form_radio_btn">
				<input id="radio-2" type="radio" name="type" value="vip">
				<label for="radio-2"><p class="donate-price">50</p>VIP</label>
			</div>
			<div class="form_radio_btn form_radio_blue">
				<input id="radio-3" type="radio" name="type" value="gold">
				<label for="radio-3"><p class="donate-price">100</p>PREMIUM</label>
			</div>
			<div class="form_radio_btn form_radio_blue">
				<input id="radio-4" type="radio" name="type" value="ultra" checked>
				<label for="radio-4"><p class="donate-price">250</p>ULTRA</label>
			</div>
			<div class="form_radio_btn form_radio_blue">
				<input id="radio-5" type="radio" name="type" value="elite">
				<label for="radio-5"><p class="donate-price">500</p>ELITE</label>
			</div>
			<div class="form_radio_btn form_radio_violet">
				<input id="radio-6" type="radio" name="type" value="sponsor_gold">
				<label for="radio-6"><p class="donate-price">600</p>SPONSOR PREMIUM</label>
			</div>
			<div class="form_radio_btn form_radio_violet">
				<input id="radio-7" type="radio" name="type" value="sponsor_ultra">
				<label for="radio-7"><p class="donate-price">1500</p>SPONSOR ULTRA</label>
			</div>
			<div class="form_radio_btn form_radio_violet">
				<input id="radio-8" type="radio" name="type" value="sponsor_elite">
				<label for="radio-8"><p class="donate-price">3000</p>SPONSOR ELITE</label>
			</div>
			<div style="width: 420px; padding-left: 32px;">
				<input type="checkbox" id="silent" name="silent" checked>
				<label for="silent">Тихая покупка (без оповещения на сервере)</label>
			</div>
			<div style="width: 210px; padding-left: 28px;">
				<input type="checkbox" id="no_prefix" name="no_prefix">
				<label for="no_prefix">Не менять префикс</label>
			</div>
			
			<input type="submit" id="buy" value="Купить" class="btn-drop" style="width: 640px; margin-top: 10px; font-size: 24px;">
		</div>
		
		<input type="text" name="user" value="{$user.name}" hidden>
		<input type="text" name="discord_token" value="{$user.discord_token}" hidden>
		<input type="text" name="hash" value="{$user.hash}" hidden>
		<input type="text" name="server" value="{$server}" hidden>

	</form>
	<div id="result"></div>
</div>
<script>
	$(document).ready(function(){
  
	  $('#radio_1').on('change', function() {
		
		if ($('#radio_1').prop('checked')) {
		  $( "#hexels" ).prop( "disabled", false );
		  $('#hexels').focus();
		} else {
		  $( "#hexels" ).prop( "disabled", true );
		}
		
	  })
	  
	  $("#buy").click(
			function(){
				sendAjax('result', 'ajax_form', '/scripts/DonateSystem/Purchase.php', 'Произошла непредвиденная ошибка.');
				return false; 
			}
		);
	  
	})
	
	function sendAjax(result_form, ajax_form, url, error_answer) {
		$.ajax({
			url:     url,
			type:     "GET",
			dataType: "html",
			data: $("#"+ajax_form).serialize(),
			success: function(response) {
				result = $.parseJSON(response);
				$("#"+result_form).html(result.answer);
			},
			error: function(response) {
				$("#"+result_form).html(error_answer);
			}
		});
	}
	</script>
{else}
<div class="news-link" style="padding:0 20px 20px 20px; border-radius: 0 0 6px 6px;">
    <span style="font-size:18px;">Каждому проекту, а особенно бесплатному, всегда необходима материальная поддержка. Привилегии дают вам расширенные возможности, а те средства которые мы получаем мы тратим на развитие проекта и на содержание серверов. Мы всегда стараемся быть лучше для вас, поэтому каждую свободную минуту своего времени используем на улучшение сервера.<br><b>Помимо обычных привилегий существуют спонсорские, они дают привилегию навсегда, их стоимость равна 6 месяцам привилегии.</b></span>
	<br>
	<br>
    <table cellpadding="3" cellspacing="10" class="tbl" style="border-collapse:collapse; margin-left:40px;" width="674">
        <thead>
            <tr>
                <th class="label_th" style="min-width:300px;">Возможности</th>
                <th class="label_th" style="min-width:55px;">ИГРОК</th>
                <th class="label_th" style="min-width:55px;">VIP</th>
                <th class="label_th" style="min-width:55px;">PREMIUM</th>
                <th class="label_th" style="min-width:55px;">ULTRA</th>
                <th class="label_th" style="min-width:55px;">ELITE</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="th_base">Кол-во приватов</td>
                <td class="player"><b>2 шт</b></td>
                <td class="vip"><b>2 шт</b></td>
                <td class="premium"><b>3 шт</b></td>
                <td class="ultra"><b>4 шт</b></td>
                <td class="creative"><b>6 шт</b></td>
            </tr>
            <tr>
                <td class="th_base">Размер приватных зон</td>
                <td class="player"><b>30.000</b></td>
                <td class="vip"><b>50.000</b></td>
                <td class="premium"><b>100.000</b></td>
                <td class="ultra"><b>500.000</b></td>
                <td class="creative"><b>750.000</b></td>
            </tr>
            <tr>
                <td class="th_base">Кол-во работ<div class="badge badge-classic">Classic</div></td>
                <td class="player"><b>3 шт</b></td>
                <td class="vip"><b>4 шт</b></td>
                <td class="premium"><b>5 шт</b></td>
                <td class="ultra"><b>6 шт</b></td>
                <td class="creative"><b>6 шт</b></td>
            </tr>
            <tr>
                <td class="th_base">Кол-во точек дома</td>
                <td class="player"><b>2 шт</b></td>
                <td class="vip"><b>3 шт</b></td>
                <td class="premium"><b>4 шт</b></td>
                <td class="ultra"><b>5 шт</b></td>
                <td class="creative"><b>10 шт</b></td>
            </tr>
            <tr>
                <td class="th_base">Кол-во питомцев<div class="badge badge-classic">Classic</div></td>
                <td class="player"><b>2 шт</b></td>
                <td class="vip"><b>4 шт</b></td>
                <td class="premium"><b>5 шт</b></td>
                <td class="ultra"><b>8 шт</b></td>
                <td class="creative"><b>10 шт</b></td>
            </tr>
            <tr>
                <td class="th_base">Кол-во лотов на ауционе</td>
                <td class="player"><b>5 шт</b></td>
                <td class="vip"><b>10 шт</b></td>
                <td class="premium"><b>15 шт</b></td>
                <td class="ultra"><b>30 шт</b></td>
                <td class="creative"><b>50 шт</b></td>
            </tr>
            <tr>
                <td class="th_base">Частота рекламы</td>
                <td class="player"><b>1 час</b></td>
                <td class="vip"><b>30 мин</b></td>
                <td class="premium"><b>20 мин</b></td>
                <td class="ultra"><b>10 мин</b></td>
                <td class="creative"><b>10 мин</b></td>
            </tr>
            <tr>
                <td class="th_base">Строительный посох<div class="badge badge-hitech">Hi-Tech</div>
					<br><small>(Кол-во редактируемых блоков)</small></td>
                <td class="player"><b>9</b></td>
                <td class="vip"><b>1561</b></td>
                <td class="premium"><b>4096</b></td>
                <td class="ultra"><b>8192</b></td>
                <td class="creative"><b>8192</b></td>
            </tr>
            <tr>
                <td class="th_base">Флаг <b>PVP</b> и <b>other-explosion</b></td>
                <td class="player underline_pl"><i class="fa fa-check"></i></td>
                <td class="vip underline_v"><i class="fa fa-check"></i></td>
                <td class="premium underline_p"><i class="fa fa-check"></i></td>
                <td class="ultra underline_u"><i class="fa fa-check"></i></td>
                <td class="creative underline_c"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Пакет флагов <b>VIP</b>
                    <br><small>Флаги: ice-form, ice-melt, snow-fall, snow-melt</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-check"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Покупать Baby питомцев<div class="badge badge-classic">Classic</div>
                    <br><small>Команда: /petshop</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-check"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Телепортация
                    <br><small>Команда: /tp</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-check"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Использование цвета в чате
                    <br><small>Подробнее на странице&nbsp;<a href="/help.html" target="_blank">помощь</a></small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-check"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Цветной тег клана<div class="badge badge-classic">Classic</div></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-check"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Сброс уровня KDR<div class="badge badge-classic">Classic</div></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-check"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Редактирование маникена
                    <br><small>Шифт + ПКМ</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-check"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Сохранение инвентаря</td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-check"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Команда для получения опыта
                    <br><small>Команда: /exp</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-check"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Зачарование предметов
                    <br><small>Команда: /enchant</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-check"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Вход на переполненый сервер</td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-check"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Восстановление сытости
                    <br><small>Команда: /feed (1 раз в минуту)</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-check"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Получать пакет ресурсов <a href="/kits.html"><b>VIP</b></a>
                    <br><small>Команда: /kit vip <b>(1 раз в 24 часа)</b></small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-check"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Надеть блок на голову
                    <br><small>Команда: /hat</small></td>
                <td class="player underline_pl"><i class="fa fa-times"></i></td>
                <td class="vip underline_v"><i class="fa fa-check"></i></td>
                <td class="premium underline_p"><i class="fa fa-check"></i></td>
                <td class="ultra underline_u"><i class="fa fa-check"></i></td>
                <td class="creative underline_c"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Восстановление здоровья
                    <br><small>Команда: /heal (1 раз в минуту)</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
			<tr>
                <td class="th_base">Установка карьера<div class="badge badge-hitech">Hi-Tech</div></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Узнать кто находится рядом
                    <br><small>Команда: /near</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Бесплатные декор-головы<div class="badge badge-classic">Classic</div>
                    <br><small>Команда: /hdb</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Возврат на место вашей гибели
                    <br><small>Команда: /back</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Починка предмета
                    <br><small>Команда: /repair [all - починить весь инвентарь]</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Режим полёта
                    <br><small>Команда: /fly</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Пакет флагов <b>PREMIUM</b>
                    <br><small>Флаги: mob-spawning, mob-damage, greeting, farewell</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Цветные названия предметов
                    <br><small>Пример: &amp;aМеч бога</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Очистка инвентаря
                    <br><small>Команда: /clear</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Установка своего времени суток
                    <br><small>Команда: /ptime [day или night]</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Открытие эндер-сундука
                    <br><small>Команда: /ender</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Режим бессмертия
                    <br><small>Команда: /god</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Получать пакет ресурсов <a href="/kits.html"><b>PREMIUM</b></a>
                    <br><small>Команда: /kit premium <b>(1 раз в 24 часа)</b></small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Потушиться или потушить игрока
                    <br><small>Команда /ext [ник]</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Прыжок в место куда вы смотрите
                    <br><small>Команда /jump</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-check"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Получение и телепортация на координаты
                    <br><small>Команды: /pos /tppos</small></td>
                <td class="player underline_pl"><i class="fa fa-times"></i></td>
                <td class="vip underline_v"><i class="fa fa-times"></i></td>
                <td class="premium underline_p"><i class="fa fa-check"></i></td>
                <td class="ultra underline_u"><i class="fa fa-check"></i></td>
                <td class="creative underline_c"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Получать пакет ресурсов <a href="/kits.html%20"><b>ULTRA</b></a>
                    <br><small>Команда: /kit ultra (1 раз в 24 часа)</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-times"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Пакет флагов <b>ULTRA</b>
                    <br><small>Флаги: entry, creeper-explosion, mob-spawning, mob-damage</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-times"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Установка персональной погоды
                    <br><small>&nbsp;Команда: /pweather [sun или storm]&nbsp;</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-times"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Установка скорости полёта
                    <br><small>&nbsp;Команда: /flyspeed [от 1.0 до 2.0]&nbsp;</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-times"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Создать голограмму
                    <br><small>&nbsp;Команда: /hologram</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-times"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Стать невидимым
                    <br><small>&nbsp;Команда: /vanish</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-times"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Наложить эффект
                    <br><small>&nbsp;Команда: /effect</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-times"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Открыть окно торговли с жителем
                    <br><small>&nbsp;Команда: /merchant</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-times"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Подбор цвета и градиента
                    <br><small>&nbsp;Команда: /colorpicker</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-times"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Открытие наковальни
                    <br><small>&nbsp;Команда: /anvil</small></td>
                <td class="player"><i class="fa fa-times"></i></td>
                <td class="vip"><i class="fa fa-times"></i></td>
                <td class="premium"><i class="fa fa-times"></i></td>
                <td class="ultra"><i class="fa fa-check"></i></td>
                <td class="creative"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base">Получать пакет ресурсов <a href="/kits.html"><b>EGGS</b></a>
                    <br><small>Команда: /kit eggs <b>(1 раз в 48 часов)</b></small></td>
                <td class="player underline_pl"><i class="fa fa-times"></i></td>
                <td class="vip underline_v"><i class="fa fa-times"></i></td>
                <td class="premium underline_p"><i class="fa fa-times"></i></td>
                <td class="ultra underline_u"><i class="fa fa-check"></i></td>
                <td class="creative underline_c"><i class="fa fa-check"></i></td>
            </tr>
            <tr>
                <td class="th_base" style="font-size:16px; text-align:right;"><b>Стоимость привилегии:</b>
                    <br><small>Привилегия выдаётся на 30 дней.</small></td>
                <td class="player"><b>0</b> монет</td>
                <td class="vip"><b>50</b> монет</td>
                <td class="premium"><b>100</b> монет</td>
                <td class="ultra"><b>250</b> монет</td>
                <td class="creative"><b>500</b> монет</td>
            </tr>
            <tr>
                <td class="th_base" style="font-size:16px; border:none; text-align:right;"><b>Стоимость спонсорства:</b>
                    <br><small>Привилегия выдаётся навсегда.</small></td>
                <td class="player" style="border:none;"><b>-</b></td>
                <td class="vip" style="border:none;">-</td>
                <td class="premium" style="border:none;"><b>600</b> монет</td>
                <td class="ultra" style="border:none;"><b>1500</b> монет</td>
                <td class="creative" style="border:none;"><b>2500</b> монет</td>
            </tr>
        </tbody>
    </table>
</div>
{/if}