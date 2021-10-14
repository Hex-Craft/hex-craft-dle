<?php

function callback($answer, $done = null, $user = null, $balance_site = null, $value = null, $server = null, $type = null, $site_mysql = null) {
	if ($site_mysql != null) $site_mysql->query("INSERT INTO log_balance SET date='" . date('Y-m-d H:i:s') . "', nick=:nick, site_balance=" . $balance_site . ", value=:value, server='" . $server . "', type=" . $type . ", ip='" . userIP() . "', done=" . $done, [':nick'=>$user, ':value'=>$value]);
	$result = array('answer' => $answer); 
	echo json_encode($result);
	exit();
}

function fromSiteToServer($server_name, $creditentials, $user, $value, $balance_site, $site_mysql) {
	if ($creditentials[$server_name]['balance_manager'] == 0) callback("<script>DLEalert('Перевод на сервер " . mb_strtoupper($server_name) . " временно отключен. Ведутся тех-работы.', 'Перевод хекселей')</script>");
	else {
		if ($site_mysql->query('SELECT user_balance FROM dle_users WHERE name=:user', [':user'=>$user])) {
			$GLOBALS[$server_name . '_api']->sendCommand("cmi money give $user $value");
			
			$site_mysql->query('UPDATE dle_users SET user_balance = user_balance-' . $value . " WHERE name=:user", [':user'=>$user]);
			
			callback("<script>DLEalert('$value хекселей успешно отправлены на сервер " . mb_strtoupper($server_name) . " игроку $user.', 'Перевод хекселей')</script>", 1, $user, $balance_site, $value, $server_name, "'to'", $site_mysql);
		} else callback("<script>DLEalert('Балланс на сервере " . mb_strtoupper($server_name) . " не был найден.', 'Перевод хекселей')</script>", 0, $user, $balance_site, $value, $server_name, "'to'");
	}
}

function fromServerToSite($server_name, $site_mysql, $server_mysql, $creditentials, $user, $value, $balance_site) {
	if ($creditentials[$server_name]['balance_manager'] == 0) callback("<script>DLEalert('Перевод с сервера " . mb_strtoupper($server_name) . " временно отключена. Ведутся тех-работы.', 'Перевод хекселей')</script>");
	$balance_server = $server_mysql->query('SELECT Balance FROM cmi_users WHERE username=:user', [':user'=>$user]);
	if ($balance_server['Balance'] >= $value) { //Если на сервере денег больше или равно чем запрошено
		$comissioned = $value * 0.9;
		$site_mysql->query('UPDATE dle_users SET user_balance = user_balance+' . $comissioned . ' WHERE name=:user', [':user'=>$user]); //Зачисляем хексели на сайт
		$GLOBALS[$server_name . '_api']->sendCommand("money take $user $value");
		callback("<script>DLEalert('$value - 10% комиссии = $comissioned хекселей успешно переведены на сайт игроку $user.', 'Перевод хекселей')</script>", 1, $user, $balance_site, $value, $server_name, "'from'", $site_mysql);
	} else callback("<script>DLEalert('На сервере " . mb_strtoupper($server_name) . " недостаточно хекселей.', 'Перевод хекселей')</script>", 0, $user, $balance_site, $value, $server_name, "'from'");
}

$json = file_get_contents( $_SERVER['DOCUMENT_ROOT']."/scripts/Config/Creditentials.json" );
$creditentials = json_decode( $json, true ); 

$user = $_POST['login'];
$hash = $_POST['hash'];
$value = $_POST['hexels'];
$server = $_POST['server'];
$type = $_POST['type'];

require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/InitAll.php';

if (userDiscordHashCheck($_POST['login']) != $_POST['hash']) callback("<script>DLEalert('Несовпадение хэша. Возможно вы сгенерировали новый токен. Обновите страницу. Если ошибка не исчезает - свяжитесь с администрацией.', 'Перевод хекселей')</script>");

if ($value <= 0) callback("<script>DLEalert('Введите кол-во хекселей.', 'Перевод хекселей')</script>");

$balance_site = $site_mysql->query('SELECT user_balance FROM dle_users WHERE name=:user', [':user'=>$user]);

$balance_site = round($balance_site['user_balance']);

if ($type == 1) { //с сайта на сервер

	if ($balance_site < $value) callback("<script>DLEalert('На вашем аккаунте недостаточно хекселей! Для их получения проголосуйте за проект.', 'Перевод хекселей')</script>");
	
	fromSiteToServer($server, $creditentials, $user, $value, $balance_site, $site_mysql);
}

switch ($server) {
	case 'classic':
		$server_mysql = $classic_mysql;
		break;
	case 'hitech';
		$server_mysql = $hitech_mysql;
		break;
	case 'magic';
		$server_mysql = $magic_mysql;
		break;
}

if ($type == 2) fromServerToSite($server, $site_mysql, $server_mysql, $creditentials, $user, $value, $balance_site); // с сервера на сайт