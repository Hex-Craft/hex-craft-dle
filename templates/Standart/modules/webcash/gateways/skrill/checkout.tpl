{{ addon_settings_link|raw }}

<h5>{{ gateway_header }}</h5>

<div class="sepH_b">
	__('Инвойс №') {{ invoice_id }}
</div>

<div class="sepH_b">
	{% if email %} <b>__('Е-майл: ')</b> {{ email }} {% endif %}
</div>

<form action="{{ url }}" method="post">
	<input type="hidden" name="language" value="EN"/>
	
	{% for key, value in data %}
		<input type="hidden" name="{{ key }}" value="{{ value|raw }}">
	{% endfor %}
	
	<input class="btn btn-primary" type="submit" value="__('Далее')" id="payment_button"/>
	
</form>