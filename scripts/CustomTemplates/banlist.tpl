<h2>Classic</h2>
<table>
	<tr>
		<th style = 'width: 200px;'>Ник</th>
		<th style='width: 150px;'>Дата окончания</th>
		<th style='width: 150px;'>Дата выдачи</th>
		<th style='width: 300px;'>Нарушение</th>
	</tr>
</table>
<div style="overflow-y: scroll; max-height: 500px">
	<table style="border-top: none;">
		<tr>
			<th style = 'width: 200px; padding: 0;'></th>
			<th style = 'width: 150px; padding: 0;'></th>
			<th style = 'width: 150px; padding: 0;'></th>
			<th style = 'width: 300px; padding: 0;'></th>
		</tr>
		{foreach from=$classic_bans item=classic_ban}
		<tr><th>{$classic_ban.username}</th><th>
		{if $classic_ban.BannedUntil == -1}
			Навсегда
		{else}
			{$dateUntil=$classic_ban.BannedUntil/1000}
			{$dateUntil|date_format}
		{/if}
		{$dateAt=$classic_ban.BannedAt/1000}
		</th><th>{$dateAt|date_format}</th>
		<th>{$classic_ban.BanReason|replace:'&7':''}</th>
		{/foreach}
	</table>
</div>
<hr>
<h2>Hi-Tech</h2>
<table>
	<tr>
		<th style = 'width: 200px;'>Ник</th>
		<th style = 'width: 150px;'>Дата окончания</th>
		<th style = 'width: 150px;'>Дата выдачи</th>
		<th style = 'width: 300px;'>Нарушение</th>
	</tr>
</table>
<div style="overflow-y: scroll; max-height: 500px">
	<table style="border-top: none;">
		<tr>
			<th style = 'width: 200px; padding: 0;'></th>
			<th style = 'width: 150px; padding: 0;'></th>
			<th style = 'width: 150px; padding: 0;'></th>
			<th style = 'width: 300px; padding: 0;'></th>
		</tr>
		{foreach from=$classic_bans item=classic_ban}
		<tr><th>{$classic_ban.username}</th><th>
		{if $classic_ban.BannedUntil == -1}
			Навсегда
		{else}
			{$dateUntil=$classic_ban.BannedUntil/1000}
			{$dateUntil|date_format}
		{/if}
		{$dateAt=$classic_ban.BannedAt/1000}
		</th><th>{$dateAt|date_format}</th>
		<th>{$classic_ban.BanReason|replace:'&7':''}</th>
		{/foreach}
	</table>
</div>