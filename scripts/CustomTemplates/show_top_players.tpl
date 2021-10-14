<span class="name-rog">
	<div class="news-link" style="padding:20px; height: auto; color: #828282; font-weight: 300; overflow: auto;">
		<span style="font-size: 20px; display: block; margin-bottom: 10px;">Здесь можно увидеть топы игроков по разным категориям, а именно: по кол-ву доната, кол-ву голосов за проект, уровню профессий на сервере Classic и по времени игры на сервере Classic и Hi-Tech.</span>
		<div id="topdonaters" style="display: block; position: relative; float: left; margin-bottom: 10px; height: 1272px; float: left;">
			<table>
				<tr>
					<th style='width: 50px;'></th>
					<th style = 'width: 150px; text-align: left;padding: 0;'>Ник</th>
					<th style='text-align: left;padding: 0;'>Количество монет</th>
				</tr>
				{foreach from=$donaters item=donater}
				<tr>
					<th><img src='/skin.php?user={$donater.name}&mode=3' class='playerimg'></th>
					<th style='text-align: left;'>
						<span class='playername'>
							<a style="cursor: pointer;"onclick="ShowProfile('{$donater.name}', 'https://hex-craft.ru/user/{$donater.name}/', '1'); return false;">{$donater.name}</a>
						</span>
					</th>
					<th style='text-align: left; width: 192px'>{$donater.coins}
					</th>
				</tr>
				{/foreach}
			</table>
		</div>
		<div id="topvoters" style="display: block; position: relative; float: right; margin-bottom: 10px;">
			<table>
				<tr>
					<th style='width: 50px;'></th>
					<th style = 'width: 150px; text-align: left;padding: 0;'>Ник</th>
					<th style='text-align: left;padding: 0;'>Количество голосов</th>
				</tr>
				{foreach from=$top_voters item=top_voter}
				<tr>
					<th><img src='/skin.php?user={$top_voter.name}&mode=3' class='playerimg'></th>
					<th style='text-align: left;'>
						<span class='playername'>
							<a style="cursor: pointer;"onclick="ShowProfile('{$top_voter.name}', 'https://hex-craft.ru/user/{$top_voter.name}/', '1'); return false;">{$top_voter.name}</a>
						</span>
					</th>
					<th style='text-align: left; width: 192px'>{$top_voter.votes}
					</th>
				</tr>
				{/foreach}
			</table>
		</div>
		<div id="topworkers" style="display: block; position: relative; float:left; margin-bottom: 10px; height: 1272px;">
			<table>
				<tr>
					<th style="width: 50px;"></th>
					<th style = "width: 150px; text-align: left;padding: 0;">Ник</th>
					<th style="text-align: left;padding: 0;">Уровень профессий</th>
				</tr>
				{foreach from=$top_jobers item=top_jober}
					<tr>
						<th>
							<img src="/skin.php?user={$top_jober.username}&mode=3" class="playerimg">
						</th>
						<th style="text-align: left;">
							<span class="playername">
								<a style="cursor: pointer;" onclick="ShowProfile('{$top_jober.username}', 'https://hex-craft.ru/user/{$top_jober.username}/', '1'); return false;">{$top_jober.username}</a>
							</span>
						</th>
						<th style="text-align: left; width: 192px;">{$top_jober.level} уровень</th>
					</tr>
				{/foreach}
			</table>
		</div>
		<div id="toptimeclassic" style="display: block; position: relative; float: right;">
			<table>
				<tr>
					<th style='width: 50px;'></th>
					<th style = 'width: 150px; text-align: left;padding: 0;'>Ник</th>
					<th style='text-align: left;padding: 0;'>Время в игре</th>
				</tr>
				{foreach from=$classic_players item=classic_player}
				<tr>
					<th><img src='/skin.php?user={$classic_player.username}&mode=3' class='playerimg'></th>
					<th style='text-align: left;'>
						<span class='playername'>
							<a style="cursor: pointer;" onclick="ShowProfile('{$classic_player.username}', 'https://hex-craft.ru/user/{$classic_player.username}/', '1'); return false;">{$classic_player.username}</a>
						</span>
					</th>
					<th style='text-align: left;font-size: 14px;'>
						{$classic_player.TotalPlayTime}
					</th>
				</tr>
				{/foreach}
			</table>
		</div>
		<div id="toptimehitech" style="display: block; position: relative; float:right;">
			<table>
				<tr>
					<th style='width: 50px;'></th>
					<th style = 'width: 150px; text-align: left;padding: 0;'>Ник</th>
					<th style='text-align: left;padding: 0;'>Время в игре</th>
				</tr>
				{foreach from=$hitech_players item=hitech_player}
				<tr>
					<th><img src='/skin.php?user={$classic_player.username}&mode=3' class='playerimg'></th>
					<th style='text-align: left;'>
						<span class='playername'>
							<a style="cursor: pointer;" onclick="ShowProfile('{$hitech_player.username}', 'https://hex-craft.ru/user/{$hitech_player.username}/', '1'); return false;">{$hitech_player.username}</a>
						</span>
					</th>
					<th style='text-align: left;font-size: 14px;'>
						{$hitech_player.TotalPlayTime}
					</th>
				</tr>
				{/foreach}
			</table>
		</div>
		
	</div>
</span>