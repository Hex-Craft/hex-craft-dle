<?php

function checker($var) {
	if($var) return '<i class="fa fa-check" aria-hidden="true"></i>';
	else return '<i class="fa fa-times" aria-hidden="true"></i>';
}	

$GLOBALS['smarty']->assign('member_id', $member_id['name']);

$hash = userDiscordHashCheck($member_id['name']);

$GLOBALS['smarty']->assign('hash', $hash['discord_token']);

if(!isset($_GET["tag"])) {
	$clans = $GLOBALS['classic_mysql']->table('SELECT * FROM sc_clans');
	
	foreach($clans as $key => $value) {
		$clans[$key]['deaths'] = array_sum($GLOBALS['classic_mysql']->table('SELECT SUM(deaths) FROM sc_players WHERE tag=:tag', [':tag'=>$tag]));
		$clans[$key]['kills'] = array_sum($GLOBALS['classic_mysql']->table('SELECT SUM(neutral_kills) + SUM(rival_kills) + SUM(civilian_kills) FROM sc_players WHERE tag=:tag', [':tag'=>$tag]));
		$clans[$key]['kdr'] = round($clans[$key]['kills'] / $clans[$key]['deaths'], 2);
		$clans[$key]['last_used'] = date('d.m.Y H:i:s', $clans[$key]['last_used']/1000);
		$clans[$key]['founded'] = date('d.m.Y H:i:s', $clans[$key]['founded']/1000);
	}
	
	$GLOBALS['smarty']->assign('clans', $clans);
	
	$GLOBALS['smarty']->display($_SERVER['DOCUMENT_ROOT'].'/scripts/CustomTemplates/clan_list.tpl');
} else {
	$tag = $_GET['tag'];
	
	$clan_players = $GLOBALS['classic_mysql']->table('SELECT * FROM sc_players WHERE tag=:tag', [':tag'=>$tag]);
	$clan_info = $GLOBALS['classic_mysql']->table('SELECT * FROM sc_clans WHERE tag=:tag', [':tag'=>$tag]);
	$clan_banner = $clan_info[0]['banner'];

	$clan_banner = str_replace('==:', '', $clan_banner);
	$clan_banner = str_replace('-', '', $clan_banner);
	$clan_banner = str_replace('Pattern', '', $clan_banner);

	$params = explode(':', $clan_banner);

	$banner_color = substr($params[3], 0, -14);
	//$pattern_count = (sizeof($params) - 8) / 2;
	$GLOBALS['smarty']->assign('banner_color', $banner_color);

	for ($i = 8; $i < sizeof($params); $i++) {
		if ($i % 2 == 0) {
			$temp = str_replace('pattern', '', $params[$i]);
			$temp = preg_replace('/\s/', '', $temp);
			$banner_parts .= '<div style="height: 400px; width: 200px; position: absolute; background: ' . $temp;
		} else {
			$temp = trim($params[$i], 'color');
			$temp = preg_replace('/\s/', '', $temp);
			$banner_parts .= ';-webkit-mask-image: url(/img/banners_svg/' . $temp . '.svg);mask-image:url(/img/banners_svg/' . $temp . '.svg);"></div>'	;
		}
	}

	$GLOBALS['smarty']->assign('clan_banner', $banner_parts);
	$GLOBALS['smarty']->assign('clan_players', sizeof($clan_players));

	while ($i < sizeof($clan_players)) {
		if ($clan_players['name'] == $member_id['name'] && $clan_players['leader'] == 1)
			$leader = 1;
		else
			$leader = 0;
	}

	$GLOBALS['smarty']->assign('clan',
			array(	'name' => $clan_info[0]['name'],
					'tag' => $clan_info[0]['tag'],
					'balance' => $clan_info[0]['balance'],
					'verified' => checker($clan_info[0]['verified']),
					'friendly_fire' => checker($clan_info[0]['friendly_fire']),
					'leader' => checker($leader),
					'leader_bool' => $leader,
					'founded' => date('d.m.Y H:i:s', $clan_info[0]['founded']/1000),
					'last_used' => date('d.m.Y H:i:s', $clan_info[0]['last_used']/1000)
				)
			 );

	$player = array();

	for ($i = 0; $i < sizeof($clan_players); $i++) {
		$player[$i] = array(
					'nick' => $clan_players[$i]['name'],
					'kills' => $clan_players[$i]['neutral_kills'] + $clan_players[$i]['rival_kills'] + $clan_players[$i]['civilian_kills'],
					'deaths' => $clan_players[$i]['deaths'],
					'last_seen' => date('d.m.Y H:i:s', $clan_players[$i]['last_seen']/1000),
					'join_date' => date('d.m.Y H:i:s', $clan_players[$i]['join_date']/1000)
				);
	}

	$GLOBALS['smarty']->assign('players', $player);

	$GLOBALS['smarty']->display($_SERVER['DOCUMENT_ROOT'].'/scripts/CustomTemplates/clan.tpl');
}

?>