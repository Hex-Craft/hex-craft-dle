<?php

/*
*	Позволяет отправлять команды на сервер, управлять его питанием, делать бекап и получать инфо о нагрузке.
*	Автоматически инициализируется в index.php.
*/

class ServerApi {

    public $server;
    public $api = "https://panel.hex-craft.ru/api/client/servers/";

    function __construct(array $server) {
        $this->server = (object) $server;
    }

    function sendCommand (string $command) {
        if(!is_array($command))
            $command = [$command];

        foreach ($command as $k => $v){
            $headers = stream_context_create(array(
                'http' => array(
                    'method' => 'POST',
                    'header' => "Authorization: Bearer " . $this->server->api_key,
                    'content' => "command=$v",
                ),
            ));
			
            return file_get_contents($this->api . $this->server->id . '/command', false, $headers);
        }
    }
	
	
    function changePower (string $signal) {
        $headers = stream_context_create(array(
            'http' => array(
                'method' => 'POST',
                'header' => "Authorization: Bearer " . $this->server->api_key,
                'content' => "signal=$signal",
            ),
        ));

        return file_get_contents($this->api . $this->server->id . '/power', false, $headers);
    }

    function resources () {
        $headers = stream_context_create(array(
            'http' => array(
                'method' => 'GET',
                'header' => "Authorization: Bearer " . $this->server->api_key,
                'content' => "",
            ),
        ));
		
        return file_get_contents($this->api . $this->server->id . '/resources', false, $headers);
    }
	
	function createBackup () {
        $headers = stream_context_create(array(
            'http' => array(
                'method' => 'POST',
                'user-agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 OPR/78.0.4093.186', // Временный костыль, баг на стороне Pterodactyl
                'header' => "Authorization: Bearer " . $this->server->api_key,
                'content' => "",
            ),
        ));
		
        return file_get_contents($this->api . $this->server->id . '/backups', false, $headers);
    }

}