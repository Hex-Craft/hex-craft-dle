<a href="/?do=static&page=clan" style="position: absolute; top: 7px; left: -25px;"><i class="fas fa-arrow-left"></i></a>
<div style="margin: 20px 0 20px 20px; height: 400px; width: 200px; float: left;">
	<div style="height: 400px; width: 200px; position: absolute; background-color: {$banner_color}"></div>
	{$clan_banner}
</div>
<ul class="usinf" style="margin: 20px 150px 0 0; padding: 0; float: right; font-size: 24px;">
	<li>
		<div class="ui-c1 grey">Название</div>
		{$clan.name}
	</li>
	<li>
		<div class="ui-c1 grey">Тег</div>
		{$clan.tag}
	</li>
	<li>
		<div class="ui-c1 grey">Игроки</div>
		{$clan_players}
	</li>
	<li>
		<div class="ui-c1 grey">Верифицирован</div>
		{$clan.verified}
	</li>
	<li>
		<div class="ui-c1 grey">Friendly-fire</div>
		{$clan.friendly_fire}
	</li>
	<li>
		<div class="ui-c1 grey">Вы лидер</div>
		{$clan.leader}
	</li>
	<li>
		<div class="ui-c1 grey">Основан</div>
		{$clan.founded}
	</li>
	<li>
		<div class="ui-c1 grey">Последний онлайн</div>
		{$clan.last_used}
	</li>
	<li>
		<div class="ui-c1 grey">Баланс</div>
		{$clan.balance} хекселей
	</li>
</ul>
<table>
	<tbody>
		<tr>
			<td></td>
			<td>Ник</td>
			<td>Убийства</td>
			<td>Смерти</td>
			<td style="text-align: center;">Последний онлайн</td>
			<td>Присоеденился</td>
			<td style="text-align: center;">Действие</td>
		</tr>
		{foreach from=$players item=player}
		<tr>
			<td><img src='/skin.php?user={$player.nick}&mode=3' class='playerimg'></td>
			<td><a style="cursor: pointer;"onclick="ShowProfile('{$player.nick}', 'https://hex-craft.ru/user/{$player.nick}/', '1'); return false;">{$player.nick}</a></td>
			<td style="text-align: center;">{$player.kills}</td>
			<td style="text-align: center;">{$player.deaths}</td>
			<td style="text-align: center;">{$player.last_seen}</td>
			<td style="text-align: center;">{$player.join_date}</td>
			<td style="text-align: center;">
				{if $clan.leader_bool eq 1}
					{if $player.nick neq $member_id}
						<a href="/scripts/GameModules/KickFromClan.php?kick={$player.nick}&leader={$member_id}&hash={$hash}">Выгнать</button>
					{/if}
				{else}
					-
				{/if}
			</td>
		</tr>
		{/foreach}
	</tbody>
</table>