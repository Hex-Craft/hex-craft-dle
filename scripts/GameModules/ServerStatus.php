<?php

//НЕОБХОДИМ РЕФАКТОРИНГ

function roundedPoints($points)
{
	switch($points)
	{
		case ($points <= 100 && $points > 99):
			$points = 100;
			break;
		case ($points <= 99 && $points > 95):
			$points = 95;
			break;
		case ($points <= 95 && $points > 80):
			$points = 80;
			break;
		case ($points <= 80 && $points > 60):
			$points = 60;
			break;
		case ($points <= 60 && $points > 40):
			$points = 40;
			break;
		case ($points <= 40 && $points > 10):
			$points = 10;
			break;
	}
	return $points;
}

$classic = $GLOBALS['site_mysql']->table('SELECT * FROM status_classic ORDER BY date DESC LIMIT 118');
$hitech = $GLOBALS['site_mysql']->table('SELECT * FROM status_hitech ORDER BY date DESC LIMIT 118');
$magic = $GLOBALS['site_mysql']->table('SELECT * FROM status_magic ORDER BY date DESC LIMIT 118');

$classic = array_reverse ($classic);
$hitech = array_reverse ($hitech);
$magic = array_reverse ($magic);

$size_classic = sizeof($classic);
$size_hitech = sizeof($hitech);
$size_magic = sizeof($magic);

for ($i = 0; $i < $size_classic; $i++) {
	if ($classic[$i]['status'] == 'active') $classic_points += 1;
	$ping_classic_data .= $classic[$i]['ping'] . ',';
	$ping_classic_dates .= '"' . $classic[$i]['date'] . '",';
}

for ($i = 0; $i < $size_hitech; $i++) {
	if ($hitech[$i]['status'] == 'active') $hitech_points += 1;
	$ping_hitech_data .= $hitech[$i]['ping'] . ',';
	$ping_hitech_dates .= '"' . $hitech[$i]['date'] . '",';
}

for ($i = 0; $i < $size_magic; $i++) {
	if ($magic[$i]['status'] == 'active') $magic_points += 1;
	$ping_magic_data .= $magic[$i]['ping'] . ',';
	$ping_magic_dates .= '"' . $magic[$i]['date'] . '",';
}

$ping_classic_data = '[' . $ping_classic_data . ']';
$ping_classic_dates = '[' . $ping_classic_dates . ']';
$ping_hitech_data = '[' . $ping_hitech_data . ']';
$ping_hitech_dates = '[' . $ping_hitech_dates . ']';
$ping_magic_data = '[' . $ping_magic_data . ']';
$ping_magic_dates = '[' . $ping_magic_dates . ']';

$classic_points = $size_classic / $classic_points;
$classic_points = round(100 / $classic_points, 2);

$hitech_points = $size_hitech / $hitech_points;
$hitech_points = round(100 / $hitech_points, 2);

$magic_points = $size_magic / $magic_points;
$magic_points = round(100 / $magic_points, 2);

$GLOBALS['smarty']->assign('classic', $classic);
$GLOBALS['smarty']->assign('hitech', $hitech);
$GLOBALS['smarty']->assign('magic', $magic);
$GLOBALS['smarty']->assign('classic_points', $classic_points);
$GLOBALS['smarty']->assign('hitech_points', $hitech_points);
$GLOBALS['smarty']->assign('magic_points', $magic_points);
$GLOBALS['smarty']->assign('rounded_classic_points', roundedPoints($classic_points));
$GLOBALS['smarty']->assign('rounded_hitech_points', roundedPoints($hitech_points));;
$GLOBALS['smarty']->assign('rounded_magic_points', roundedPoints($magic_points));;
$GLOBALS['smarty']->assign('ping_classic_data', $ping_classic_data);
$GLOBALS['smarty']->assign('ping_hitech_data', $ping_hitech_data);
$GLOBALS['smarty']->assign('ping_magic_data', $ping_magic_data);
$GLOBALS['smarty']->assign('ping_classic_dates', $ping_classic_dates);
$GLOBALS['smarty']->assign('ping_hitech_dates', $ping_hitech_dates);
$GLOBALS['smarty']->assign('ping_magic_dates', $ping_magic_dates);
$GLOBALS['smarty']->assign('last_status_classic', $classic[$size_classic - 1]['status']);
$GLOBALS['smarty']->assign('last_status_hitech', $hitech[$size_hitech - 1]['status']);
$GLOBALS['smarty']->assign('last_status_magic', $magic[$size_magic - 1]['status']);
$GLOBALS['smarty']->assign('last_point_classic', $classic[$size_classic - 1]['ping']);
$GLOBALS['smarty']->assign('last_point_hitech', $hitech[$size_hitech - 1]['ping']);
$GLOBALS['smarty']->assign('last_point_magic', $magic[$size_magic - 1]['ping']);

$GLOBALS['smarty']->display($_SERVER['DOCUMENT_ROOT'] . '/scripts/CustomTemplates/server_status.tpl');

?>