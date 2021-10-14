<?php

if(isset($_GET['nick'])) $GLOBALS['smarty']->assign('nick', $_GET['nick']);

$GLOBALS['smarty']->display($_SERVER['DOCUMENT_ROOT'].'/scripts/CustomTemplates/skin_viewer.tpl');