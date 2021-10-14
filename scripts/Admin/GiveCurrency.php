<?php

require_once('/var/www/html/scripts/InitAll.php');

if (userDiscordHashCheck($_POST['login']) != $_POST['hash']) {
	$site_mysql->query("INSERT INTO log_admin SET name='HACK', value=:value, destination='" . $_POST['destination'] . "', date='" . date('Y-m-d H:i:s') . "', ip='" . userIP() . "'", [':name'=>$_POST['name'], ':value'=>$_POST['value']]);
	exit('Несовпадение хэша.');
}

$action;

if ($_POST['destination'] == 'hexels')
	$GLOBALS['site_mysql']->query('UPDATE dle_users SET user_balance = user_balance+:value WHERE name=:name', [':value'=>$_POST['value'], ':name'=>$_POST['name']]);
else if ($_POST['destination'] == 'coins')
	$GLOBALS['site_mysql']->query('UPDATE dle_users SET money = money+:value WHERE name=:name', [':value'=>$_POST['value'], ':name'=>$_POST['name']]);
else {
	if ($_POST['value'] < 0)
	{
		$action = 'take';
		$_POST['value'] *= -1;
	}
	else $action = 'give';
	
	$GLOBALS[$_POST['destination'] . '_api']->sendCommand('money ' . $action . ' ' . $_POST['name'] . ' ' . $_POST['value']);
}

$site_mysql->query("INSERT INTO log_admin SET name=:name, value=:value, action='" . $action . "', destination='" . $_POST['destination'] . "', date='" . date('Y-m-d H:i:s') . "', initiator=:initiator, ip='" . userIP() . "'", [':name'=>$_POST['name'], ':value'=>$_POST['value'], ':initiator'=>$_POST['initiator']]);

$answer = $_POST['name'] . ': ' . $action . ' ' . $_POST['value'] . ' ' . mb_strtoupper($_POST['destination']);

$result = array('answer' => $answer);
echo json_encode($result);