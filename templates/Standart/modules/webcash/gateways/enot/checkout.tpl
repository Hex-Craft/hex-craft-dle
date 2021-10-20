{{ addon_settings_link|raw }}

<h5>{{ gateway_header }}</h5>

<div class="sepH_b">
	__('Инвойс №') {{ invoice_id }}
</div>

<div class="sepH_b">
	{% if email %} <b>__('Е-майл: ')</b> {{ email }} {% endif %}
</div>

<form id="pay" name="pay" method="GET" action="https://enot.io/pay" accept-charset="UTF-8">
	<input type="hidden" name="m" value="{{ gateway_cfg.merchant_login }}">
	<input type="hidden" name="oa" value="{{ amount }}">
	<input type="hidden" name="o" value="{{ invoice_id }}">
	<input type="hidden" name="s" value="{{ signature }}">
	<input type="hidden" name="cr" value="{{ gateway_cfg.currency }}">
	<input type="hidden" name="c" value="{{ description }}">
	<input type="hidden" name="success_url" value="{{ success_url }}">
	<input type="hidden" name="fail_url" value="{{ fail_url }}">
	
	<button type="submit">__('Далее')</button>
</form>