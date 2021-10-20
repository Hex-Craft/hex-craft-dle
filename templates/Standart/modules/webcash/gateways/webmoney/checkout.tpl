{{ addon_settings_link|raw }}

<h5>{{ gateway_header }}</h5>

<div class="sepH_b">
	__('Инвойс №') {{ invoice_id }}
</div>

<div class="sepH_b">
	{% if email %} <b>__('Е-майл: ')</b> {{ email }} {% endif %}
</div>

<form id="pay" name="pay" method="POST" action="https://merchant.webmoney.ru/lmi/payment_utf.asp{% if gw_item.at %}?at={{ gw_item.at }}{% endif %}" accept-charset="utf-8">
	<input type="hidden" name="LMI_PAYMENT_NO" value="{{ invoice_id }}">
	<input type="hidden" name="LMI_PAYMENT_AMOUNT" id="AMOUNT" value="{{ amount }}"> <!-- сумма платежа -->
	<input type="hidden" name="LMI_PAYMENT_DESC_BASE64" value="{{ lmi_payment_desc_base64 }}"><!--- Описание товара или услуги.-->
	<input type="hidden" name="LMI_PAYEE_PURSE" id="PURSE" value="{{ lmi_payee_purse }}"> <!--- куда переводить-->
	<input type="hidden" name="LMI_MODE" value="{{ gateway_cfg.test_mode }}">
	<input type="hidden" name="LMI_SIM_MODE" value="{{ gateway_cfg.lmi_sim_mode }}"> <!--- тестовый режим 0-успешно; 1-ошибка; 2-80% успешно-->
	<input type="hidden" name="LMI_RESULT_URL" value="{{ processing_url }}">
	<input type="hidden" name="LMI_SUCCESS_URL" value="{{ success_url }}">
	<input type="hidden" name="LMI_FAIL_URL" value="{{ fail_url }}">
	<input type="hidden" name="address" value="{{ ip }}">
	
	<input type="hidden" name="user_email" value="{{ email }}">
	
	{% if gw_item.LMI_ALLOW_SDP >= 0 %}<input type="hidden" name="LMI_ALLOW_SDP" value="{{ gw_item.LMI_ALLOW_SDP }}">{% endif %}
	{% if gw_item.LMI_SDP_TYPE >= 0 %}<input type="hidden" name="LMI_SDP_TYPE" value="{{ gw_item.LMI_SDP_TYPE }}">{% endif %}
	
	<button type="submit" name="submit">__('Далее')</button>
</form>