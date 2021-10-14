<?php

$top_voters = $GLOBALS['site_mysql']->table('SELECT votes, name, votetime FROM dle_users ORDER BY votes DESC LIMIT 20');
$top_jobers = $GLOBALS['classic_mysql']->table('SELECT username, level FROM jobs_jobs, jobs_users WHERE jobs_users.id = jobs_jobs.userid ORDER BY jobs_jobs.level DESC LIMIT 20');
$classic_players = $GLOBALS['classic_mysql']->table('SELECT username, TotalPlayTime FROM cmi_users ORDER BY TotalPlayTime DESC LIMIT 20');
$hitech_players = $GLOBALS['hitech_mysql']->table('SELECT username, TotalPlayTime FROM cmi_users ORDER BY TotalPlayTime DESC LIMIT 20');
$donaters = $GLOBALS['site_mysql']->table('SELECT * FROM top_donaters ORDER BY coins DESC LIMIT 20');

foreach($top_voters as $key => $value) {
	$top_voters[$key]['votes'] = numbersNaminator($top_voters[$key]['votes'], array('голос', 'голоса', 'голосов')) . " ";
}

foreach($classic_players as $key => $value) {
	$raw_time = $classic_players[$key]['TotalPlayTime'];
	$seconds = $raw_time / 1000;
	
	$times = secondsToTime($seconds);
	
	$converted_minutes = numbersNaminator($times[1], array('минута', 'минуты', 'минут'))." ";
	$converted_hours = numbersNaminator($times[2], array('час', 'часа', 'часов'))." ";
	if ($times[3] >= 1) $converted_days = numbersNaminator($times[3], array('день', 'дня', 'дней'))." ";
	else $converted_days = "";
	
	$classic_players[$key]['TotalPlayTime'] = $converted_days . $converted_hours . $converted_minutes;
}

foreach($hitech_players as $key => $value) {
	$raw_time = $hitech_players[$key]['TotalPlayTime'];
	$seconds = $raw_time / 1000;
	
	$times = secondsToTime($seconds);
	
	$converted_minutes = numbersNaminator($times[1], array('минута', 'минуты', 'минут'))." ";
	$converted_hours = numbersNaminator($times[2], array('час', 'часа', 'часов'))." ";
	if ($times[3] >= 1) $converted_days = numbersNaminator($times[3], array('день', 'дня', 'дней'))." ";
	else $converted_days = "";
	
	$hitech_players[$key]['TotalPlayTime'] = $converted_days . $converted_hours . $converted_minutes;
}

$GLOBALS['smarty']->assign('top_voters', $top_voters);
$GLOBALS['smarty']->assign('top_jobers', $top_jobers);
$GLOBALS['smarty']->assign('classic_players', $classic_players);
$GLOBALS['smarty']->assign('hitech_players', $hitech_players);
$GLOBALS['smarty']->assign('donaters', $donaters);

$GLOBALS['smarty']->display($_SERVER['DOCUMENT_ROOT'].'/scripts/CustomTemplates/show_top_players.tpl');