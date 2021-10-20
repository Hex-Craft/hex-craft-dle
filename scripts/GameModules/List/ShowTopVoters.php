<?php

$users = $GLOBALS['site_mysql']->table('SELECT votes, name, votetime FROM dle_users ORDER BY votes DESC LIMIT 20');

echo '
<table>
	<tr>
		<th style=\'width: 50px;\'></th>
		<th style = \'width: 150px; text-align: left;padding: 0;\'>Ник</th>
		<th style=\'text-align: left;padding: 0;\'>Количество голосов</th>
	</tr>';

for ($i = 0; $i < sizeof($users); $i++)
{
	$converted_votes = numbersNaminator($users[$i]['votes'], array('голос', 'голоса', 'голосов'))." ";
	echo "
	<tr>
		<th><img src='/skin.php?user=" . $users[$i]['name'] . "&mode=3' class='playerimg'></th>
		<th style='text-align: left;'>
			<span class='playername'>
				<a style=\"cursor: pointer;\"onclick=\"ShowProfile('" . $users[$i]['name'] . "', 'https://hex-craft.ru/user/" . $users[$i]['name'] . "/', '1'); return false;\">" . $users[$i]['name'] . "</a>
			</span>
		</th>
		<th style='text-align: left; width: 192px'>$converted_votes
		</th>
	</tr>";
}

echo "
</table>";