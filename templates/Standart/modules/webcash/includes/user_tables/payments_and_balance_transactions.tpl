<table>

	<tr>
		<td>__('Сумма')</td>
		<td>__('Источник платежа')</td>
		
		{% if (plg_alias and not plugin_cfg.frontend_list_rel_item_type_off) or plugin_cfg.frontend_list_rel_item_type_on %}
			<td>__('Тип')</td>
		{% endif %}
		
		{% if plg_alias and not plugin_cfg.frontend_list_rel_item_id_off %}
			<td>__('Подробнее')</td>
		{% endif %}
		
		<td>__('Дата')</td>
		
		{% if plugin_cfg.show_frontend_state_column %}
			<td>__('Статус')</td>
		{% endif %}
	</tr>


	{% for item in items %}
		<tr>
			<td data-title="__('Сумма')">{{ item.amount|currCnvDcl }}</td>
			<td data-title="__('Источник платежа')">{{ item.pay_name }}</td>
			
			{% if (plg_alias and not plugin_cfg.frontend_list_rel_item_type_off) or plugin_cfg.frontend_list_rel_item_type_on %}
				<td data-title="__('Тип')">{{ item.rel_item_type_title }}</td>
			{% endif %}
			
			{% if plg_alias and not plugin_cfg.frontend_list_rel_item_id_off %}
				<td data-title="__('Подробнее')">{{ item.rel_item_id_html|raw }}</td>
			{% endif %}
			
			<td data-title="__('Дата')">{{ item.created }}</td>
			
			{% if plugin_cfg.show_frontend_state_column %}
				<td data-title="__('Статус')">{{ item.state ? '__('Завершен')' : '__('Не завершен')' }}</td>
			{% endif %}
		</tr>
	{% endfor %}
	

<table>