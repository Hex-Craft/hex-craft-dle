<?php
exit();
//error_reporting(E_ALL);
//ini_set('display_startup_errors', 1);
//ini_set('display_errors', '1');

require_once ('/home/admin/web/hex-craft.ru/public_html/game_modules/functions/connectDB.php');
require_once ('/home/admin/web/hex-craft.ru/public_html/game_modules/functions/secondsToTime.php');

function giveAchievement($name, $user, $reward, $linkdb_site)
{
	$query_site = mysqli_query($linkdb_site, "UPDATE `dle_user_achievements_list` SET {$name} = '1' WHERE `user_id` = {$user}");
	$query_site = mysqli_query($linkdb_site, "UPDATE `dle_users` SET `user_balance` = `user_balance`+ {$reward} WHERE `user_id` = {$user}");
	echo "Gave achievement to " . $user . " for completeing " . $name . "<br>";
}

$dbdata_classic_cmi = connectDB("classic", "cmi");
$dbdata_classic_jobs = connectDB("classic", "jobs");
$dbdata_classic_clans = connectDB("classic", "clans");
$dbdata_classic_luckperms = connectDB("classic", "luckperms");
$dbdata_hitech = connectDB("hitech", "cmi");
$dbdata_hitech_luckperms = connectDB("hitech", "luckperms");
$dbdata_site = connectDB("site", "");

$linkdb_classic_cmi = mysqli_connect($dbdata_classic_cmi[0], $dbdata_classic_cmi[1], $dbdata_classic_cmi[2], $dbdata_classic_cmi[3]);
$linkdb_classic_jobs = mysqli_connect($dbdata_classic_jobs[0], $dbdata_classic_jobs[1], $dbdata_classic_jobs[2], $dbdata_classic_jobs[3]);
$linkdb_classic_clans = mysqli_connect($dbdata_classic_clans[0], $dbdata_classic_clans[1], $dbdata_classic_clans[2], $dbdata_classic_clans[3]);
$linkdb_classic_luckperms = mysqli_connect($dbdata_classic_luckperms[0], $dbdata_classic_luckperms[1], $dbdata_classic_luckperms[2], $dbdata_classic_luckperms[3]);
$linkdb_hitech = mysqli_connect($dbdata_hitech[0], $dbdata_hitech[1], $dbdata_hitech[2], $dbdata_hitech[3]);
$linkdb_hitech_luckperms = mysqli_connect($dbdata_hitech_luckperms[0], $dbdata_hitech_luckperms[1], $dbdata_hitech_luckperms[2], $dbdata_hitech_luckperms[3]);
$linkdb_site = mysqli_connect($dbdata_site[0], $dbdata_site[1], $dbdata_site[2], $dbdata_site[3]);

if (!$linkdb_classic_cmi || !$linkdb_classic_jobs || !$linkdb_classic_clans || !$linkdb_classic_luckperms || !$linkdb_hitech || !$linkdb_hitech_luckperms || !$linkdb_site) exit("Ошибка подключения к датабазе.");

// SITE
$i = 0;
$users = [];
$site_balance = [];
$votes = [];
$comments = [];
$query_site = mysqli_query($linkdb_site, "SELECT `name`, `user_balance`, `votes`, `user_id`, `comm_num` FROM `dle_users`");

while ($result_site = mysqli_fetch_array($query_site)) 
{
	$users[$i] = $result_site['name'];
	$site_balance[$i] = $result_site['user_balance'];
	$votes[$i] = $result_site['votes'];
	$comments[$i] = $result_site['comm_num'];
	$user_id[$i] = $result_site['user_id'];
	$i++;
}

// CLASSIC CMI
$i = 0;
$classic_playtime_cmi = [];
$classic_balance_cmi = [];
$query_classic_cmi = mysqli_query($linkdb_classic_cmi, "SELECT `username`, `TotalPlayTime`, `Balance` FROM `s11632_users`");

while ($result_classic_cmi = mysqli_fetch_array($query_classic_cmi)) 
{
	while ($i < count($users))
	{
		if ($result_classic_cmi['username'] == $users[$i])
		{
			$classic_playtime_cmi[$i] = $result_classic_cmi['TotalPlayTime'];
			$classic_balance_cmi[$i] = $result_classic_cmi['Balance'];
			break;
		}
		else $i++;
	}
	$i = 0;
}

// CLASSIC JOBS 1
$i = 0;
$levels_jobs = [];
$query_classic_jobs = mysqli_query($linkdb_classic_jobs, "SELECT `username`, `level` FROM jobs_jobs, jobs_users WHERE `jobs_users`.`id` = `jobs_jobs`.`userid` ORDER BY `jobs_jobs`.`level`");

while ($result_classic_jobs = mysqli_fetch_array($query_classic_jobs)) 
{
	while ($i < count($users))
	{
		if ($result_classic_jobs['username'] == $users[$i])
		{
			$levels_jobs[$i] = $result_classic_jobs['level'];
			break;
		}
		else $i++;
	}
	$i = 0;
}

// CLASSIC JOBS 2
$i = 0;
$quests_jobs = [];
$query_classic_jobs = mysqli_query($linkdb_classic_jobs, "SELECT `username`, `donequests` FROM `jobs_users`");

while ($result_classic_jobs = mysqli_fetch_array($query_classic_jobs)) 
{
	while ($i < count($users))
	{
		if ($result_classic_jobs['username'] == $users[$i])
		{
			$quests_jobs[$i] = $result_classic_jobs['donequests'];
			break;
		}
		else $i++;
	}
	$i = 0;
}

// CLASSIC LUCKPERMS
$i = 0;
$ismoder_classic = [];
$query_classic_luckperms = mysqli_query($linkdb_classic_luckperms, "SELECT luckperms_players.username FROM luckperms_players INNER JOIN luckperms_user_permissions ON luckperms_user_permissions.uuid = luckperms_players.uuid WHERE permission = 'group.moder'");

while ($result_classic_luckperms = mysqli_fetch_array($query_classic_luckperms)) 
{
	while ($i < count($users))
	{
		if ($result_classic_luckperms['username'] == $users[$i])
		{
			$ismoder_classic[$i] = 1;
			echo "MODER";
			break;
		}
		else 
		{
			$ismoder_classic[$i] = 0;
			$i++;
		}
	}
	$i = 0;
}

// CLASSIC CLANS
$i = 0;
$isleader = [];
$clan_kills = [];
$clan_deaths = [];
$query_classic_clan = mysqli_query($linkdb_classic_clans, "SELECT `name`, `leader`, friendly_fire+neutral_kills+civilian_kills+rival_kills, `deaths` FROM sc_players");

while ($result_classic_clan = mysqli_fetch_array($query_classic_clan)) 
{
	while ($i < count($users))
	{
		if ($result_classic_clan['name'] == $users[$i])
		{
			$isleader[$i] = $result_classic_clan['leader'];
			$clan_kills[$i] = $result_classic_clan['friendly_fire+neutral_kills+civilian_kills+rival_kills'];
			$clan_deaths[$i] = $result_classic_clan['deaths'];
			//echo $result_classic_clan['name'] . " " . $clan_kills[$i];
			break;
		}
		else $i++;
	}
	$i = 0;
}

// HI-TECH CMI
$i = 0;
$hitech_playtime_cmi = [];
$hitech_balance_cmi = [];
$query_hitech_cmi = mysqli_query($linkdb_hitech, "SELECT `username`, `TotalPlayTime`, `Balance` FROM `s16799_users`");

while ($result_hitech_cmi = mysqli_fetch_array($query_hitech_cmi)) 
{
	while ($i < count($users))
	{
		if ($result_hitech_cmi['username'] == $users[$i])
		{
			$hitech_playtime_cmi[$i] = $result_hitech_cmi['TotalPlayTime'];
			$hitech_balance_cmi[$i] = $result_hitech_cmi['Balance'];
			break;
		}
		else $i++;
	}
	$i = 0;
}

// HI-TECH LUCKPERMS
$i = 0;
$ismoder_hitech = [];
$query_hitech_luckperms = mysqli_query($linkdb_hitech_luckperms, "SELECT luckperms_players.username FROM luckperms_players INNER JOIN luckperms_user_permissions ON luckperms_user_permissions.uuid = luckperms_players.uuid WHERE permission = 'group.moder'");

while ($result_hitech_luckperms = mysqli_fetch_array($query_hitech_luckperms)) 
{
	while ($i < count($users))
	{
		if ($result_hitech_luckperms['username'] == $users[$i])
		{
			$ismoder_hitech[$i] = 1;
			echo "<br>MODER FOUND<br>";
			break;
		}
		else 
		{
			$ismoder_hitech[$i] = 0;
			$i++;
		}
	}
	$i = 0;
}

// ACHIEVEMENTS GET
$i = 0;
$achievements = [[], []];
$query_achievements = mysqli_query($linkdb_site, "SELECT * FROM `dle_user_achievements_list`");

while ($result_achievements = mysqli_fetch_array($query_achievements)) 
{
	while ($i < count($users))
	{
		if ($result_achievements['user_id'] == $user_id[$i])
		{
			$achievements[1][$i] = $result_achievements['complete_reg'];
			$achievements[2][$i] = $result_achievements['1h'];
			$achievements[3][$i] = $result_achievements['4h'];
			$achievements[4][$i] = $result_achievements['10h'];
			$achievements[5][$i] = $result_achievements['24h'];
			$achievements[6][$i] = $result_achievements['48h'];
			$achievements[7][$i] = $result_achievements['5d'];
			$achievements[8][$i] = $result_achievements['10d'];
			$achievements[9][$i] = $result_achievements['30d'];
			$achievements[10][$i] = $result_achievements['15k'];
			$achievements[11][$i] = $result_achievements['30k'];
			$achievements[12][$i] = $result_achievements['50k'];
			$achievements[13][$i] = $result_achievements['100k'];
			$achievements[14][$i] = $result_achievements['500k'];
			$achievements[15][$i] = $result_achievements['1kk'];
			$achievements[16][$i] = $result_achievements['5kk'];
			$achievements[17][$i] = $result_achievements['1kill'];
			$achievements[18][$i] = $result_achievements['10kill'];
			$achievements[19][$i] = $result_achievements['20kill'];
			$achievements[20][$i] = $result_achievements['50kill'];
			$achievements[21][$i] = $result_achievements['100kill'];
			$achievements[22][$i] = $result_achievements['1death'];
			$achievements[23][$i] = $result_achievements['10death'];
			$achievements[24][$i] = $result_achievements['20death'];
			$achievements[25][$i] = $result_achievements['50death'];
			$achievements[26][$i] = $result_achievements['100death'];
			$achievements[27][$i] = $result_achievements['coffee'];
			$achievements[28][$i] = $result_achievements['all_achievements'];
			$achievements[29][$i] = $result_achievements['contest_win'];
			$achievements[30][$i] = $result_achievements['moderator'];
			$achievements[31][$i] = $result_achievements['hex_bless'];
			$achievements[32][$i] = $result_achievements['1vote'];
			$achievements[33][$i] = $result_achievements['5vote'];
			$achievements[34][$i] = $result_achievements['10vote'];
			$achievements[35][$i] = $result_achievements['50vote'];
			$achievements[36][$i] = $result_achievements['100vote'];
			$achievements[37][$i] = $result_achievements['500vote'];
			$achievements[38][$i] = $result_achievements['first_comment'];
			$achievements[39][$i] = $result_achievements['made_feedback'];
			$achievements[40][$i] = $result_achievements['10quests'];
			$achievements[41][$i] = $result_achievements['clan_commandor'];
			$achievements[42][$i] = $result_achievements['job_100lvl'];
			$achievements[43][$i] = $result_achievements['bug_help'];
			break;
		}
		else $i++;
	}
	$i = 0;
}

// ACHIEVEMENTS CHECK
$j = 0;
while ($j < count($users))
{
	$sum_balance = $site_balance[$j] + $classic_balance_cmi[$j] + $hitech_balance_cmi[$j];
	$sum_playtime = $classic_playtime_cmi[$j] + $hitech_playtime_cmi[$j];
	$seconds = $sum_playtime / 700;
	$times = secondsToTime($seconds);
	//echo $users[$j]." ID: ".$user_id[$j]." kills: ".$clan_kills[$j]."<br/>";

	if ($achievements[1][$j] == 0) giveAchievement("complete_reg", $user_id[$j], 1000, $linkdb_site);

	if (($times[2] >= 1 || $times[3] >= 1) && $achievements[2][$j] == 0) giveAchievement("1h", $user_id[$j], 1000, $linkdb_site);
	if (($times[2] >= 4 || $times[3] >= 1) && $achievements[3][$j] == 0) giveAchievement("4h", $user_id[$j], 1000, $linkdb_site);
	if (($times[2] >= 10 || $times[3] >= 1) && $achievements[4][$j] == 0) giveAchievement("10h", $user_id[$j], 2000, $linkdb_site);
	if (($times[2] >= 24 || $times[3] >= 1) && $achievements[5][$j] == 0) giveAchievement("24h", $user_id[$j], 5000, $linkdb_site);
	if ($times[3] >= 2 && $achievements[6][$j] == 0) giveAchievement("48h", $user_id[$j], 5000, $linkdb_site);
	if ($times[3] >= 5 && $achievements[7][$j] == 0) giveAchievement("5d", $user_id[$j], 5000, $linkdb_site);
	if ($times[3] >= 10 && $achievements[8][$j] == 0) giveAchievement("10d", $user_id[$j], 10000, $linkdb_site);
	if ($times[3] >= 30 && $achievements[9][$j] == 0) giveAchievement("30d", $user_id[$j], 20000, $linkdb_site);

	if ($sum_balance >= 15000 && $achievements[10][$j] == 0) giveAchievement("15k", $user_id[$j], 1000, $linkdb_site);
	if ($sum_balance >= 30000 && $achievements[11][$j] == 0) giveAchievement("30k", $user_id[$j], 1000, $linkdb_site);
	if ($sum_balance >= 50000 && $achievements[12][$j] == 0) giveAchievement("50k", $user_id[$j], 2000, $linkdb_site);
	if ($sum_balance >= 100000 && $achievements[13][$j] == 0) giveAchievement("100k", $user_id[$j], 5000, $linkdb_site);
	if ($sum_balance >= 500000 && $achievements[14][$j] == 0) giveAchievement("500k", $user_id[$j], 10000, $linkdb_site);
	if ($sum_balance >= 1000000 && $achievements[15][$j] == 0) giveAchievement("1kk", $user_id[$j], 20000, $linkdb_site);
	if ($sum_balance >= 5000000 && $achievements[16][$j] == 0) giveAchievement("5kk", $user_id[$j], 50000, $linkdb_site);

	if ($clan_kills[$j] >= 1 && $achievements[17][$j] == 0) giveAchievement("1kill", $user_id[$j], 1000, $linkdb_site);
	if ($clan_kills[$j] >= 10 && $achievements[18][$j] == 0) giveAchievement("10kill", $user_id[$j], 2000, $linkdb_site);
	if ($clan_kills[$j] >= 20 && $achievements[19][$j] == 0) giveAchievement("20kill", $user_id[$j], 3000, $linkdb_site);
	if ($clan_kills[$j] >= 50 && $achievements[20][$j] == 0) giveAchievement("50kill", $user_id[$j], 5000, $linkdb_site);
	if ($clan_kills[$j] >= 100 && $achievements[21][$j] == 0) giveAchievement("100kill", $user_id[$j], 10000, $linkdb_site);

	if ($clan_deaths[$j] >= 1 && $achievements[22][$j] == 0) giveAchievement("1death", $user_id[$j], 1000, $linkdb_site);
	if ($clan_deaths[$j] >= 10 && $achievements[23][$j] == 0) giveAchievement("10death", $user_id[$j], 2000, $linkdb_site);
	if ($clan_deaths[$j] >= 20 && $achievements[24][$j] == 0) giveAchievement("20death", $user_id[$j], 3000, $linkdb_site);
	if ($clan_deaths[$j] >= 50 && $achievements[25][$j] == 0) giveAchievement("50death", $user_id[$j], 5000, $linkdb_site);
	if ($clan_deaths[$j] >= 100 && $achievements[26][$j] == 0) giveAchievement("100death", $user_id[$j], 10000, $linkdb_site);

	//27 - секрет с кофе
	if ($achievements[9][$j] == 1 && $achievements[16][$j] == 1 && $achievements[26][$j] == 1 && $achievements[37][$j] == 1 && $achievements[28][$j] == 0) giveAchievement("all_achievements", $user_id[$j], 30000, $linkdb_site);
	//29 - победа в конкурсе
	if (($ismoder_classic[$j] == 1 || $ismoder_hitech[$j] == 1) && $achievements[30][$j] == 0) giveAchievement("moderator", $user_id[$j], 50000, $linkdb_site);
	//31 - благословление Хексагона

	if ($votes[$j] >= 1 && $achievements[32][$j] == 0) giveAchievement("1vote", $user_id[$j], 1000, $linkdb_site);
	if ($votes[$j] >= 5 && $achievements[33][$j] == 0) giveAchievement("5vote", $user_id[$j], 2000, $linkdb_site);
	if ($votes[$j] >= 10 && $achievements[34][$j] == 0) giveAchievement("10vote", $user_id[$j], 5000, $linkdb_site);
	if ($votes[$j] >= 50 && $achievements[35][$j] == 0) giveAchievement("50vote", $user_id[$j], 10000, $linkdb_site);
	if ($votes[$j] >= 100 && $achievements[36][$j] == 0) giveAchievement("100vote", $user_id[$j], 30000, $linkdb_site);
	if ($votes[$j] >= 500 && $achievements[37][$j] == 0) giveAchievement("500vote", $user_id[$j], 50000, $linkdb_site);

	if ($comments[$j] >= 1 && $achievements[38][$j] == 0) giveAchievement("first_comment", $user_id[$j], 1000, $linkdb_site);
	//39 - отзыв о сервере
	if ($quests_jobs[$j] >= 10 && $achievements[40][$j] == 0) giveAchievement("10quests", $user_id[$j], 10000, $linkdb_site);
	if ($isleader[$j] == 1 && $achievements[41][$j] == 0) giveAchievement("clan_commandor", $user_id[$j], 10000, $linkdb_site);
	if ($levels_jobs[$j] >= 100 && $achievements[42][$j] == 0) giveAchievement("job_100lvl", $user_id[$j], 30000, $linkdb_site);
	$j++;
}
	
echo "FINISH"; 

?>