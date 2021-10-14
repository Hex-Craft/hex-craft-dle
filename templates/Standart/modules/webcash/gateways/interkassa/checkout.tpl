{{ addon_settings_link|raw }}

Переход в платежную систему {{ gateway_header }}<br>
__('Инвойс №') {{ invoice_id }}<br>
{% if email %} <b>__('Ваш Email: ')</b> {{ email }} {% endif %}

<h4>
	__('Перед оплатой проверьте правильность всех данных!')<br>
</h4>

<form id="pay" name="pay" method="POST" action="https://sci.interkassa.com/" accept-charset="UTF-8">
	<input type="hidden" name="ik_co_id" value="{{ params.ik_co_id }}" />
	<input type="hidden" name="ik_am" value="{{ params.ik_am }}" /><!-- сумма платежа -->
	<input type="hidden" name="ik_pm_no" value="{{ params.ik_pm_no }}" />
	<input type="hidden" name="ik_cur" value="{{ params.ik_cur }}" />
	
	<input type="hidden" name="ik_desc" value="{{ params.ik_desc|raw }}" /><!--- Описание товара или услуги.-->
	<input type="hidden" name="ik_suc_u" value="{{ params.ik_suc_u }}" />
	<input type="hidden" name="ik_fal_u" value="{{ params.ik_fal_u }}" />
	<input type="hidden" name="ik_pnd_u" value="{{ params.ik_pnd_u }}" />
	<input type="hidden" name="ik_ia_u" value="{{ params.ik_ia_u }}" />
	
	{% if params.ik_pw_via %}
		<input type="hidden" name="ik_pw_via" value="{{ params.ik_pw_via }}" />
	{% endif %}
	
	{% if params.payments_systems %}
		<input type="hidden" name="payment_metod" value="" />
	{% endif %}
	
	<input type="hidden" name="ik_sign" value="{{ params.ik_sign }}" />
	
	<button type="submit" data-name="submit" class="btn-drop balance-btn">__('Далее')</button>
</form>