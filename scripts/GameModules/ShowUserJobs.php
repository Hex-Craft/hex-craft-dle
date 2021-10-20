<?php

$id = $GLOBALS['classic_mysql']->query('SELECT id FROM jobs_users WHERE username=:username', [':username'=>$member_id['name']]);

$id = $id['id'];

$user_jobs = $GLOBALS['site_mysql']->table('SELECT job, level FROM jobs_jobs WHERE userid=:userid', [':userid'=>$id]);

$GLOBALS['smarty']->assign('jobs', $user_jobs);

$GLOBALS['smarty']->display($_SERVER['DOCUMENT_ROOT'].'/scripts/CustomTemplates/jobs.tpl');