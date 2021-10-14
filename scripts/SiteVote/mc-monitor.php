<?php

require_once ($_SERVER['DOCUMENT_ROOT']."/scripts/InitAll.php");

class Reward
{
    private $requestName;
    private $requestId;
    private $secret_key;
    private $sandbox = false;
    private $site_mysql;

    public function __construct($site_mysql) {
        $this->secret_key = 'secret';
		$this->site_mysql = $site_mysql;
    }

    public function process() {
        $this->validateRequest();
        if ($this->sandbox) return json_encode(['status' => 1, 'message' => 'OK', 'sandbox' => 'true']);
        $response = $this->executeQuery();

        return json_encode(['status' => 1, 'message' => 'OK', 'queryIndex' => $response]);
    }

    private function validateRequest() {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') throw new Exception('Request method not allowed');
        $this->sandbox = empty($_POST['sandbox']) ? false : true;

        if ((empty($_POST['sign']) || empty($_POST['name']) || empty($_POST['id'])) && !$this->sandbox) throw new Exception('Invalid params');
        $this->requestName = $_POST['name'];
        $this->requestId = $_POST['id'];
        $this->validateSign($_POST['sign']);
    }

    private function validateSign($sign) {
        if ($sign !== sha1($this->requestName . $this->secret_key . $this->requestId)) throw new Exception('Invalid signature');
    }

    private function executeQuery() {
		$site_balance = $this->site_mysql->query('SELECT user_balance FROM dle_users WHERE name=:name', [':name'=>$this->requestName]);
		$site_balance = $site_balance['user_balance'] + 5000;
		$this->site_mysql->query("UPDATE dle_users SET user_balance = user_balance+5000, votes=votes+1, votes_month=votes_month+1, votetime='" . date('Y-m-d H:i:s') . "' WHERE name=:name", [':name'=>$this->requestName]);
		$this->site_mysql->query("INSERT INTO log_votes SET date='" . date('Y-m-d H:i:s') . "', nick=:name,  site='MCMON', balance=:site_balance", [':name'=>$this->requestName, ':site_balance'=>$site_balance] );
		
        return 'ok';
    }
}

header('Content-type: application/json');
try {
    $playerReward = new Reward($site_mysql);
    echo $playerReward->process();
} catch (Exception $exception) {
    echo json_encode(['status' => 0, 'message' => $exception->getMessage()]);
}