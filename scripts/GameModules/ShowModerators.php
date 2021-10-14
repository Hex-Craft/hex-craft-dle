<?php

$classic_moderators = $GLOBALS['classic_mysql']->table("SELECT username FROM luckperms_players INNER JOIN luckperms_user_permissions ON luckperms_user_permissions.uuid = luckperms_players.uuid WHERE permission = 'group.moder'");
$hitech_moderators = $GLOBALS['hitech_mysql']->table("SELECT username FROM luckperms_players INNER JOIN luckperms_user_permissions ON luckperms_user_permissions.uuid = luckperms_players.uuid WHERE permission = 'group.moder'");

$files = scandir($_SERVER['DOCUMENT_ROOT'] . "/skins");

function getSkin ($array, $files) {
	foreach($array as $key => $value) {
		for ($i = 0; $i <= count($files); $i++) {
				if (strcasecmp($files[$i], $array[$key]['username'] . '.png') == 0) {
					$array[$key]['skin'] = $files[$i];
					$array[$key]['username'] = substr($files[$i], 0, -4);
				}
		}
	}
	
	return $array;
}

$classic_moderators = getSkin($classic_moderators, $files);
$hitech_moderators = getSkin($hitech_moderators, $files);

$GLOBALS['smarty']->assign('classic_moderators', $classic_moderators);
$GLOBALS['smarty']->assign('hitech_moderators', $hitech_moderators);

$GLOBALS['smarty']->display($_SERVER['DOCUMENT_ROOT'].'/scripts/CustomTemplates/staff.tpl');