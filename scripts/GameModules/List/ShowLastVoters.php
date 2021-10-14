<?php

$users = $GLOBALS['site_mysql']->table('SELECT votes, name, votetime FROM dle_users ORDER BY votetime DESC LIMIT 3');

for ($i = 0; $i < sizeof($users); $i++)
{
	$seconds = strtotime(date("Ymd H:i:s")) - strtotime($users[$i]['votetime']);
	$diffrence = DateTime::createFromFormat('U', $seconds);
	$hours = $diffrence->format("G");
	$minutes = $diffrence->format("i");
	
	if ($seconds <= 30 && $minutes == 0 && $hours == 0) $time = "только что";
	else
	{
		$hours_converted = numbersNaminator($hours, array('час', 'часа', 'часов'))." ";
		$minutes_converted = numbersNaminator($minutes, array('минута', 'минуты', 'минут'))." назад";
		$time = $hours_converted . $minutes_converted;
	}
	echo "<img data-src='/skin.php?user=" . $users[$i]['name'] . "&mode=3' class='playerimg lazy' style='position: relative;'>
	<span style='top: -6px; position: relative; margin-left: 2px;'>
	<a style=\"cursor: pointer;\"onclick=\"ShowProfile('" . $users[$i]['name'] . "', 'https://hex-craft.ru/user/" . $users[$i]['name'] . "/', '1'); return false;\">" . $users[$i]['name'] . "</a>
	</span>
	<span style='font-size: 12px; position: absolute; margin: -14px 0 0 39px; display: block;'>" . $time . "</span>
	<div class='underline' style='margin-top: 5px; margin-bottom: 5px;'></div>";
}