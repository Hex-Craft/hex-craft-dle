<div class="gateways_block checkout_step_{{ step }}">
	
	<span style="font-size: 18px;">
		__('Оплата товара-услуги: ')
		{% if checkout_header %} {{ checkout_header|raw }} {% endif %}
		{% if amount_value %} __('на ') {{ amount_value|currCnvDcl }} {% endif %}<br>
	</span>
	
	{% if step == 'email' %}
	
		<h3>__('Укажите свой Емайл-адрес')</h3>
		
		<form class="webcash_ajax_form" autocomplete="off">
			<input type="hidden" name="action" value="checkout_email_step">
			<input type="hidden" name="plg_alias" value="{{ plg_alias }}" />
			<input type="hidden" name="user_hash" value="{{ user_hash }}" />
			<input type="hidden" name="cs_key" value="{{ cs_key }}">
			
			<b>__('Необходимо указать Емайл-адрес') <span style="color:red;">*</span></b> <input type="text" value="{{ email }}" name="email" id="email" /><br /><br />
			
			<button id="step_amount_button" type="submit"><span>__('Далее')</span></button>
		</form>
		
		
		
		<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
			jQuery("#step_amount_button").click(function() {
				var val = jQuery("#email").val();
				if (!val) {
					WEBCASH.error("__('Введите свой Емайл')");
					return false;
				}
			});
		});
		</script>
		
	{% elseif step == 'redirect' %}
	
		<h3>__('Перенаправление на страницу оплаты...')</h3>
		
		
		<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
			(function($) {
				ShowLoading("");
				$.post(WEBCASH_OPTIONS.SITE_AJAX_URL, JSON.parse('{{ source_array|raw }}'), function( data ) {
					WEBCASH.showResponse(data);
				}, "json")
				.fail(function(response) {
					HideLoading();
					WEBCASH.showAjaxError(response);
				});
			})(jQuery);
		});
		</script>
		
	{% elseif step == 'choose_payment_method' %}
	
		<h3>__('Выберите способ оплаты.')</h3>
		
		<div class="gateways_choose_method">

			{% for gw_alias, gateway in gateways %}
			
				<h3>{{ gateway.name }}</h3>

				{{ gateway.addon_settings_link|raw }}
				
				<ul>

					{% for key, item in gateway.items %}
					
						<li class="gw_item">
							<a href="{{ SITEURL }}/index.php?do=webcash&action=checkout&step={{ next_step }}&cs_key={{ cs_key }}&gw_alias={{ gw_alias }}&item={{ key }}" title="{{ item.title }}">
								
								<img src="{{ MODULEURL }}gateways/{{ gw_alias }}/assets/images/{{ item.image }}" alt="{{ item.title }}" />	
								
								<p><span>{{ item.title }}</span></p>
							</a>
						</li>
						
					{% endfor %}

				</ul>

				<div class="clearfix"></div>
			
			{% endfor %}
		
		</div>
		
	{% elseif step == 'to_gateway' %}
		
		{{ gateway_form|raw }}
		
	{% elseif step == 'result' %}
	
		<h2 style="padding-top: 20px;">{{ message_raw|raw }}</h2>
		<a class="btn-drop" href="/donate.html" style="float: none; margin: 20px auto;">Купить привилегии</a>
		
	{% endif %}

	
</div>