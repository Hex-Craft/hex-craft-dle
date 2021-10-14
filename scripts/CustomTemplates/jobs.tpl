{foreach from=$jobs item=job}
<hr>
<img src="img/jobs/{$job.job}.png" class="job_img">
<div class="job_name">{$job.job}</div>
<div class="job_desc">Уровень: {$job.level}</div>
<hr>
{/foreach}