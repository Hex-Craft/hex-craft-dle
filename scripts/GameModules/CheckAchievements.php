<?php

//НУЖЕН РЕФАКТОРИНГ

exit();
require_once ($_SERVER['DOCUMENT_ROOT'].'/scripts/Classes/Database.class.php');
require_once ($_SERVER['DOCUMENT_ROOT'].'/game_modules/functions/secondsToTime.php');

function giveAchievement($name, $user, $reward, $linkdb_site)
{
	$query_site = mysqli_query($linkdb_site, "UPDATE `dle_user_achievements_list` SET {$name} = '1' WHERE `user_id` = {$user}");
	$query_site = mysqli_query($linkdb_site, "UPDATE `dle_users` SET `user_balance` = `user_balance`+ {$reward} WHERE `user_id` = {$user}");
	echo "Gave achievement to " . $user . " for completeing " . $name . "<br>";
}

$db_site = new Database("site", "");
$db_site->selectTable("dle_users");
$site = $db_site->getRows("`name`, `user_balance`, `votes`, `user_id`, `comm_num`");

$db_site->selectTable("dle_user_achievements_list");
$site_achievements = $db_site->getRows("*");

$db_classic_cmi = new Database("classic", "cmi");
$db_classic_cmi->selectTable("s11632_users");
$classic_cmi = $db_classic_cmi->getRows("`username`, `TotalPlayTime`, `Balance`");

$db_classic_jobs = new Database("classic", "jobs");
$db_classic_jobs->selectTable("jobs_jobs");
$classic_jobs = $db_classic_jobs->getRows("`username`, `level`", "`jobs_users`.`id` = `jobs_jobs`.`userid` ORDER BY `jobs_jobs`.`level");

$db_classic_jobs->selectTable("jobs_users");
$classic_jobs_quests = $db_classic_jobs->getRows("`username`, `donequests`");

$db_classic_luckperms = new Database("classic", "luckperms");
$db_classic_luckperms->selectTable("luckperms_players");
$classic_luckperms = $db_classic_luckperms->getRows("`luckperms_players.username`", "luckperms_user_permissions ON luckperms_user_permissions.uuid = luckperms_players.uuid", "permission = 'group.moder'");

$db_classic_clans = new Database("classic", "clans");
$db_classic_clans->selectTable("sc_players");
$classic_clans = $db_classic_clans->getRows("`name`, `leader`, friendly_fire+neutral_kills+civilian_kills+rival_kills, `deaths`");

$db_hitech_cmi = new Database("hitech", "cmi");
$db_hitech_cmi->selectTable("s16799_users");
$hitech_cmi = $db_hitech_cmi->getRows("`username`, `TotalPlayTime`, `Balance`");

$db_hitech_luckperms = new Database("hitech", "luckperms");
$db_hitech_luckperms->selectTable("luckperms_players");
$hitech_luckperms = $db_hitech_luckperms->getRows("`luckperms_players.username`", "luckperms_user_permissions ON luckperms_user_permissions.uuid = luckperms_players.uuid", "permission = 'group.moder'");

// ACHIEVEMENTS CHECK
for ($j = 0; $j < sizeof($users); $j++)
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

?>