{{ addon_settings_link|raw }}

<h5>{{ gateway_header }}</h5>

<div class="sepH_b">
	__('Инвойс №') {{ invoice_id }}
</div>

<div class="sepH_b">
	{% if email %} <b>__('Е-майл: ')</b> {{ email }} {% endif %}
</div>

<form action="{{ checkout_url }}" method="post" accept-charset="utf-8">
	<input type="hidden" name="data" value="{{ data }}">
	<input type="hidden" name="signature" value="{{ signature }}">
	
	<input type="image" src="//static.liqpay.ua/buttons/p1{{ gateway_cfg.language }}.radius.png" name="btn_text" />
</form>