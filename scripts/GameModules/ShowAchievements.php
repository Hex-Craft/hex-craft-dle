<?php

$achievements = $GLOBALS['site_mysql']->table('SELECT * FROM dle_user_achievements_list WHERE user_id = ' . $member_id['user_id']);
$achievement_style = $GLOBALS['site_mysql']->table('SELECT * FROM dle_achievements');

$GLOBALS['smarty']->assign('achievements', $achievements);
$GLOBALS['smarty']->assign('achievement_style', $achievement_style);

$GLOBALS['smarty']->display($_SERVER['DOCUMENT_ROOT'].'/scripts/CustomTemplates/achievements.tpl');