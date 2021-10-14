<?php

ob_start();
include('../PlayersCountClassic.php');
$players['classic'] = ob_get_clean();

ob_start();
include('../PlayersCountHitech.php');
$players['hitech'] = ob_get_clean();

ob_start();
include('../PlayersCountMagic.php');
$players['hitech'] = ob_get_clean();

foreach($players as $key => $value) {
	if (!is_numeric($players[$key])) $players[$key] = 0;
}

$sum = array_sum($players);

$f_hdl = fopen('/var/www/html/scripts/Cache/MaxOnline.php', 'r');
$str = htmlentities(fgets($f_hdl, 4096));
fclose($f_hdl);
$f_hdl = fopen('/var/www/html/scripts/Cache/MaxOnline.php', 'w');

if ($sum > $str) $line3 = $sum."\r\n";
else $line3 = $str."\r\n";

fwrite($f_hdl, $line3);

fclose($f_hdl);
