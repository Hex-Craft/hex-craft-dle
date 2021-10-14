<?php

if (date(H) == 3) exit();

require_once('/var/www/html/scripts/InitAll.php');

$webhookurl = "https://canary.discord.com/api/webhooks/791794356675805245/6leesQlybVBLhBLxvLwTH2LJBrAvZ3YJjsZnmkqdjBrQjNqW3dFu9rMt4V9sGHjlVi7v";

foreach ($server_list as $k => $v) {
    $server_details = $GLOBALS[$k."_api"]->resources();

	$array = json_decode($server_details , JSON_PRETTY_PRINT);

	$status = $array['attributes']['current_state'];
	
	if ($status == 'offline') {
		$GLOBALS[$k."_api"]->changePower('start');
		$text = "Сервер " . strtoupper($k) . " был обнаружен выключеным. Произведен запуск.";
		sendDicordMessage($webhookurl, "Статус сети", "", "Посмотреть аптайм", $text , "https://hex-craft.ru/servers_status.html", "6cd17a");
	}
}