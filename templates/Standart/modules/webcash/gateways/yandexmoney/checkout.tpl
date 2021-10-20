{{ addon_settings_link|raw }}

<h5>{{ gateway_header }} ({{ gw_item_id == 1 ? '__('Оплата из кошелька')' : '__('Оплата банковской картой')' }})</h5>

<div class="sepH_b">
	__('Инвойс №') {{ invoice_id }}
</div>

<div class="sepH_b">
	{% if email %} <b>__('Е-майл: ')</b> {{ email }} {% endif %}
</div>
<div class="sepH_b">
	{% if gw_item_id == 1 %} <b>__('Внимание!')</b> __('При платеже из кошелька не указывайте код протекции, в противном случае процесс оплаты затянется по времени.') {% endif %}
</div>

<form name="payment" id="pay" method="POST" action="https://yoomoney.ru/quickpay/confirm.xml">
	<input type="hidden" name="receiver" value="{{ gateway_cfg.receiver }}">
	<input type="hidden" name="formcomment" value="{{ payment_desc }}">
	<input type="hidden" name="short-dest" value="{{ payment_desc }}">
	<input type="hidden" name="label" value="{{ invoice_id }}">
	<input type="hidden" name="quickpay-form" value="{{ gateway_cfg.quickpay_form }}">
	<input type="hidden" name="targets" value="{{ payment_desc }}, ID{{ invoice_id }}">
	<input type="hidden" name="sum" value="{{ amount }}" data-type="number">
	<input type="hidden" name="successURL" value="{{ success_url }}">
	
	<input type="hidden" name="paymentType" value="{{ gw_item_id == 1 ? 'PC' : 'AC' }}">
	
	<button type="submit" name="submit">__('Далее')</button>
</form>