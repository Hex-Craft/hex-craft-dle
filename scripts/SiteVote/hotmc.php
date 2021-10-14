<?php

require_once ($_SERVER['DOCUMENT_ROOT']."/scripts/InitAll.php");

$SECRET_KEY = 'secret';

if (isset($_POST['nick'], $_POST['time'], $_POST['sign'])) {
    if ($_POST['sign'] !== sha1($_POST['nick'] . $_POST['time'] . $SECRET_KEY)) exit('Переданные данные не прошли проверку.');
} else exit('Не переданы необходимые данные.');

$site_balance = $site_mysql->query('SELECT user_balance FROM dle_users WHERE name=:name', [':name'=>$_POST['nick']]);
$site_balance = $site_balance['user_balance'] + 5000;
$site_mysql->query("UPDATE dle_users SET user_balance = user_balance+5000, votes=votes+1, votes_month=votes_month+1, votetime='" . date('Y-m-d H:i:s') . "' WHERE name=:name", [':name'=>$_POST['nick']]);
$site_mysql->query("INSERT INTO log_votes SET date='" . date('Y-m-d H:i:s') . "', nick=:name,  site='HOTMC', balance=:site_balance", [':name'=>$_POST['nick'], ':site_balance'=>$site_balance] );

exit('ok');

?>