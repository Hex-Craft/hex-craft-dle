<?php

require_once ($_SERVER['DOCUMENT_ROOT']."/scripts/InitAll.php");

define( 'MONITORING_URL', 'https://tmonitoring.com/api/check/' );
define( 'CASE_INSENSITIVE', true );

$data = @unserialize( @file_get_contents( MONITORING_URL . (string) $_GET['hash'] . '?id=' . (int) $_GET['id'] ) );

if ( @strlen( $data['hash'] ) != 32 or @strlen( $_GET['hash'] ) != 32 or $data['hash'] != $_GET['hash'] ) die( "Invalid hash" );

$site_balance = $site_mysql->query('SELECT user_balance FROM dle_users WHERE name=:name', [':name'=>$data['username']]);
$site_balance = $site_balance['user_balance'] + 5000;
$site_mysql->query("UPDATE dle_users SET user_balance = user_balance+5000, votes=votes+1, votes_month=votes_month+1, votetime='" . date('Y-m-d H:i:s') . "' WHERE name=:name", [':name'=>$data['username']]);
$site_mysql->query("INSERT INTO log_votes SET date='" . date('Y-m-d H:i:s') . "', nick=:name,  site='TLTOP', balance=:site_balance", [':name'=>$data['username'], ':site_balance'=>$site_balance] );

?>