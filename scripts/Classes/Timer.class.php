<?php

/*
*	Класс для измерения времени выполнения скрипта или операций
*/

class Timer
{
    private static $start = .0;

    static function startTimer()
    {
        self::$start = microtime(true);
    }

    static function timerValue()
    {
        return round(microtime(true) - self::$start, 4);
    }
	
	static function showTimerValue()
    {
        echo round(microtime(true) - self::$start, 4) . "сек.<br>";
    }
}

Timer::startTimer();