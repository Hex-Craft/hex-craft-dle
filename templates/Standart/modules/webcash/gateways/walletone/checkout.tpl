{{ addon_settings_link|raw }}

<h5>{{ gateway_header }}</h5>

<div class="sepH_b">
	__('Инвойс №') {{ invoice_id }}
</div>

<div class="sepH_b">
	{% if email %} <b>__('Е-майл: ')</b> {{ email }} {% endif %}
</div>

<form id="pay" name="pay" method="POST" action="https://wl.walletone.com/checkout/checkout/Index" accept-charset="UTF-8">
	{% for key, value in fields %}
		{% if value is iterable %}
			{% for key2, value2 in value %}
				<input type="hidden" name="{{ key2 }}" value="{{ value2 }}">
			{% endfor %}
		{% else %}
			<input type="hidden" name="{{ key }}" value="{{ value }}">
		{% endif %}
	{% endfor %}
	
	<button type="submit">__('Далее')</button>
</form>