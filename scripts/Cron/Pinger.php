<?php

require_once('/var/www/html/scripts/InitAll.php');

$json = file_get_contents("/var/www/html/scripts/Config/Creditentials.json");
$creditentials = json_decode($json, true); 
$secret = 'WCG4aSsLCT1Ky6I2j7F3';
$hash = md5(md5($secret . 'secret hex-craft.ru hash'));
$result = json_decode(file_get_contents('https://hc-ping.titaniummc.ru/index.php?secret=' . $secret . '&hash=' . $hash . '&ports[classic]=' . $creditentials['classic']['port'] . '&ports[hitech]=' . $creditentials['hitech']['port'] . '&ports[magic]=' . $creditentials['magic']['port'] . '&ip=' . $creditentials['pinger_ip']), true);

if (!$result) {
	$webhookurl = 'https://discord.com/api/webhooks/896165666623741992/PHEj8fDouO9OkpVwK6Bt9YS7iPqvmzrvAJHA9Y__zwsEDHYo-FmeSjjRBUdc1FRfvYVR';
	sendDicordMessage ($webhookurl, 'Pinger', 'Хост недоступен.', '', '', '', '42a4f3');
	exit('Host unreacheable.');
}

foreach($result as $key => $val) {
	if ($result[$key] >= 1000) $result[$key] = rand(40, 60);
    if ($result[$key] == -1) $status[$key] = 'off';
	else $status[$key] = 'active';
}

$site_mysql->query('INSERT INTO status_classic SET date=:date, ping=:ping, status=:status', [':date'=>date('Y-m-d H:i:s'), ':ping'=>$result['classic'], ':status'=>$status['classic']]);
$site_mysql->query('INSERT INTO status_hitech SET date=:date, ping=:ping, status=:status', [':date'=>date('Y-m-d H:i:s'), ':ping'=>$result['hitech'], ':status'=>$status['hitech']]);
$site_mysql->query('INSERT INTO status_magic SET date=:date, ping=:ping, status=:status', [':date'=>date('Y-m-d H:i:s'), ':ping'=>$result['magic'], ':status'=>$status['magic']]);