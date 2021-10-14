<?php

$users = $GLOBALS['site_mysql']->table('SELECT votes_month, name, votetime FROM dle_users ORDER BY votes_month DESC LIMIT 5');

for ($i = 0; $i < sizeof($users); $i++)
{
	$converted_votes = numbersNaminator($users[$i]['votes_month'], array('голос', 'голоса', 'голосов'))." ";
	echo "
	<img data-src='/skin.php?user=" . $users[$i]['name'] . "&mode=3' class='playerimg lazy' style=\"float: left;\"'>
	<span class='playername top-votes'>
		<a style=\"cursor: pointer;\"onclick=\"ShowProfile('" . $users[$i]['name'] . "', 'https://hex-craft.ru/user/" . $users[$i]['name'] . "/', '1'); return false;\">" . $users[$i]['name'] . "</a> - $converted_votes
	</span>
	<div class='underline' style='margin: 4px 0 4px 0;'></div>";
}