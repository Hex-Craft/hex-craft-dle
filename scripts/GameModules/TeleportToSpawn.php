<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/InitAll.php';

$user = $_POST['login'];
$hash = $_POST['hash'];
$server = $_POST['server'];

if (userDiscordHashCheck($user) != $hash) {
	$answer = "<script>DLEalert('Ошибка хэша, попробуйте обновить страницу, лиюо обратитесь к администратору.', 'Телепортация на спавн');</script>";
} else {
	$GLOBALS[$server . '_api']->sendCommand("cmi spawn $user");
	$answer = "<script>DLEalert('Вы были успешно телепортированы на спавн на сервере " . mb_strtoupper($server) . ".', 'Телепортация на спавн');</script>";
}

$result = array('answer' => $answer); 
echo json_encode($result);