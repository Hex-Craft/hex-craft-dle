<?php

require_once('/var/www/html/scripts/InitAll.php');

$classic_players = $GLOBALS['classic_mysql']->query('SELECT COUNT(*) as count FROM cmi_users');
$hitech_players = $GLOBALS['hitech_mysql']->query('SELECT COUNT(*) as count FROM cmi_users');
$summary = $classic_players['count'] + $hitech_players['count'] + 400;

$f_hdl = fopen('/var/www/html/scripts/Cache/SumPlayers.php', 'r');
$str = htmlentities(fgets($f_hdl));
fclose($f_hdl);
$f_hdl = fopen('/var/www/html/scripts/Cache/SumPlayers.php', 'w');
	
if ($summary > $str) $line3 = $summary."\r\n";
else $line3 = $str."\r\n";
	
fwrite($f_hdl, $line3);
	
fclose($f_hdl);