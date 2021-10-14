<?php

require_once('/var/www/html/scripts/InitAll.php');

parse_str($argv[1], $params);

$server = $params['server'];

$GLOBALS[$server."_api"]->sendCommand('cmi broadcast Плановый перезапуск сервера для создания бекапа через 60 секунд.');
sleep(50);
$GLOBALS[$server."_api"]->sendCommand('cmi broadcast Плановый перезапуск сервера для создания бекапа через 10 секунд.');
sleep(10);
$GLOBALS[$server."_api"]->changePower('stop');
sleep(10);
$GLOBALS[$server."_api"]->createBackup();
sleep(20);
$GLOBALS[$server."_api"]->changePower('start');