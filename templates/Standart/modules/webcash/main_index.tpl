<div class="static-container">
<img src="/img/coins.png" alt="" class="fr-dib">
	<div class="news-container">
		{% if USER.is_logged %}	
			
			{{ content|raw }}
		
		{% else %}
			
			{{ content|raw }}
			
		{% endif %}	
	</div>
</div>