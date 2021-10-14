<div class="upbalance_plugin_wrapper">
	<h2>__('Пополнение баланса через платежную систему')</h2>
	
	{{ addon_settings_link|raw }}
	
	<div>
		<form class="webcash_ajax_form" autocomplete="off">
			<input type="hidden" name="action" value="checkout_set_store_and_redirect">
			<input type="hidden" name="plg_alias" value="upbalance" />
			<input type="hidden" name="user_hash" value="{{ user_hash }}" />
			
			<b style="font-size: 18px;">__('Укажите сумму пополнения')</b> <input type="text" value="{{ amount }}" name="amount" id="amount" /><br />
			
			<button id="step_amount_button" type="submit" class="btn-drop balance-btn"><span>__('Далее')</span></button>
			<a href="{{ payments_log_url }}" title="__('Просмотреть Ваши платежи для пополнения баланса')" class="btn-drop balance-btn">__('История пополнений')</a>
		</form>
	</div>
	
	
	<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		jQuery("#step_amount_button").click(function() {
			var val = jQuery("#amount").val();
			if (!parseFloat(val)) {
				WEBCASH.error("__('Введите сумму пополнения')");
				return false;
			}
		});
	});
	</script>
	

	
</div>