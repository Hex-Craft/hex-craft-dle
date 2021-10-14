<?php

function getNewDiscordToken($email)
{
$discord_token = array(	'a','b','c','d','e','f',
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
    for($i = 0; $i < 16; $i++)
    {
      $index = rand(0, count($discord_token) - 1);
      $pass .= $discord_token[$index];
    }
	
	$GLOBALS['site_mysql']->query('UPDATE dle_users SET discord_token = :pass WHERE email = :email', [':pass'=>$pass, ':email'=>$email]);

}