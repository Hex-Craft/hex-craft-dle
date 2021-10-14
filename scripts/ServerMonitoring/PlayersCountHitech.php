<?php
	
require_once($_SERVER['DOCUMENT_ROOT'] . '/scripts/Classes/xPaw/MinecraftPing.class.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/scripts/Classes/xPaw/MinecraftPingException.class.php');

$json = file_get_contents($_SERVER['DOCUMENT_ROOT'] . "/scripts/Config/Creditentials.json");
$creditentials = json_decode($json, true);
	
use xPaw\MinecraftPing;
use xPaw\MinecraftPingException;
	
try {
	$QueryOldPre17 = new MinecraftPing( $creditentials['pinger_ip'], $creditentials['hitech']['port'] );
	
	$current_players = ( $QueryOldPre17->QueryOldPre17() );
	
	echo $current_players;
}
catch( MinecraftPingException $e ) {
	echo "OFFLINE";
}
finally {
	if( $QueryOldPre17 ) $QueryOldPre17->Close();
}