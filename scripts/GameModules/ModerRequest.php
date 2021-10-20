<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/InitAll.php';

$words = ['_', '**', '*', '~~', '`', '||'];

foreach ($_POST as $k => $w) {
	foreach ($words as $kw => $vw) {
		$_POST[$k] = str_replace($vw, '\\' . $vw, $w);
	}
}

if(isset($_POST['login'])) {

    $request =
        "Никнейм: {$_POST['login']}\n".
        "Возраст: {$_POST['age']}\n".
        "Время игры: {$_POST['playtime']}\n".
        "Время когда обычно играет: {$_POST['realtime']}\n".
        "Знание русского: {$_POST['mark']}\n".
        "Дискорд: {$_POST['discord']}\n".
        "Причина модераторства: {$_POST['why']}\n".
        "Обязанности модератора: {$_POST['todo']}\n".
        "Узнали о проекте через: {$_POST['how']}\n".
        "Кодовая фраза: {$_POST['moder']}\n".
        "Дата: " . date("d.m.Y.H:i:s") . "\n".
        "IP: " . userIP();

	$webhookurl = 'https://canary.discord.com/api/webhooks/877265268739551294/45CxfDAUMJnZP9R_wHyPLD2hTxH3ke8r1Y7yQH3EUVv2LcXbTVBkCP6QM5PxXEtGXh6V';
	
	sendDicordMessage ($webhookurl, 'Заявка на модератора', 'Игрок ' . $_POST['login'] . ' подал заявку на модератора.', '', $request, '', '42a4f3');
	
	header('Location: https://hex-craft.ru/?do=static&page=result_moder');
}