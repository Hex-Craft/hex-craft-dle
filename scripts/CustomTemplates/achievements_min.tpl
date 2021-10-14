{foreach $achievement_style as $key => $value}
	{foreach $achievements as $k => $v}
		{if $v.achievement_id == $value.achieve_id}
			{$yes = true}
			{break}
		{else}
			{$yes = false}
		{/if}
	{/foreach}
	{if $yes}
	<div class="achievement-container status-tooltip">
		<div style="display: inline-flex; width: 60px;">
			<i class="{$value.icon} achievement-icon-min" aria-hidden="true"></i><span class="achievement-icon-text-min">{if $value.quantity != 0}{$value.quantity}{/if}</span>
		</div>
	</div>
	{/if}
{/foreach}