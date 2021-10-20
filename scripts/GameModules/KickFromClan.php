<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/InitAll.php';

if(!isset($_GET["kick"])) exit("No player.");

$kick = $_GET["kick"];
$hash = $_GET["hash"];
$user = $_GET["leader"];

if (userDiscordHashCheck($user) != $hash) exit('Несовпадение хэша.');

echo "Nick: " . $kick . " Hash: " . $hash . " Check: " . $site_hash['discord_token'] . " Leader: " . $user;

$GLOBALS['classic_api']->sendCommand('clan admin clean ' . $kick, 'classic');