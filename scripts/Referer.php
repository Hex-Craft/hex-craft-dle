<?php

$sitename = parse_url($_SERVER['HTTP_REFERER'], PHP_URL_HOST);

$check = $GLOBALS['site_mysql']->query('SELECT sitename FROM log_sites WHERE sitename=:sitename', [':sitename'=>$sitename]);
if (substr($sitename, 0, 9) != 'hex-craft' && $sitename != 'sci.interkassa.com')
{
	if ($check['sitename'] == $sitename) $GLOBALS['site_mysql']->query('UPDATE log_sites SET count = count+1 WHERE sitename=:sitename', [':sitename'=>$sitename]);
	else $GLOBALS['site_mysql']->query('INSERT INTO log_sites SET sitename=:sitename, count=1', [':sitename'=>$sitename]);
}