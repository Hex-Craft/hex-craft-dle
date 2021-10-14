[group=1]
<div class="news-link" style="padding: 20px; overflow: auto;">
	<div style="margin-bottom: 20px; display: flex; justify-content: space-between;">
		<a href="https://panel.hex-craft.ru" class="btn-drop">
			<i class="fas fa-terminal" style="display: block;padding-top: 7px;"></i>
			<span style="margin-top: -15px; display: block;">Pterodactyl</span>
		</a>
		<a href="/phpmyadmin" target="_blank" class="btn-drop">
			<i class="fas fa-database" style="display: block;padding-top: 7px;"></i>
			<span style="margin-top: -15px; display: block;">PhpMyAdmin</span>
		</a>
		<a href="#" target="_blank" class="btn-drop">
			<i class="fa fa-industry" style="display: block;padding-top: 7px;"></i>
			<span style="margin-top: -15px; display: block;">Заглушка</span>
		</a>
		<a href="#" target="_blank" class="btn-drop">
			<i class="fa fa-robot" style="display: block;padding-top: 7px;"></i>
			<span style="margin-top: -15px; display: block;">Заглушка</span>
		</a>
	</div>
	
	<div class="balance-window" style="float: left;">
		<h6>Управление валютой пользователей</h6>
		<form method="POST" id="ajax_giver" style="margin: 0px;">
			<input type="hidden" name="login" value="{login}">
			<input type="hidden" name="hash" value="{discord_token}">
			<input type="text" name="value" style="width: 368px;" placeholder="Количество">
			<input type="text" name="name" style="margin-top: 5px; width: 368px;" placeholder="Никнейм">
			<input type="hidden" name="initiator" value="{login}" hidden>
			<select name="destination" class="balance-input" style="margin-top: 5px; width: 368px;">
				<option value="hexels" class="balance-input">Хексели</option>
				<option value="coins" class="balance-input">Монеты</option>
				<option value="classic" class="balance-input">Classic</option>
				<option value="hitech" class="balance-input">Hi-tech</option>
				<option value="magic" class="balance-input">Magic</option>
			</select>
			<input type="submit" id="give" value="Отправить" style="margin-top: 5px; width: 368px;">
			<span id="result_giver"></span>
		</form>
	</div>

	<div class="balance-window" style="height: 244px;">
		<h6>Заглушка</h6>
	</div>
	
</div>

<script>
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
			error: function(response) {
				$("#"+result_form).html(error_answer);
			}
		});
	}
	
	$("#give").click(
		function(){
			sendAjax('result_giver', 'ajax_giver', '/scripts/Admin/GiveCurrency.php', 'Непредвиденная ошибка.');
			return false; 
		}
	);
</script>
[/group]