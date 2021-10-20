<?php

$reports = $GLOBALS['site_mysql']->table('SELECT * FROM log_bugs ORDER BY id DESC');

foreach($reports as $key => $val) {
	if ($reports[$key]['status'] == 'Новый') $reports[$key]['process'] = 'times';
	else if ($reports[$key]['status'] == 'В обработке') $reports[$key]['process'] = 'clock';
	else if ($reports[$key]['status'] == 'Исправлено') $reports[$key]['process'] = 'check';
	
	if ($reports[$key]['shaders'] == '0') $reports[$key]['shaders'] = 'times';
	else if ($reports[$key]['shaders'] == '1') $reports[$key]['shaders'] = 'check';
}

$GLOBALS['smarty']->assign('reports', $reports);
$GLOBALS['smarty']->assign('user', $member_id);

$GLOBALS['smarty']->display($_SERVER['DOCUMENT_ROOT'].'/scripts/CustomTemplates/bug_reports.tpl');