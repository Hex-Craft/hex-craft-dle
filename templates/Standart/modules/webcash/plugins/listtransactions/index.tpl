<div class="listtransactions_plugin_wrapper">
	<h2>__('История Ваших платежей и транзакций на балансе')</h2>
	
	{{ addon_settings_link|raw }}
	
	
	<div class="sepH_b">
		<a href="{{ payments_log_url }}" title="__('Просмотреть Ваши платежи через шлюзы')" class="wc-button-link sepV_c {{ GET.log == 'payments' ? 'wc-btn-active' : '' }}">__('История платежей')</a>
		
		<a href="{{ balance_transactions_log_url }}" title="__('Просмотреть Ваши движения на балансе (приход/расход)')" class="wc-button-link {{ GET.log == 'balance_transactions' ? 'wc-btn-active' : '' }}">__('История движений на балансе')</a>

	</div>
	
	<div class="sepH_b">
		{{ payments_log_html|raw }}
	</div>

</div>