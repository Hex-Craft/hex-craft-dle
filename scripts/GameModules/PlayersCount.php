<?php
	require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/Classes/MinecraftPing.php';
	require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/Classes/MinecraftPingException.php';
	
	use xPaw\MinecraftPing;
	use xPaw\MinecraftPingException;
	
	try {
		$QueryOldPre17 = new MinecraftPing( '46.119.193.38', 25565 );
		
		$current_players = ( $QueryOldPre17->QueryOldPre17() );
		
		echo $current_players;
	}
	catch( MinecraftPingException $e ) echo "OFFLINE";
	finally if( $QueryOldPre17 ) $QueryOldPre17->Close();