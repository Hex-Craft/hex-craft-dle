<?php

function userDiscordHashCheck($user, $site_mysql = null) {
	$hash = $GLOBALS['site_mysql']->query('SELECT discord_token FROM dle_users WHERE name=:user', [':user'=>$user]);
	return $hash['discord_token'];
}
