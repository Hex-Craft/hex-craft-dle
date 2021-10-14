<?php

if (isset($_GET['server'])) {
	$server = $_GET['server'];
	$GLOBALS['smarty']->assign('server', $server);
}

$GLOBALS['smarty']->display($_SERVER['DOCUMENT_ROOT'].'/scripts/CustomTemplates/kits.tpl');