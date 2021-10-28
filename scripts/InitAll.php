<?php

define ( 'SCRIPTS_DIR', '/var/www/html/scripts' );
define ( 'CONFIG_DIR', SCRIPTS_DIR . '/Config' );

if (!function_exists(json)) {
	function json(string $src, $associative = true) {
		return json_decode(file_get_contents($src . ".json"), $associative);
	}
}

if (!function_exists(callback)) {
	function callback($title, $description) {
		$result = array('answer' => "<script>DLEalert('" . $description . "', '" . $title . "')</script>"); 
		echo json_encode($result);
		exit();
	}
}

$db_configs = json( CONFIG_DIR . '/Database' );
$server_list = json( CONFIG_DIR . '/Servers' );
$perms = json( CONFIG_DIR . '/Prefix' );
$credentials = json( CONFIG_DIR . '/Creditentials' );

require_once SCRIPTS_DIR . '/Classes/Database.class.php';
require_once SCRIPTS_DIR . '/Classes/ServerApi.class.php';
require_once SCRIPTS_DIR . '/Classes/Smarty/Smarty.class.php';

require_once SCRIPTS_DIR . '/Functions/userDiscordHashCheck.php';
require_once SCRIPTS_DIR . '/Functions/sendDiscordMessage.php';
require_once SCRIPTS_DIR . '/Functions/userIP.php';
require_once SCRIPTS_DIR . '/Functions/numbersNaminator.php';
require_once SCRIPTS_DIR . '/Functions/secondsToTime.php';

foreach ($db_configs as $k => $v){
    $GLOBALS[$k."_mysql"] = new Database($v);
}

foreach ($server_list as $k => $v) {
    $GLOBALS[$k."_api"] = new ServerApi($v);
}