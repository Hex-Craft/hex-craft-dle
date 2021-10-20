<?php

class Database {

    public $connect;

    function __construct($array) {
       try {
            $this->connect = new PDO("mysql:dbname={$array['dbname']};host={$array['ip']};charset=utf8;" , $array['user'], $array['password']);
       } catch (PDOException $exception) {
           var_dump($array);
           die('Ошибка подключения базы данных: ' . $exception->getMessage());
       }
    }
	
	
    function query(string $sql, array $parameters = []) {
        try {
            $statement = $this->connect->prepare($sql);
            $statement->execute($parameters);

            return $statement->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $exception) {
            var_dump($exception);
        }
    }

    function table($sql, $parameters = []) {
        $statement = $this->connect->prepare($sql);
        $statement->execute($parameters);

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }

}