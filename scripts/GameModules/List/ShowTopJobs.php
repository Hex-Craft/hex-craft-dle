<?php
exit();

$db_site = new Database("classic", "jobs");
$users = $db_site->getRows("`username`, `level` FROM jobs_jobs, jobs_users", null, "`jobs_users`.`id` = `jobs_jobs`.`userid`", "`jobs_jobs`.`level` DESC LIMIT 20", true);

$users = $GLOBALS['classic_mysql']->table('SELECT username, level FROM jobs_users SORT BY votetime DESC LIMIT 3');

echo '
<table>
	<tr>
		<th style="width: 50px;"></th>
		<th style = "width: 150px; text-align: left;padding: 0;">Ник</th>
		<th style="text-align: left;padding: 0;">Уровень профессий</th>
	</tr>';

for ($i = 0; $i < sizeof($users); $i++)
{
	echo '
	<tr>
		<th>
			<img src="/skin.php?user=' . $users[$i]['username'] . '&mode=3" class="playerimg">
		</th>
		<th style="text-align: left;">
			<span class="playername">
				<a style="cursor: pointer;"onclick="ShowProfile("' . $users[$i]['username'] . '", "https://hex-craft.ru/user/$name/", "1"); return false;">' . $users[$i]['username'] . '</a>
			</span>
		</th>
		<th style="text-align: left; width: 192px;">' . $users[$i]['level'] . ' уровень</th>
	</tr>';
}

echo "</table>";

?>