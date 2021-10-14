<?php

$classic_bans = $GLOBALS['classic_mysql']->table('SELECT username, BannedUntil, BannedAt, BannedBy, BanReason FROM cmi_users WHERE BannedUntil IS NOT null ORDER BY BannedAt DESC');
$hitech_bans = $GLOBALS['classic_mysql']->table('SELECT username, BannedUntil, BannedAt, BannedBy, BanReason FROM cmi_users WHERE BannedUntil IS NOT null ORDER BY BannedAt DESC');

$GLOBALS['smarty']->assign('classic_bans', $classic_bans);
$GLOBALS['smarty']->assign('hitech_bans', $hitech_bans);

$GLOBALS['smarty']->display($_SERVER['DOCUMENT_ROOT'].'/scripts/CustomTemplates/banlist.tpl');