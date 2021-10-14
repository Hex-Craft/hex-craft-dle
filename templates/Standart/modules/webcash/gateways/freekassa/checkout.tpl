{{ addon_settings_link|raw }}

<h5>{{ gateway_header }}</h5>

<div class="sepH_b">
	__('Инвойс №') {{ invoice_id }}
</div>

<div class="sepH_b">
	{% if email %} <b>__('Е-майл: ')</b> {{ email }} {% endif %}
</div>

<form id="pay" name="pay" method="GET" action="https://www.free-kassa.ru/merchant/cash.php" accept-charset="UTF-8">
	<input type="hidden" name="m" value="{{ merchant_id }}" />
	<input type="hidden" name="oa" value="{{ amount }}" /><!-- сумма платежа -->
	<input type="hidden" name="o" value="{{ invoice_id }}" />
	<input type="hidden" name="s" value="{{ signature }}" />
	<input type="hidden" name="em" value="{{ email }}" />
	<input type="hidden" name="lang" value="{{ language }}" />
	
	<button type="submit" data-name="submit">__('Далее')</button>
</form>