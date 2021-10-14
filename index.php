<?php

@ob_start ();
@ob_implicit_flush (0);

@error_reporting ( E_ALL ^ E_WARNING ^ E_DEPRECATED ^ E_NOTICE );
@ini_set ( 'error_reporting', E_ALL ^ E_WARNING ^ E_DEPRECATED ^ E_NOTICE );

@ini_set ( 'display_errors', true );
@ini_set ( 'html_errors', false );

define ( 'DATALIFEENGINE', true );
define ( 'ROOT_DIR', dirname ( __FILE__ ) );
define ( 'ENGINE_DIR', ROOT_DIR . '/engine' );
define ( 'SCRIPTS_DIR', ROOT_DIR . '/scripts' );
define ( 'CONFIG_DIR', SCRIPTS_DIR . '/Config' );

if (!function_exists(json)) {
		function json(string $src, $associative = true) {
		return json_decode(file_get_contents($src . ".json"), $associative);
	}
}

$db_configs = json( CONFIG_DIR . '/Database' );
$server_list = json( CONFIG_DIR . '/Servers' );
$perms = json( CONFIG_DIR . '/Prefix' );

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

$GLOBALS['smarty'] = new Smarty;

require_once (ENGINE_DIR . '/classes/plugins.class.php');
require_once (DLEPlugins::Check(ROOT_DIR . '/engine/init.php'));

?>