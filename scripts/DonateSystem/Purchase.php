<?php

require_once('/var/www/html/scripts/InitAll.php');

function callback($title, $description) {
	
	$result = array('answer' => "<script>DLEalert('" . $description . "', '" . $title . "')</script>"); 
	echo json_encode($result);
	exit();
}

$type = isset($_GET['type']) ? $_GET['type'] : null;
$hexels_count = isset($_GET['hexels_count']) ? $_GET['hexels_count'] : null;
$server = isset($_GET['server']) ? $_GET['server'] : null;
$hash = isset($_GET['hash']) ? $_GET['hash'] : null;
$discord_token = isset($_GET['discord_token']) ? $_GET['discord_token'] : null;
$user = isset($_GET['user']) ? $_GET['user'] : null;
$user_id = isset($_GET['user_id']) ? $_GET['user_id'] : null;
$silent = isset($_GET['silent']) ? $_GET['silent'] : null;
$prefix = isset($_GET['prefix']) ? $_GET['prefix'] : null;

if (userDiscordHashCheck($user) != $discord_token) callback('Покупка привилегий', 'Несовпадение хеша, перезагрузите страницу и повторите пожалуйста покупку, либо напишите администрации.');

switch ($type) {
	case 'hexels':
	$payment = $hexels_count / 1000;
	break;
	
	case 'fly':
	$payment = 50;
	break;
	
	case 'vip':
	$payment = 50;
	break;
	
	case 'gold':
	$payment = 100;
	break;
	
	case 'ultra':
	$payment = 250;
	break;
	
	case 'elite':
	$payment = 500;
	break;
	
	case 'sponsor':
	$payment = 1000;
	break;
}

$user_balance = $GLOBALS['site_mysql']->query('SELECT money FROM dle_users WHERE name=:name', [':name'=>$user]);

if ($user_balance['money'] < $payment) callback('Покупка привилегий', 'Недостаточно монет, вы можете пополнить их в личном кабинете.');
$GLOBALS['site_mysql']->query('UPDATE dle_users SET money = money-' . $payment . ' WHERE name=:name', [':name'=>$user]);

$server = $server. '_api';

if ($no_prefix) $GLOBALS[$server]->sendCommand('lp user ' . $user . ' meta setprefix "&7[Игрок]&f"');

if ($type == 'hexels') {
	$message = ' !Поздравляем, вы получили ' . $hexels_count . ' хекселей!';
	$GLOBALS[$server]->sendCommand('money give ' . $user . " " . $hexels_count);
	$type = $hexels_count . ' ' . $type;
} else if ($type == 'fly') {
	$message = ' !Поздравляем, вы получили полёт на 1 месяц!';
	$GLOBALS[$server]->sendCommand('tfly ' . $user . ' 30d');
} else {
	$message = ' !Поздравляем, вы получили привилегию ' . strtoupper($type) . '!';
	$GLOBALS[$server]->sendCommand('lp user ' . $user . ' parent addtemp ' . $type . ' "1mo"');
}

$GLOBALS[$server]->sendCommand('cmi msg ' . $user . $message);
if(!$silent) $GLOBALS[$server]->sendCommand('cmi broadcast Спасибо ' . $user . ' за приобретение ' . strtoupper($type) . '!');

$GLOBALS['site_mysql']->query("INSERT INTO log_purchases SET date=:date, nick=:nick, item=:item, server=:server, cost=:cost", [':date'=>date('Y-m-d H:i:s'), ':nick'=>$user, ':item'=> strtoupper($type), ':server'=>substr(strtoupper($server), 0, -4), ':cost'=>$payment]);

callback('Покупка привилегий', 'Вы успешно приобрели ' . strtoupper($type) . ' на сервер ' . substr(strtoupper($server), 0, -4) . '.');