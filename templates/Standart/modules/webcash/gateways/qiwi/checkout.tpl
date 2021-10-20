{{ addon_settings_link|raw }}

<h5>{{ gateway_header }}</h5>

<div class="sepH_b">
	__('Инвойс №') {{ invoice_id }}
</div>

<div class="sepH_b">
	{% if email %} <b>__('Е-майл: ')</b> {{ email }} {% endif %}
</div>

<form id="pay" name="pay" method="GET" action="https://oplata.qiwi.com/create" accept-charset="UTF-8">
	<input type="hidden" name="billId" value="{{ invoice_id }}">
	<input type="hidden" name="amount" value="{{ amount }}">
	<input type="hidden" name="successUrl" value="{{ success_url }}">
	<input type="hidden" name="comment" value="{{ description }}">
	<input type="hidden" name="email" value="{{ email }}">
	<input type="hidden" name="publicKey" value="{{ gateway_cfg.public_key }}">
	
	<button type="submit">__('Далее')</button>
</form>