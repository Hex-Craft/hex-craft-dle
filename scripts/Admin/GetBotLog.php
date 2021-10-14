<?php

require_once('/var/www/html/scripts/InitAll.php');

if (userDiscordHashCheck($_POST['login']) != $_POST['hash']) exit('Несовпадение хэша.');

$str = file_get_contents('/var/www/html/logs/bot.log');
$order   = array("\r\n", "\n", "\r");
$replace = '<br />';

$file = str_replace($order, $replace, $str);

$result = array('answer' => $file);
echo json_encode($result);