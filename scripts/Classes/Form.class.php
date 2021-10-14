<?php

class Form {
	
	public $type;
	public $user;
	public $hash;
	
	function __construct($type) {
		if ($type =='GET') if (!hashIsValid($_GET['hash'])) exit('Несовпадение хэша.');
		else if ($type =='POST') if (!hashIsValid($_POST['hash'])) exit('Несовпадение хэша.');
    }

	function getHash($user) {
		$hash = $GLOBALS['site_mysql']->query('SELECT hash FROM dle_users WHERE name=:user', [':user'=>$user]);
		return $hash['hash'];
	}

	function hashIsValid($user, $check_hash) {
		$hash = getHash($user)
		if ($hash == $check_hash) return true;
		else return false;
	}

}