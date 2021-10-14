<div class="static-container" style="{if !isset($server)}height: 350px;{/if} border-radius: 6px 6px 0 0;">
	<img src="https://hex-craft.ru/uploads/posts/2020-09/1600106639_donation.png" alt="" class="fr-dib">
	<div class="news-container">
		<h4>Купить привилегии на сервере: {if isset($server)}{$server|upper}{/if}</h4>
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
	<form method="GET" id="ajax_form">
		<!--<select name="server" required="required">
			<option value="classic">Classic 1.16.2</option>
			<option value="hitech">Hi-Tech 1.12.2</option>
			<option value="magic">Magic 1.7.10</option>
		</select>-->
		<span>Кол-во хекселей&nbsp;</span>
		<input type="number" name="hexels_count" id="hexels">
		<br>
		<br>
		<input id="radio_1" name="type" type="radio" value="hexels_count" disabled/>
		<label for="radio_1">Хексели - 1 монета = 1000 хекселей (not implemented yet...)</label><br />
		<input id="radio_2" name="type" type="radio" value="fly" />
		<label for="radio_2">Fly - 50 монет</label><br />
		<input id="radio_3" name="type" type="radio" value="vip" />
		<label for="radio_3">Vip - 50 монет</label><br />
		<input id="radio_4" name="type" type="radio" value="gold" />
		<label for="radio_4">Premium - 100 монет</label><br />
		<input id="radio_5" name="type" type="radio" value="ultra" />
		<label for="radio_5">Ultra - 250 монет</label><br />
		<input id="radio_6" name="type" type="radio" value="elite" checked />
		<label for="radio_6">Elite - 500 монет</label><br />
		<input id="radio_7" name="type" type="radio" value="sponsor" />
		<label for="radio_7">Sponsor - 1000 монет</label><br />
		<input id="radio_8" name="type" type="radio" value="supersponsor" disabled/>
		<label for="radio_8">Super-Sponsor - 1000+ монет (not implemented yet...)</label><br />
		
		<input type="text" name="user_id" value="{$user.user_id}" hidden>
		<input type="text" name="user" value="{$user.name}" hidden>
		<input type="text" name="discord_token" value="{$user.discord_token}" hidden>
		<input type="text" name="hash" value="{$user.hash}" hidden>
		<input type="text" name="server" value="{$server}" hidden>
		
		<br>
		<input type="submit" id="buy" value="Купить" class="btn-drop" style="width: 200px;">
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
    <div><span style="font-size:18px;">Каждому проекту, а особенно бесплатному, всегда необходима материальная поддержка. Привилегии дают вам расширенные возможности, а те средства которые мы получаем мы тратим на развитие проекта и на содержание серверов.</span></div>
    <div><span style="font-size:18px;">Мы всегда стараемся быть лучше для вас, поэтому каждую свободную минуту своего времени используем на улучшение сервера.</span></div>
    <div><span style="font-size:18px;">Вы также можете стать спонсором сервера,</span><span style="font-size:18px;">вы получите</span>
        <br><span style="font-size:18px;">все возможности привилегий</span><span style="font-size:18px;">и префикс <span style="color:rgb(251,160,38);">[СПОНСОР]</span></span>
        <br><span style="font-size:18px;">Стоимость спонсорства: 1.000 рублей.</span>
        <br>
        <br>
        <table cellpadding="3" cellspacing="10" class="tbl" style="border-collapse:collapse;margin-left:40px;" width="674">
            <thead>
                <tr>
                    <th class="label_th" style="min-width:300px;">Возможности:</th>
                    <th class="label_th" style="min-width:55px;text-align:center;">ИГРОК</th>
                    <th class="label_th" style="min-width:55px;text-align:center;">VIP</th>
                    <th class="label_th" style="min-width:55px;text-align:center;">PREMIUM</th>
                    <th class="label_th" style="min-width:55px;text-align:center;">ULTRA</th>
                    <th class="label_th" style="min-width:55px;text-align:center;">ELITE</th>
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
                    <td class="th_base">Кол-во работ</td>
                    <td class="player"><b>3 шт</b></td>
                    <td class="vip"><b>4 шт</b></td>
                    <td class="premium"><b>5 шт</b></td>
                    <td class="ultra"><b>6 шт</b></td>
                    <td class="creative"><b>-</b></td>
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
                    <td class="th_base">Кол-во питомцев</td>
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
                    <td class="creative"><b>-</b></td>
                </tr>
                <tr>
                    <td class="th_base">Частота рекламы</td>
                    <td class="player"><b>1 час</b></td>
                    <td class="vip"><b>30 мин</b></td>
                    <td class="premium"><b>20 мин</b></td>
                    <td class="ultra"><b>10 мин</b></td>
                    <td class="creative"><b>-</b></td>
                </tr>
                <tr>
                    <td class="th_base">Срубка всего дерева одним блоком
                        <br><small>Команда: /sm toggle</small></td>
                    <td class="player"><i class="fa fa-check"></i></td>
                    <td class="vip"><i class="fa fa-check"></i></td>
                    <td class="premium"><i class="fa fa-check"></i></td>
                    <td class="ultra"><i class="fa fa-check"></i></td>
                    <td class="creative"><i class="fa fa-check"></i></td>
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
                    <td class="th_base">Возможность покупать Baby питомцев
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
                    <td class="th_base">Цветной тег клана</td>
                    <td class="player"><i class="fa fa-times"></i></td>
                    <td class="vip"><i class="fa fa-check"></i></td>
                    <td class="premium"><i class="fa fa-check"></i></td>
                    <td class="ultra"><i class="fa fa-check"></i></td>
                    <td class="creative"><i class="fa fa-check"></i></td>
                </tr>
                <tr>
                    <td class="th_base">Сброс уровня KDR</td>
                    <td class="player"><i class="fa fa-times"></i></td>
                    <td class="vip"><i class="fa fa-check"></i></td>
                    <td class="premium"><i class="fa fa-check"></i></td>
                    <td class="ultra"><i class="fa fa-check"></i></td>
                    <td class="creative"><i class="fa fa-check"></i></td>
                </tr>
                <tr>
                    <td class="th_base">Смена скина
                        <br><small>Команда: /skin</small></td>
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
                    <td class="th_base">Команда для слежки за чатом
                        <br><small>Команда: /spy</small></td>
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
                    <td class="th_base">Получать пакет ресурсов <a href="/kits.html"><b>BASE</b></a>
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
                    <td class="th_base">Узнать тех кто находится рядом с вами
                        <br><small>Команда: /near</small></td>
                    <td class="player"><i class="fa fa-times"></i></td>
                    <td class="vip"><i class="fa fa-times"></i></td>
                    <td class="premium"><i class="fa fa-check"></i></td>
                    <td class="ultra"><i class="fa fa-check"></i></td>
                    <td class="creative"><i class="fa fa-check"></i></td>
                </tr>
                <tr>
                    <td class="th_base">Бесплатные декоративные головы
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
                    <td class="th_base">Починка предмета в руке или инвентаре
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
                    <td class="th_base">Установка персонального времени суток
                        <br><small>Команда: /ptime [day или night]</small></td>
                    <td class="player"><i class="fa fa-times"></i></td>
                    <td class="vip"><i class="fa fa-times"></i></td>
                    <td class="premium"><i class="fa fa-check"></i></td>
                    <td class="ultra"><i class="fa fa-check"></i></td>
                    <td class="creative"><i class="fa fa-check"></i></td>
                </tr>
                <tr>
                    <td class="th_base">Открытие эндер-сундука в любом месте
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
                    <td class="th_base">Выбор любого цвета и создание градиентов
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
                    <td class="th_base" style="font-size:16px;border:none;text-align:right;"><b>Стоимость привилегии:</b>
                        <br><small>Привилегия выдаётся на 30 дней.</small></td>
                    <td class="player" style="border:none;"><b>0</b> рублей</td>
                    <td class="vip" style="border:none;"><b>50</b> рублей</td>
                    <td class="premium" style="border:none;"><b>100</b> рублей</td>
                    <td class="ultra" style="border:none;"><b>250</b> рублей</td>
                    <td class="creative" style="border:none;"><b>500</b> рублей</td>
                </tr>
            </tbody>
        </table>
    </div></div>

{/if}