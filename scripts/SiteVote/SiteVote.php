<?php

require_once ($_SERVER['DOCUMENT_ROOT'] . "/scripts/InitAll.php");

if (empty($_POST)) {
	$url = isset($_GET['fake_site']) ? $_GET['fake_site'] : parse_url($_SERVER['HTTP_REFERER'], PHP_URL_HOST);
	$debug = isset($_GET['debug']) ? $_GET['debug'] : false;
} else {
	$url = isset($_POST['fake_site']) ? $_POST['fake_site'] : parse_url($_SERVER['HTTP_REFERER'], PHP_URL_HOST);
	$debug = isset($_POST['debug']) ? $_POST['debug'] : false;
}

switch ($url)
{
	case 'hotmc.ru':
		$user = $_POST['nick'];
		$generated_hash = sha1($user . $_POST['time'] . $credentials['sitekeys']['hotmc']);
		if ($debug) {
			print_r($_POST);
			echo $generated_hash;
		}
		if ($_POST['sign'] !== $generated_hash) exit('Переданные данные не прошли проверку.');
		break;
	case 'mc-monitor.ru':
		$user = $_POST['name'];
		$generated_hash = sha1($user . $credentials['sitekeys']['mcmon'] . $_POST['id']);
		if ($debug) {
			print_r($_POST);
			echo $generated_hash;
		}
		if ($_POST['sign'] !== $generated_hash) exit('Переданные данные не прошли проверку.');
		break;
	case 'mcrate.su':
		$user = $_GET['nick'];
		$generated_hash = md5(md5($user . $credentials['sitekeys']['mcrate'] . 'mcrate'));
		if ($debug) {
			print_r($_GET);
			echo $generated_hash;
		}
		if ($generated_hash !== $_GET['hash']) exit('Переданные данные не прошли проверку.');
		break;
	case 'tmonitoring.com':
		$data = @unserialize( @file_get_contents( 'https://tmonitoring.com/api/check/' . (string) $_GET['hash'] . '?id=' . (int) $_GET['id'] ) );
		if ($debug) print_r($data);
		if ( @strlen( $data['hash'] ) != 32 or @strlen( $_GET['hash'] ) != 32 or $data['hash'] != $_GET['hash'] ) exit('Переданные данные не прошли проверку.');
		$user = $data['username'];
		break;
	default:
		exit('Неизвестный хост.');
}

$site_balance = $GLOBALS['site_mysql']->query('SELECT user_balance FROM dle_users WHERE name=:name', [':name'=>$user]);
$site_balance = $site_balance['user_balance'] + 5000;
$GLOBALS['site_mysql']->query("UPDATE dle_users SET user_balance = user_balance+5000, votes=votes+1, votes_month=votes_month+1, votetime='" . date('Y-m-d H:i:s') . "' WHERE name=:name", [':name'=>$user]);
$GLOBALS['site_mysql']->query("INSERT INTO log_votes SET date='" . date('Y-m-d H:i:s') . "', nick=:name,  site='MCMON', balance=:site_balance", [':name'=>$user, ':site_balance'=>$site_balance] );

exit('ok');