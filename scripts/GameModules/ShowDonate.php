<?php

if(isset($_GET['server'])) $GLOBALS['smarty']->assign('server', $_GET['server']);

$GLOBALS['smarty']->assign('user', $member_id);
$GLOBALS['smarty']->display($_SERVER['DOCUMENT_ROOT'].'/scripts/CustomTemplates/donate.tpl');