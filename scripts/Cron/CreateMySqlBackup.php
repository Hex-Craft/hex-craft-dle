<?php

mkdir('/var/www/html/backups/' . $today = date("d.m.Y"), 0777);

$filename='backup_dle_site.sql';
$result=exec('mysqldump dle_site --password=begEo7A0JM9NhmNC --user=hexagon --single-transaction >/var/www/html/backups/' . date("d.m.Y") . '/' . $filename, $output);
if(!empty($output)) echo 'ОШИБКА: ' . $output;
sleep(10);
$filename='backup_admin_classic.sql';
$result=exec('mysqldump admin_classic --password=begEo7A0JM9NhmNC --user=hexagon --single-transaction >/var/www/html/backups/' . date("d.m.Y") . '/' . $filename, $output);
if(!empty($output)) echo 'ОШИБКА: ' . $output;
sleep(10);
$filename='backup_admin_hitech.sql';
$result=exec('mysqldump admin_hitech --password=begEo7A0JM9NhmNC --user=hexagon --single-transaction >/var/www/html/backups/' . date("d.m.Y") . '/' . $filename, $output);
if(!empty($output)) echo 'ОШИБКА: ' . $output;
sleep(10);
$filename='backup_admin_magic.sql';
$result=exec('mysqldump admin_magic --password=begEo7A0JM9NhmNC --user=hexagon --single-transaction >/var/www/html/backups/' . date("d.m.Y") . '/' . $filename, $output);
if(!empty($output)) echo 'ОШИБКА: ' . $output;