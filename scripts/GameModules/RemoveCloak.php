<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/InitAll.php';

$user = $_POST['login'];
$hash = $_POST['hash'];

if (userDiscordHashCheck($user) == $hash) {
	if (unlink($_SERVER['DOCUMENT_ROOT'] . '/cloaks/' . $user . '.png')) $result = "<script>DLEalert('Плащ был успешно удалён.', 'Удаление плаща')</script>";
	else $result = "<script>DLEalert('У вас не установлен плащ.', 'Удаление плаща')</script>";
} else $result = "<script>DLEalert('Произошла ошибка сервера. Пожалуйста сообщите об этом администрации.', 'Ошибка')</script>";

$answer = array('answer' => $result); 
echo json_encode($answer); 