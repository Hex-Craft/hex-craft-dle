<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/InitAll.php';

$uploadname = $_POST['login'];
$uploadtype = $_POST['type'];
$hash = $_POST['hash'];

if (userDiscordHashCheck($uploadname) != $hash) exit('Ошибка хэша.');
if ($uploadtype == 1) $uploaddir = $_SERVER['DOCUMENT_ROOT'] . '/skins/';
if ($uploadtype == 2) $uploaddir = $_SERVER['DOCUMENT_ROOT'] . '/cloaks/';

$apend = $uploadname.'.png';  
$uploadfile = "$uploaddir$apend";

if(file_exists($uploadfile)) unlink($uploadfile);
if($_FILES['userfile']['type'] == 'image/png' && ($_FILES['userfile']['size'] != 0 && $_FILES['userfile']['size']<=524288)) {
	if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) { 
		$size = getimagesize($uploadfile); 
		if ($size[0] < 1025 && $size[1] < 1025) {
			$redicet = $_SERVER['HTTP_REFERER'];
			@header ("Location: $redicet");			
		}
		else unlink($uploadfile);
	}
	else echo "Файл не загружен, вернитеcь и попробуйте еще раз";
}
else echo "Размер файла не должен превышать 512Кб";