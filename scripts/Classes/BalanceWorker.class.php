<?php

class BalanceWorker
{

    private $creditentials;
    private $user;
    private $server_name;
    private $discord_token;
    private $hash;
    private $value;
    private $server;
    private $type;
    private $db_site;
    private $db_log;
    private $db_server;
    private $balance_site = 0;
    private $debug = 0;

    public function __construct($user, $hash, $value, $server, $type, $db_site, $db_log)
    {
        $json = file_get_contents($_SERVER['DOCUMENT_ROOT'] . "/scripts/Config/Creditentials.json");
        $this->creditentials = json_decode($json, true);

        $site = $this->db_site->getRows('`user_balance`, `discord_token`', null, "name='" . $this->user . "'");

        $this->discord_token = $site[0]['discord_token'];
        $this->balance_site = round($site[0]['user_balance']);

        if ($this->discord_token != $this->hash) {
            $this->user .= '( HACKER )';
            $this->callback("<script>DLEalert('ОБНАРУЖЕНА ПОПЫТКА ВЗЛОМА. СИСТЕМА ЗАФИКСИРОВАЛА ДАННОЕ ДЕЙСТВИЕ.', 'Перевод хекселей')</script>", 0);
        }
    }

    private function callback($answer, $done = null)
    {
        if ($this->type == 1) {
            $this->type = 'to';
        } else {
            $this->type = 'from';
        }

        $this->db_log->insert("date='" . date('Y-m-d H:i:s') . "', nick='" . $this->user . "', site_balance=" . $this->balance_site . ", value=" . $this->value . ", server=" . $this->server . ", type=" . $this->type . ", ip='" . userIP() . "', done=" . $done);
        $result = array('balanswer' => $answer);
        echo json_encode($result);
        exit();
    }

    public function fromSiteToServer($server_name, $db_server)
    {
        if ($this->creditentials[$server_name]['balance_manager'] == 0)
            $this->callback("<script>DLEalert('Перевод на сервер " . mb_strtoupper($this->server_name) . " временно отключен. Ведутся тех-работы.', 'Перевод хекселей')</script>");
        else {
            if ($balance_server = $db_server->getRow('`Balance`', "nickname='" . $this->user . "'")) {
                sendServerCommand("money give $this->user $this->value", $server_name);
                $this->db_site->update('`user_balance` = user_balance-' . $this->value, "name='" . $this->user . "'");
                $this->callback("<script>DLEalert('$this->value хекселей успешно отправлены на сервер " . mb_strtoupper($server_name) . " игроку $this->user.', 'Перевод хекселей')</script>", 1);
            } else $this->callback("<script>DLEalert('Балланс на сервере " . mb_strtoupper($server_name) . " не был найден.', 'Перевод хекселей')</script>", 0);
        }
    }

    public function fromServerToSite($server_name, $db_server)
    {
        if ($this->creditentials[$server_name]['balance_manager'] == 0)
            $this->callback("<script>DLEalert('Перевод с сервера " . mb_strtoupper($server_name) . " временно отключена. Ведутся тех-работы.', 'Перевод хекселей')</script>");
        $balance_server = $db_server->getRow('`Balance`', "username='" . $this->user . "'");
        if ($balance_server >= $this->value) //Если на сервере денег больше или равно чем запрошено
        {
            $comissioned = $this->value * 0.9;
            $this->db_site->update('`user_balance` = user_balance+' . $comissioned, "name='" . $this->user . "'"); //Зачисляем хексели на сайт
            sendServerCommand("money take $this->user $this->value", $server_name);
            $this->callback("<script>DLEalert('$this->value - 10% комиссии = $comissioned хекселей успешно переведены на сайт игроку $this->user.', 'Перевод хекселей')</script>", 1);
        } else $this->callback("<script>DLEalert('На сервере " . mb_strtoupper($server_name) . " недостаточно хекселей.', 'Перевод хекселей')</script>", 0);
    }
}

?>