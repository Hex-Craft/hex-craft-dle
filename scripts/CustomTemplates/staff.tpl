<span class="name-rog">
	<div class="news-link" style="padding:20px;">
		<div class="plugins_container" style="height: 465px;">
			<div class="staff-conatiner" style="padding-top:20px;" onclick="ShowProfile('Hexagon', 'https://hex-craft.ru/user/Hexagon/', '1'); return false;">
				<div class="plugin_img" style='background-image:url("/skin.php?user=Hexagon");background-repeat:no-repeat;width:130px;padding:0px 0px 310px;cursor: pointer;'>
					<br>
				</div>
				<hr style="margin-top:0px;margin-bottom:0px;">
				<div class="plugin_name">Hexagon</div>
				<div class="staff-desc">Основатель проекта<br>Главный администратор</div>
			</div>
			<div class="staff-conatiner" style="padding-top:20px;"onclick="ShowProfile('_MIMBOL_', 'https://hex-craft.ru/user/_MIMBOL_/', '1'); return false;">
				<div class="plugin_img" style='background-image:url("/skin.php?user=_MIMBOL_");background-repeat:no-repeat;width:130px;padding:0px 0px 310px;cursor: pointer;'>
					<br>
				</div>
				<hr style="margin-top:0px;margin-bottom:0px;">
				<div class="plugin_name">_MIMBOL_</div>
				<div class="staff-desc">Технический Администратор</div>
			</div>
			<div class="staff-conatiner" style="padding-top:20px;"onclick="ShowProfile('Ast_69', 'https://hex-craft.ru/user/Ast_69/', '1'); return false;">
				<div class="plugin_img" style='background-image:url("/skin.php?user=Ast_69");background-repeat:no-repeat;width:130px;padding:0px 0px 310px;cursor: pointer;'>
					<br>
				</div>
				<hr style="margin-top:0px;margin-bottom:0px;">
				<div class="plugin_name">Ast_69</div>
				<div class="staff-desc">Билдер проекта<br>Автор спавнов</div>
			</div>
			<div class="staff-conatiner" style="padding-top:20px;"onclick="ShowProfile('Midipon', 'https://hex-craft.ru/user/Midipon/', '1'); return false;">
				<div class="plugin_img" style='background-image:url("/skin.php?user=Midipon");background-repeat:no-repeat;width:130px;padding:0px 0px 310px;cursor: pointer;'>
					<br>
				</div>
				<hr style="margin-top:0px;margin-bottom:0px;">
				<div class="plugin_name">Midipon</div>
				<div class="staff-desc">Супер-спонсор<br>Создатель ДС бота</div>
			</div>
		</div>
		<span style="font-size:30px;text-align:center;display:inline-block;">Модераторы серверов</span>
		<br>
		<span style="font-size:24px;">CLASSIC</span>
		<div class="plugins_container" style="height: 450px;">
			{foreach from=$classic_moderators item=classic_moderator}
				<div class='shop_panel' style='padding-top:20px;'>
					<div class='plugin_img' style='background-image: url("/skin.php?user={$classic_moderator.username}"); background-repeat:no-repeat; width:130px; padding:0px 0px 270px;'><br></div>
					<hr style='margin-top:0px;margin-bottom:5px;'>
					<div class='plugin_name'>{$classic_moderator.username}</div>
					<div class='plugin_desc'>Модератор</div>
				</div>
			{/foreach}
			<div class='shop_panel' style='padding-top:20px;'>
				<div class='plugin_img' style='background-image:url("/skin.php?user=");background-repeat:no-repeat;width:130px;padding:0px 0px 270px;'><br></div>
				<hr style='margin-top:0px;margin-bottom:5px;'>
				<div class='plugin_name'></div>
				<div class='plugin_desc'>Здесь можешь быть ты!</div>
			</div>
		</div>
		<span style="font-size:24px;">Hi-Tech</span>
		<div class="plugins_container" style="height: 450px;">
			{foreach from=$hitech_moderators item=hitech_moderator}
				<div class='shop_panel' style='padding-top:20px;'>
					<div class='plugin_img' style='background-image: url("/skin.php?user={$hitech_moderator.username}"); background-repeat:no-repeat; width:130px; padding:0px 0px 270px;'><br></div>
					<hr style='margin-top:0px;margin-bottom:5px;'>
					<div class='plugin_name'>{$hitech_moderator.username}</div>
					<div class='plugin_desc'>Модератор</div>
				</div>
			{/foreach}
			<div class='shop_panel' style='padding-top:20px;'>
				<div class='plugin_img' style='background-image:url("/skin.php?user=");background-repeat:no-repeat;width:130px;padding:0px 0px 270px;'><br></div>
				<hr style='margin-top:0px;margin-bottom:5px;'>
				<div class='plugin_name'></div>
				<div class='plugin_desc'>Здесь можешь быть ты!</div>
			</div>
		</div>
	</div>
</span>