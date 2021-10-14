<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/InitAll.php';

if (userDiscordHashCheck($_POST['user']) != $_POST['discord_token']) exit('Несовпадение хэша.');

if($_POST['shaders'] == 'on') $shaders = 1;
else $shaders = 0;

$GLOBALS['site_mysql']->query('INSERT INTO log_bugs SET title=:title, os=:system, importance=:importance, type=:type, ram=:ram, description=:description, user=:user, datetime=\'' . date('Y-m-d H:i:s') . '\', status=\'Новый\', source=:source, shaders=:shaders', [':title'=>$_POST['title'], ':system'=>$_POST['system'], ':importance'=>$_POST['importance'], ':type'=>$_POST['type'], ':ram'=>$_POST['ram'], ':description'=>$_POST['description'], ':user'=>$_POST['user'], ':source'=>$_POST['source'], ':shaders'=>$shaders]);

header('Location: https://hex-craft.ru/issue_tracker.html');

if ($_POST['importance'] > 3) exit(); 

$webhookurl = 'https://discord.com/api/webhooks/897904349999677450/8IEsnnQll6HmtFtay0TyHo5DlRSeJksRap078s-08O_0s8rNKdX5Vd8fKY9FH3rFA5R7';

$text = "Заголовок: {$_POST['title']} \n" .
		"Система: {$_POST['system']} \n" .
		"Важность: {$_POST['importance']} \n" .
		"Тип: {$_POST['type']} \n" .
		"ОЗУ: {$_POST['ram']} \n" .
		"Описание: {$_POST['description']} \n" .
		"Пользователь: {$_POST['user']} \n" .
		"Источник: {$_POST['source']} \n" .
		"Шейдеры: {$_POST['shaders']}";
		

sendDicordMessage ($webhookurl, 'Баг-Репорт', 'Игрок ' . $_POST['user'] . ' создал отчет об ошибке.', '', $text, '', '42a4f3');