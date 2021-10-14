{{ addon_settings_link|raw }}

<h5>{{ gateway_header }}</h5>

<div class="sepH_b">
	__('Инвойс №') {{ invoice_id }}
</div>

<div class="sepH_b">
	{% if email %} <b>__('Е-майл: ')</b> {{ email }} {% endif %}
</div>

<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
	<input type="hidden" name="cmd" value="_xclick">
	<input type="hidden" name="business" value="{{ gateway_cfg.paypal_account }}">
	<input type="hidden" name="custom" value="{{ invoice_id }}">
	<input type="hidden" name="currency_code" value="{{ gateway_cfg.currency }}">
	<input type="hidden" name="amount" value="{{ amount }}">
	<input type="hidden" name="charset" value="utf-8">
	<input type="hidden" name="item_name" value="{{ item_name }}">
	
	<input name="no_shipping" type="hidden" value="1">
	<input name="return" type="hidden" value="{{ success_url }}">
	<input name="cancel_return" type="hidden" value="{{ fail_url }}">

	<input name="notify_url" type="hidden" value="{{ processing_url }}">
	
	<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
	
	<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form>