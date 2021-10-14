<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/InitAll.php';

if (userDiscordHashCheck($_POST['login']) != $_POST['hash']) exit('Несовпадение хэша.');

$allowed = false;
$server = $_POST['server'];
$permissions = $GLOBALS[$server . '_mysql']->table('SELECT luckperms_user_permissions.permission AS Perm FROM luckperms_players INNER JOIN luckperms_user_permissions ON luckperms_user_permissions.uuid = luckperms_players.uuid WHERE luckperms_players.username = :username', [':username'=>$_POST['login']]);

for($key = 0; $key < sizeof($permissions); $key++) {
	if ($permissions[$key]['Perm'] == 'group.gold' || $permissions[$key]['Perm'] == 'group.ultra' || $permissions[$key]['Perm'] == 'group.elite') {
		$allowed = true;
	}
}
if ($allowed) {
	$GLOBALS[$server . '_api']->sendCommand('lp user ' . $_POST['login'] . ' meta clear');
	$prefix = '%267[' . str_replace("&", "%26", $_POST['prefix']) . '%267]%26f';
	$command1 = 'lp user ' . $_POST['login'] . ' meta setprefix "' . $prefix . '"';
	$GLOBALS[$server . '_api']->sendCommand($command1);
	$answer = "<script>DLEalert('Префикс [" . $_POST['prefix'] . "] успешно установлен игроку " . $_POST['login'] . " на сервере " . mb_strtoupper($server) . "', 'Установка префикса')</script>";
} else $answer = "<script>DLEalert('Привилегия не была найдена на сервере.', 'Установка префикса')</script>";

$result = array('answer' => $answer); 
echo json_encode($result);