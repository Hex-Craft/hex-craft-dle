{{ addon_settings_link|raw }}

<h5>{{ gateway_header }}</h5>

<div class="sepH_b">
	__('Инвойс №') {{ invoice_id }}
</div>

<div class="sepH_b">
	{% if email %} <b>__('Е-майл: ')</b> {{ email }} {% endif %}
</div>

{% if gateway_cfg.mode == 'redirect' %}
<style>
	.checkout_button{
		text-decoration: none;
		top: 10px;
		position: relative;
	}
	</style>
	<a href="{{ url }}" class="wc-button-link checkout_button">__('Далее')</a>
{% else %}
	<script src="https://api.fondy.eu/static_common/v1/checkout/ipsp.js"></script>
	
	<div id="checkout">
		<div id="checkout_wrapper">
		</div>
	</div>
	
	<style>
	#checkout_wrapper a{
		font-size: 20px;
		top: 30px;
		padding: 20px;
		position: relative;
	}
	#checkout_wrapper {
		text-align: left;
		position: relative;
		background: #FFF;
		/* padding: 30px; */
		padding-left: 15px;
		padding-right: 15px;
		padding-bottom: 30px;
		width: auto;
		max-width: 2000px;
		margin: 9px auto;
	}
	</style>
	
	<script>
	function checkoutInit(url, val) {
		$ipsp("checkout").scope(function() {
			this.setCheckoutWrapper("#checkout_wrapper");
			this.addCallback(__DEFAULTCALLBACK__);
			this.action("show", function(data) {
			   $("#checkout_loader").remove();
				$("#checkout").show();
			});
			
			this.action("hide", function(data) {
				$("#checkout").hide();
			});
			
			if (val) {
				this.width(val);
				this.action("resize", function(data) {
				$("#checkout_wrapper").width(val).height(data.height);
				});
			} else {
				this.action("resize", function(data) {
					$("#checkout_wrapper").width(480).height(data.height);
				});
			}
			
			this.loadUrl(url);
		});
	};
	
	checkoutInit("{{ url }}");
	</script>
{% endif %}