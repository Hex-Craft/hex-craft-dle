<?php

function secondsToTime($seconds) {
	$times = array();
	$count_zero = false;
	$periods = array(60, 3600, 86400, 31536000);

	for ($i = 3; $i >= 0; $i--)
	{
		$period = floor($seconds/$periods[$i]);
		if (($period > 0) || ($period == 0 && $count_zero))
		{
			$times[$i+1] = $period;
			$seconds -= $period * $periods[$i];	
			$count_zero = true;
		}
	}

	$times[0] = $seconds;
	return $times;
}
?>