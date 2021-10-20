[not-group=5]
	<div class="story" style="overflow: auto; padding-bottom: 15px;">
		<div class="wrp" style="overflow: auto;">
			<h1>Личный кабинет {usertitle}</h1>
			{include file="skin_small.tpl"}
			<div style="padding: 10px; display: flex; flex-wrap: wrap; justify-content: space-between; align-content: space-between; height: 340px; width: 610px; float: right; align-items: stretch; flex-direction: row;">
				<a href="/donate.html" class="btn-drop" style="height: 100px; [notowner]background: #555; pointer-events: none;[/notowner]">
					<i class="fas fa-star" style="padding-top: 10px;" aria-hidden="true"></i>
					<span>Привилегии</span>
					<hr style="margin:0px;">
					<span class="userinfo-btn-text">Здесь вы можете приобрести донат</span>
				</a>
				<a href="/webcash/plugin/upbalance" class="btn-drop" style="height: 100px; [notowner]background: #555; pointer-events: none;[/notowner]">
					<i class="fas fa-coins" aria-hidden="true"></i>
					<span>Монеты</span>
					<hr style="margin:0px;">
					<span class="userinfo-btn-text">Они нужны для покупки привилегий</span>
				</a>
				<a href="/vote.html" class="btn-drop" style="height: 100px; [notowner]background: #555; pointer-events: none;[/notowner]">
					<i class="fas fa-gift" aria-hidden="true"></i>
					<span>Голосовать</span>
					<hr style="margin:0px;">
					<span class="userinfo-btn-text">Голосуй и получай за это хексели</span>
				</a>
				<a href="https://vk.com/im?media=&amp;sel=-197635448" target="_blank" class="btn-drop" style="height: 100px; [notowner]background: #555; pointer-events: none;[/notowner]">
					<i class="fas fa-question-circle" aria-hidden="true"></i>
					<span>Поддержка</span>
					<hr style="margin:0px;">
					<span class="userinfo-btn-text">Проблемы, вопросы? Напиши нам</span>
				</a>
				<a href="/top.html" class="btn-drop" style="height: 100px; [notowner]background: #555; pointer-events: none;[/notowner]">
					<i class="fas fa-line-chart" aria-hidden="true"></i>
					<span>Топ игроков</span>
					<hr style="margin:0px;">
					<span class="userinfo-btn-text">Здесь можно узнать кто самый активный</span>
				</a>
				<div class="btn-drop" style="height: 100px; width: 190px; display: grid; align-content: space-evenly;[notowner]background: #555; pointer-events: none;[/notowner]">
					<form type="post"></form>
					<form id="ajax_form2" method="POST" enctype="multipart/form-data" style="margin: 0; display: grid; align-content: space-evenly; height: inherit;">
						<button style="height: 42px; background: none; transition: 9999s; font-size: 18px;" [notowner]disabled[/notowner] id="spawn">
							<i class="fas fa-home" aria-hidden="true"></i>
							<span>Тп на спавн</span>
						</button>
						<hr style="margin:0px;">
						<select name="server" class="balance-input" style="display: block; width: 170px; margin-left: 10px;">
							<option value="classic" class="balance-input">Classic</option>
							<option value="hitech" class="balance-input">Hi-tech</option>
							<option value="magic" class="balance-input">Magic</option>
						</select>
						<input type="hidden" name="login" value="{usertitle}">
						<input type="hidden" name="hash" value="{discord_token}">
						<div id="result_form2"></div>
					</form>
				</div>
				<a href="/moder.html" class="btn-drop" style="height: 100px; [notowner]background: #555; pointer-events: none;[/notowner]">
					<i class="fas fa-id-card" aria-hidden="true"></i>
					<span>Модераторство</span>
					<hr style="margin:0px;">
					<span class="userinfo-btn-text">Заполни анкету и мы её рассмотрим</span>
				</a>
				<a href="/jobs.html" class="btn-drop" style="height: 100px; [notowner]background: #555; pointer-events: none;[/notowner]">
					<i class="fas fa-briefcase" aria-hidden="true"></i>
					<span>Профессии</span>
					<hr style="margin:0px;">
					<span class="userinfo-btn-text">Уровни работ на сервере CLASSIC</span>
				</a>
				<a href="/skin_viewer.html?nick={usertitle}" class="btn-drop" style="height: 100px">
					<i class="fas fa-spray-can"></i>
					<span>Скин</span>
					<hr style="margin:0px;">
					<span class="userinfo-btn-text">Детально осмотреть скин</span>
				</a>
			</div>
		</div>
	</div>
	[owner]
		<hr style="margin: 0;">
		<div class="news-link" style="padding:20px; overflow: auto;">
			<div style="width: 830px; height: 38px; display: inline-block; margin-bottom: 16px;">
				<h1 class="ui-c1" style="border: none; padding: 0; display: block; float: left;">Управление аккаунтом</h1>
				<h6 style="margin-top: 14px; position: relative; left: 10px; color: #828282; font-weight: 300;">Балланс на серверах обновляется раз в минуту.</h6>
			</div>

			<div class="balance-window" style="float: left;">
				<div style="display:inline-block">
					<h4>Загрузка скина:</h4>
					Выберите файл для загрузки:<br>
					<form name="upload" action="/scripts/GameModules/UploadSkin.php" method="POST" enctype="multipart/form-data" style="margin: 0;width: 100px;"> 
						<input type="hidden" name="login" value="{usertitle}">
						<input type="hidden" name="hash" value="{discord_token}">
						<input type="hidden" name="type" value="1">
						<input type="file" name="userfile" style="height: 46px; padding: 11px; width: 368px;" required>
						<input type="submit" name="upload" value="Загрузить" style="width: 368px;margin-top: 5px;" action="/scripts/GameModules/UploadSkin.php"> 
					</form>
				</div>
			</div>
			
			<div class="balance-window">
				<div style="display:inline-block">
					<h4>Загрузка плаща:</h4>
					Выберите файл для загрузки:<br>
					<form name="upload" action="/scripts/GameModules/UploadSkin.php" method="POST" enctype="multipart/form-data" style="margin: 0;"> 
						<input type="hidden" name="login" value="{usertitle}">
						<input type="hidden" name="hash" value="{discord_token}">
						<input type="hidden" name="type" value="2">
						<input type="file" name="userfile" style="height: 46px; padding: 11px; width: 368px;" required>
						<input type="submit" name="upload" value="Загрузить" style="width: 180px;margin-top: 5px;margin-right: 8px;" action="/scripts/GameModules/UploadSkin.php">
					</form>
					<form method="POST" id="ajax_form5" style="margin: 0px;">
						<input type="hidden" name="login" value="{login}">
						<input type="hidden" name="hash" value="{discord_token}">
						<input type="submit" id="deletecloak" value="Удалить" class="div-button" style="margin: 0px; width: 180px; margin-top: -40px; margin-left: 187px; padding: 0px;">
					</form>
				</div>
			</div>

			<table cellpadding="3" cellspacing="0" class="server-table" style="width: 405px;">
					<tr class="server-table-tr">
						<th class="label_th" style="width:100px;">Сервер</th>
						<th class="label_th" style="width:100px;">Хексели</th>
						<th class="label_th" style="width:100px;">Звание</th>
						<th class="label_th" style="width:105px;">Осталось</th>
					</tr>
					<tr class="server-table-tr">
						<th>CLASSIC</th>
						<th>{balance_classic}</th>
						<th>{prefix_classic}</th>
						<th>{left_classic}</th>
					</tr>
					<tr class="server-table-tr">
						<th>HI-TECH</th>
						<th>{balance_hitech}</th>
						<th>{prefix_hitech}</th>
						<th>{left_hitech}</th>
					</tr>
					<tr>
						<th>MAGIC</th>
						<th>{balance_magic}</th>
						<th>{prefix_magic}</th>
						<th>{left_magic}</th>
					</tr>
			</table>

			<div class="balance-window" style="float: right; height: 199px;">
				<h6>Прочее</h6>
				<form method="post" name="userinfo" id="userinfo" enctype="multipart/form-data" action="/user/{login}">
					<input type="hidden" name="doaction" value="adduserinfo" />
					<input type="hidden" name="id" value="{user_id}" />
					<input type="hidden" name="dle_allow_hash" value="{dle_login_hash}" />
					<input type="text" name="email" value="{editmail}" class="" hidden />
					Дата регистрации: {registration}<br>
					Ваш IP: {ip}<br>
					{twofactor-auth}
					<input class="fbutton" type="submit" name="submit" style="width: 368px;" value="Сохранить" />
				</form>
			</div>

			<div class="balance-window" style="float: left;">
				<h6>Перевод хекселей с сайта на сервер</h6>
				<form method="POST" id="ajax_form3" style="margin: 0px;">
					<input type="hidden" name="login" value="{login}">
					<input type="hidden" name="hash" value="{discord_token}">
					<input type="text" name="hexels" id="hexels1" style="width: 368px;" placeholder="Хексели">
					<select name="server" class="balance-input" style="margin-top: 5px; width: 368px;">
						<option value="classic" class="balance-input">Classic</option>
						<option value="hitech" class="balance-input">Hi-tech</option>
						<option value="magic" class="balance-input">Magic</option>
					</select>
					<input type="hidden" name="type" value="1">
					<input type="submit" id="balancem" value="Перевести" style="margin-top: 5px; width: 368px;">
					<span id="result_form3"></span>
				</form>
			</div>

			<div class="balance-window">
			<h6>Перевод хекселей с сервера на сайт</h6>
			<form method="POST" id="ajax_form4" style="margin: 0px;">
				<input type="hidden" name="login" value="{login}">
				<input type="hidden" name="hash" value="{discord_token}">
				<input type="text" name="hexels" id="hexels2" style="width: 368px;" placeholder="Хексели">
				<select name="server" class="balance-input" style="margin-top: 5px; width: 368px;">
					<option value="classic" class="balance-input">Classic</option>
					<option value="hitech" class="balance-input">Hi-tech</option>
				</select>
				<input type="hidden" name="type" value="2">
				<input type="submit" id="balancem2" value="Перевести" style="margin-top: 5px; width: 368px;">
			</form>
			</div>

			<div class="balance-window" style="float: left; height: 199px;">
				<h6>Ваш Discord Token</h6>
				<form method="POST" id="ajax_form_token" style="margin: 0px;">
					<input type="hidden" name="login" value="{login}">
					<input id="token" type="hidden" name="hash" value="{discord_token}">
					<input type="hidden" name="user_id" value="{user_id}">
					<div id="result_form" class="discord-token-form"><span id="result_text" style="padding-left: 10px; padding-top: 8px; position: absolute;">****************</span><i id="eye" class="fas fa-eye" style="float: right; padding: 12px; cursor: pointer;" onclick="showToken()"></i></div>
					<input type="submit" id="discord_token" value="Сгенерировать новый" style="margin-top: 5px;width: 180px;margin-right: 8px;">
					<div id="copy_button" class="div-button" onclick="copyToken('#token')">Копировать</div>
				</form>
				<div style="margin-top: 5px;">Отправьте данный токен нашему боту в дискорде для получения ролей.</div>
			</div>

			<div class="balance-window" style="float: right; height: 199px;">
				<h6 style="display: inline-block;">Установка префикса</h6> Только от Premium <a href="/img/colors.png" target="blank">Цвета<a>
				<form method="POST" id="ajax_form_prefix" style="margin: 0px;">
					<input type="hidden" name="login" value="{login}">
					<input id="token" type="hidden" name="hash" value="{discord_token}">
					<input type="text" name="prefix" id="prefix" maxlength="32" style="width: 368px;" placeholder="Префикс">
					<select name="server" class="balance-input" style="margin-top: 5px; width: 368px;">
						<option value="classic" class="balance-input">Classic</option>
						<option value="hitech" class="balance-input">Hi-tech</option>
						<option value="magic" class="balance-input">Magic</option>
					</select>
					<input type="hidden" name="type" value="2">
					<input type="submit" id="set_prefix" value="Установить" style="margin-top: 5px; width: 368px;">
				</form>
				<div id="result_form_prefix"></div>
			</div>

			<!--<div class="balance-window" style="float: right; height: 199px;">
			<h6>Информация</h6>
			<div style="margin-top: 5px;">Вы можете отправить токен повторно после покупки привилегии для получения соответствующей роли в дискорд сервере.<span style="margin-top: 15px;display: block;">Никогда и никому не показывайте свой токен ради безопасности.</span></div>
			</div>-->

			<script>
				document.querySelector('#hexels1').oninput = function(e){ this.value = this.value.replace(/[^\d&]/g, ''); }
				document.querySelector('#hexels2').oninput = function(e){ this.value = this.value.replace(/[^\d&]/g, ''); }

				let prefix = document.querySelector('#prefix');
				let regex = /[^\d&A-Za-zА-Яа-я]/g;
				
				prefix.oninput = function(e){ this.value = this.value.replace(regex, ''); }

				var eye = document.getElementById("eye");
				var discord_token = "{discord_token}";
				
				function showToken() {
					if (eye.classList.contains('fa-eye')) {
						eye.classList.remove('fa-eye');
						eye.classList.add('fa-eye-slash');
						document.getElementById("result_text").innerHTML = discord_token;
					} else {
						eye.classList.remove('fa-eye-slash');
						eye.classList.add('fa-eye');
						document.getElementById("result_text").innerHTML = "****************";
					}
				}

				function copyToken(el) {
					navigator.clipboard.writeText(discord_token);
					document.getElementById("copy_button").innerHTML = "Скопировано";
					
					setTimeout(function() { document.getElementById("copy_button").innerHTML = "Копировать"; }, 2000);
				}

				$( document ).ready(function() {
					$("#discord_token").click(
						function(){
							$(this).attr("disabled", "true");
							discord_token = sendAjaxDiscord('ajax_form_token', '/scripts/GameModules/GenerateDiscordToken.php', 'Непредвиденная ошибка генератора токенов');
				
							innerText = document.getElementById("result_text").innerHTML;
							if(innerText != '****************') {
								document.getElementById("result_text").innerHTML = '****************';
								eye.classList.remove('fa-eye-slash');
								eye.classList.add('fa-eye');
							}
							
							$('#discord_token').val('Токен обновлён');
							
							setTimeout(function() {
							document.getElementById("discord_token").removeAttribute("disabled");
							$('#discord_token').val('Сгенерировать новый');
							}, 2000);
								
							return false; 
						}
					);
				
				$("#set_prefix").click(
					function(){
						$(this).attr("disabled", "true");
						sendAjax('result_form_prefix', 'ajax_form_prefix', '/scripts/GameModules/SetPrefix.php', 'Непредвиденная ошибка');
						setTimeout(function() { document.getElementById("set_prefix").removeAttribute("disabled"); }, 2000);
						return false; 
					}
				);
				
				$("#spawn").click(
					function(){
						$(this).attr("disabled", "true");
						sendAjax('result_form2', 'ajax_form2', '/scripts/GameModules/TeleportToSpawn.php', 'Непредвиденная ошибка отправки команды');
						setTimeout(function() { document.getElementById("spawn").removeAttribute("disabled"); }, 2000);
						return false; 
					}
				);
				
				$("#balancem").click(
					function(){
						$(this).attr("disabled", "true");
						sendAjax('result_form3', 'ajax_form3', '/scripts/GameModules/BalanceManager.php', 'Непредвиденная ошибка менеджера баланса');
						setTimeout(function() { document.getElementById("balancem").removeAttribute("disabled"); }, 2000);
						return false; 
					}
				);
				
				$("#balancem2").click(
					function(){
						$(this).attr("disabled", "true");
						sendAjax('result_form3', 'ajax_form4', '/scripts/GameModules/BalanceManager.php', 'Непредвиденная ошибка менеджера баланса');
						setTimeout(function() { document.getElementById("balancem2").removeAttribute("disabled"); }, 2000);
						return false; 
					}
				);
				
				$("#deletecloak").click(
					function(){
						$(this).attr("disabled", "true");
						sendAjax('result_form3', 'ajax_form5', '/scripts/GameModules/RemoveCloak.php', 'Непредвиденная ошибка удаления плаща');
						setTimeout(function() { document.getElementById("deletecloak").removeAttribute("disabled"); }, 2000);
						return false; 
					}
				);
			});

			function sendAjax(result_form, ajax_form, url, error_answer) {
				$.ajax({
					url:     url,
					type:     "POST",
					dataType: "html",
					data: $("#"+ajax_form).serialize(),
					success: function(response) {
						result = $.parseJSON(response);
						$("#"+result_form).html(result.answer);
					},
					error: function(response) { $("#"+result_form).html(error_answer); }
				});
			}

			function sendAjaxDiscord(ajax_form, url, error_answer) {
				$.ajax({
					url:     url,
					type:     "POST",
					dataType: "html",
					data: $("#"+ajax_form).serialize(),
					success: function(response) {
						result = $.parseJSON(response);
						discord_token = result.answer;
					},
					error: function(response) { discord_token = error_answer; }
				});
				
			}
			</script>
		</div>

		<div class="news-link" style="padding:20px; overflow: hidden;">
			<div style="width: 830px;height: 38px;display: inline-block;margin-bottom: 16px;">
				<h1 class="ui-c1" style="border: none;padding: 0;display: block;float: left;">Достижения</h1>
				<h6 style="margin-top: 14px;position: relative;left: 10px;color: #828282;font-weight: 300;"><a href="/achievements.html">Посмотреть все</a></h6>
			</div>
			
			{include file="/scripts/GameModules/ShowAchievementsMinified.php"}
		
		</div>
	[/owner]
	{include file="/templates/Standart/admin.tpl"}
[/not-group]