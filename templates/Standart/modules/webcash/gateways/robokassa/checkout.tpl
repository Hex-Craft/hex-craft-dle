{{ addon_settings_link|raw }}

<h5>{{ gateway_header }}</h5>

<div class="sepH_b">
	__('Инвойс №') {{ invoice_id }}
</div>

<div class="sepH_b">
	{% if email %} <b>__('Е-майл: ')</b> {{ email }} {% endif %}
</div>

<form id="pay" name="pay" method="POST" action="https://auth.robokassa.ru/Merchant/Index.aspx" accept-charset="UTF-8">
	<input type="hidden" name="MerchantLogin" value="{{ gateway_cfg.merchant_login }}">
	<input type="hidden" name="InvId" value="{{ invoice_id }}">
	<input type="hidden" name="OutSum" value="{{ amount }}">
	<input type="hidden" name="Description" value="{{ description }}">
	<input type="hidden" name="Email" value="{{ email }}">
	<input type="hidden" name="SignatureValue" value="{{ signature }}">
	<input type="hidden" name="Culture" value="{{ gateway_cfg.language }}">
	
	{% if gateway_cfg.currency != 'RUB' %}
		<input type="hidden" name="OutSumCurrency" value="{{ gateway_cfg.currency }}">
	{% endif %}
	
	{% if gateway_cfg.test_mode %}
		<input type="hidden" name="IsTest" value="1">
	{% endif %}
	
	<button type="submit">__('Далее')</button>
</form>