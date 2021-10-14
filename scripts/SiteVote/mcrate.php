<?php

require_once ($_SERVER['DOCUMENT_ROOT']."/scripts/InitAll.php");

$config = [
    'secret' => 'secret',
    'type' => 'GET',
];

if ($config['type'] == 'GET') $request = &$_GET;
elseif ($config['type'] == 'POST') $request = &$_POST;
else throw new Exception("Invalid configuration: type contains invalid value.", 500);

if (isset($request['nick']) && isset($request['hash'])) 
{
    if (md5(md5($request['nick'] . $config['secret'] . 'mcrate')) == $request['hash'])
	{
	$site_balance = $site_mysql->query('SELECT user_balance FROM dle_users WHERE name=:name', [':name'=>$request['nick']]);
	$site_balance = $site_balance['user_balance'] + 5000;
	$site_mysql->query("UPDATE dle_users SET user_balance = user_balance+5000, votes=votes+1, votes_month=votes_month+1, votetime='" . date('Y-m-d H:i:s') . "' WHERE name=:name", [':name'=>$request['nick']]);
	$site_mysql->query("INSERT INTO log_votes SET date='" . date('Y-m-d H:i:s') . "', nick=:name,  site='MCRATE', balance=:site_balance", [':name'=>$request['nick'], ':site_balance'=>$site_balance] );
    }
	else throw new InvalidArgumentException("Invalid hash. Check secret.", 400);
}
else throw new InvalidArgumentException("Required data not provided.", 400);

?>