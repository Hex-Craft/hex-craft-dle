<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/InitAll.php';

if (userDiscordHashCheck($_POST['login']) != $_POST['hash']) exit('Несовпадение хэша.');

if (isset($_POST["hash"])) { 
	$user = $_POST['login'];
	$user_id = $_POST['user_id'];
	$hash = $_POST['hash'];
}

$arr = array('a','b','c','d','e','f',
             'g','h','i','j','k','l',
             'm','n','o','p','r','s',
             't','u','v','x','y','z',
             'A','B','C','D','E','F',
             'G','H','I','J','K','L',
             'M','N','O','P','R','S',
             'T','U','V','X','Y','Z',
             '1','2','3','4','5','6',
             '7','8','9','0');
$pass = "";
for($i = 0; $i < 16; $i++) {
	$index = rand(0, count($arr) - 1);
	$pass .= $arr[$index];
}

$token = $GLOBALS['site_mysql']->query('SELECT name, user_id, discord_token FROM dle_users WHERE name=:name', [':name'=>$user]);

if ($user_id == $token['user_id'] && $hash == $token['discord_token'])
	$GLOBALS['site_mysql']->query('UPDATE dle_users SET discord_token =:pass WHERE user_id=:user_id', [':pass'=>$pass, ':user_id'=>$user_id]);

$result = array('answer' => $pass);
echo json_encode($result);