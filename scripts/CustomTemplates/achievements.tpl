<div class="news-link" style="padding:20px; margin-bottom: 0px; font-weight: 300; overflow: auto; margin-bottom: 20px;">
	{foreach $achievement_style as $key => $value}
			<div class="balance-window" style="width: 830px; height: 100px">
				{foreach $achievements as $k => $v}
					{if $v.achievement_id == $value.achieve_id}
						{$yes = true}
						{break}
					{else}
						{$yes = false}
					{/if}
				{/foreach}
				{if $yes}
				<div style="display: inline-flex; width: 60px;">
					<i class="{$value.icon} achievement-icon" aria-hidden="true"></i>
					<span class="achievement-icon-text">{if $value.quantity != 0}{$value.quantity}{/if}</span>{$new_key}
				</div>
				{else}
					<div style="display: inline-flex; width: 60px;"><i class="fas fa-question achievement-icon"></i></div>
				{/if}
				<span style="padding-left: 20px; font-size: 24px; position: absolute;">{$value.name}</span> 
				<span style="padding: 30px 0 0 20px; font-size: 20px; position: absolute;">{$value.description}</span>
				<span style="position: absolute; margin-left: 450px; font-size: 24px;">Награда: {$value.reward}.000Н</span>
				{if $yes} 
					<i class="fas fa-check" style="float: right;padding: 15px;"></i>
				{else}
					<i class="fas fa-times" style="float: right;padding: 15px 20px;"></i>
				{/if}
			</div>
	{/foreach}
</div>