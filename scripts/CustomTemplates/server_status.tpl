<div class="info-panel">
	<span style="font-size: 20px;"><i class="fas fa-info-circle"></i> Внимание! Сервера пингуются компьютером который находится в 800 км от них (Москва), поэтому отображаемый на сайте пинг может отличаться от вашего.</span>
</div>

<div class="status-point status-point-{$last_status_classic}"></div>
<h2 style="display: inline; position: absolute;">Classic <span class="status-{$rounded_classic_points}">{$classic_points}%</span></h2>
<h2 style="text-align: right;">{$last_point_classic}ms</h2>
<div>
{foreach from=$classic key=num item=point}
<div class="status-bar status-{$point.status} status-tooltip">
	<span class="status-tooltiptext">{$point.date}<br>{$point.ping}ms</span><div class="status-tooltiptriangle"></div>
</div>
{/foreach}
</div>
<br>
<div style="height: 150px">
<canvas id="myChart" style="width:100%; max-width:830px;"></canvas>
</div>

<hr>

<div class="status-point status-point-{$last_status_hitech}"></div>
<h2 style="display: inline; position: absolute;">Hi-Tech <span class="status-{$rounded_hitech_points}">{$hitech_points}%</span></h2>
<h2 style="text-align: right;">{$last_point_hitech}ms</h2>
<div>
{foreach from=$hitech key=num item=point}
<div class="status-bar status-{$point.status} status-tooltip">
	<span class="status-tooltiptext">{$point.date}<br>{$point.ping}ms</span><div class="status-tooltiptriangle"></div>
</div>
{/foreach}
</div>
<br>
<div style="height: 150px">
<canvas id="myChart2" style="width:100%; max-width:830px;"></canvas>
</div>

<hr>

<div class="status-point status-point-{$last_status_magic}"></div>
<h2 style="display: inline; position: absolute;">Magic <span class="status-{$rounded_magic_points}">{$magic_points}%</span></h2>
<h2 style="text-align: right;">{$last_point_magic}ms</h2>
<div>
{foreach from=$magic key=num item=point}
<div class="status-bar status-{$point.status} status-tooltip">
	<span class="status-tooltiptext">{$point.date}<br>{$point.ping}ms</span><div class="status-tooltiptriangle"></div>
</div>
{/foreach}
</div>
<br>
<div style="height: 150px">
<canvas id="myChart3" style="width:100%; max-width:830px;"></canvas>
</div>


<script src="https://cdn.jsdelivr.net/npm/chart.js@3.3.2/dist/chart.min.js"></script>
{literal}
<script>

new Chart("myChart", {
  type: "line",
  data: {
    labels: {/literal}{$ping_classic_dates}{literal},
    datasets: [{ 
      data: {/literal}{$ping_classic_data}{literal},
      borderColor: "#3bd671",
      fill: true
    }]
  },
  options: {
	elements: {
        line: {
            tension: 0.4
        }
	},
	maintainAspectRatio: false,
	plugins: {
    legend: {display: false},
	},
	interaction: {
      intersect: false,
      mode: 'index',
    },
	 scales: {
	  x: { display: false },
      y: { min: 0 }
    },
  }
});

new Chart("myChart2", {
  type: "line",
  data: {
    labels: {/literal}{$ping_hitech_dates}{literal},
    datasets: [{ 
      data: {/literal}{$ping_hitech_data}{literal},
      borderColor: "#3bd671",
      fill: true
    }]
  },
  options: {
	elements: {
        line: {
            tension: 0.4
        }
	},
	maintainAspectRatio: false,
	plugins: {
    legend: {display: false},
	},
	interaction: {
      intersect: false,
    },
	 scales: {
	  x: { display: false },
      y: { min: 0 }
    },
  }
});

new Chart("myChart3", {
  type: "line",
  data: {
    labels: {/literal}{$ping_magic_dates}{literal},
    datasets: [{ 
      data: {/literal}{$ping_magic_data}{literal},
      borderColor: "#3bd671",
      fill: true
    }]
  },
  options: {
	elements: {
        line: {
            tension: 0.4
        }
	},
	maintainAspectRatio: false,
	plugins: {
    legend: {display: false},
	},
	interaction: {
      intersect: false,
    },
	 scales: {
	  x: { display: false },
      y: { min: 0 }
    },
  }
});
</script>
{/literal}