<?php

if (date(H) == 3) exit();

require_once('/var/www/html/scripts/InitAll.php');

$webhookurl = "https://discord.com/api/webhooks/900115601882763314/Cnvk91aYFJpjGDI0ui24xDR9WdZHLYosW2xCqxgV9mb1_j3F-u5NTgFJWkWrQRxLpm7W";

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