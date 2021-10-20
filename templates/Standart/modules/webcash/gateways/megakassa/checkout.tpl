{{ addon_settings_link|raw }}

<h5>{{ gateway_header }}</h5>

<div class="sepH_b">
	__('Инвойс №') {{ invoice_id }}
</div>

<div class="sepH_b">
	{% if email %} <b>__('Е-майл: ')</b> {{ email }} {% endif %}
</div>

<form id="pay" name="pay" method="POST" action="https://megakassa.ru/merchant/" accept-charset="UTF-8">
	<input type="hidden" name="shop_id" value="{{ merchant_id }}" />
	<input type="hidden" name="amount" value="{{ amount }}" /><!-- сумма платежа -->
	<input type="hidden" name="currency" value="{{ currency }}" />
	<input type="hidden" name="description" value="{{ description|raw }}" /><!--- Описание товара или услуги.-->
	<input type="hidden" name="order_id" value="{{ invoice_id }}" />
	<input type="hidden" name="method_id" value="{{ method_id }}" />
	<input type="hidden" name="client_email" value="{{ client_email }}" />
	<input type="hidden" name="debug" value="{{ debug }}" />
	<input type="hidden" name="language" value="{{ language }}" />
	<input type="hidden" name="signature" value="{{ signature }}" />
	
	<button type="submit" data-name="submit">__('Далее')</button>
</form>