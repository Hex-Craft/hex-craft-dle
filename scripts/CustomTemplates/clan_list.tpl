<table style="margin: 0 auto;">
	<tbody>
		<tr>
			<td>Название</td>
			<td>Убийства</td>
			<td>Смерти</td>
			<td>KDR</td>
			<td>Последний онлайн</td>
			<td style="text-align: center;">Основан</td>
			<td>Баланс</td>
		</tr>
		{foreach from=$clans item=clan}
		<tr>
			<td style="text-align: center; font-weight: 1000;"><a href="/?do=static&page=clan&tag={$clan.tag}">{$clan.name}</a></td>
			<td style="text-align: center;">{$clan.kills}</td>
			<td style="text-align: center;">{$clan.deaths}</td>
			<td style="text-align: center;">{$clan.kdr}</td>
			<td style="text-align: center;">{$clan.last_used}</td>
			<td style="text-align: center;">{$clan.founded}</td>
			<td style="text-align: center;">{$clan.balance}</td>
		</tr>
		{/foreach}
	</tbody>
</table>