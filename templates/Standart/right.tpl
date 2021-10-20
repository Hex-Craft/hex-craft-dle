<div class="col-lg-3 col-md-3">
    {login}
    <div class="right-block">
		<div class="n-m">Мониторинг Серверов</div>
        <div class="server online">
			<!-- CLASSIC SERVER -->
            <div class="monitoring">
				<div class="second circle">
					<div style="margin-top: -43px; text-align: center;">
						<div id="current_players_classic"></div>
					</div>
				</div>
                <div class="server_name">
					<a href="/classic.html">CLASSIC 1.16.2</a>
				</div>
                <div class="server_players">
					<i class="fas fa-user"></i>
                    <div id="current_players_classic2" style="display:inline;"></div>/100
                </div>
				<span style="font-size: 12px;">
					<a href="/players_list_classic.html">Список игроков на сервере</a>
				</span>
            </div>
			<!-- INDUSTRY SERVER -->
			<div class="monitoring">
				<div class="third circle">
					<span style="margin-top: -43px; text-align: center">
						<div id="current_players_industry"></div>
					</span>
				</div>
                <div class="server_name">
					<a href="/hitech.html">HI-TECH 1.12.2</a>
				</div>
                <div class="server_players">
					<i class="fas fa-user"></i>
                    <div id="current_players_industry2" style="display:inline;"></div>/100
                </div>
				<a href="/players_list_hitech.html">
					<span style="font-size: 12px;">Список игроков на сервере</span>
				</a>
            </div>
			
			<!-- MAGIC SERVER -->
			<div class="monitoring">
				<div class="fourth circle">
					<span style="margin-top: -43px; text-align: center">
						<div id="current_players_magic"></div>
					</span>
				</div>
                <div class="server_name">
					<a href="/magic.html">MAGIC 1.7.10</a>
				</div>
                <div class="server_players">
					<i class="fas fa-user"></i>
                    <div id="current_players_magic2" style="display:inline;"></div>/100
                </div>
				<a href="/players_list_magic.html">
					<span style="font-size: 12px;">Список игроков на сервере</span>
				</a>
            </div>
			
        </div>
        <p class="tdx-strom" style="">
			<span style="float: left;"><span class="online-o"></span> Общий онлайн: <span id="summary_players"></span></span>
			<span style="float: right;">Рекорд: {include file="scripts/Cache/MaxOnline.php"} игроков</span></p>
        <p class="tdx-strom" style="height: 42px;"><span style="display: -webkit-inline-box;margin: 5 0;">Всего: {include file="scripts/Cache/SumPlayers.php"} игроков</span></p>
        <p class="tdx-strom">
			<a href="/servers_status.html">Аптайм серверов</a>
		</p>
    </div>
	<div class="right-block">
		<div class="n-m" style="text-align: center;">
			<i class="fas fa-crown" style="color:orange"></i> 
			Топ голосующих
			<i class="fas fa-crown" style="color:orange;"></i>
		</div>
		<div style="margin-top: 5px;">{include file="/scripts/GameModules/List/ShowFiveTopVoters.php"}</div>
		<a href="/top.html" style="text-align: center; display: block;">Список лучших игроков</a>
    </div>
    <div class="right-block">
        <div class="n-m">Последние проголосовавшие</div>
		<div style="margin-top: 4px;">{include file="/scripts/GameModules/List/ShowLastVoters.php"}</div>
    </div>
    <div class="rating-container">
        <a href="//mcrate.su/project/9084" class="rating blue-gradient color" rel="nofollow" target="_blank" title="Голосовать на McRate">
			<i class="far fa-heart btn-icon"></i>
			Голос на McRate
		</a>
		<a href="//tmonitoring.com/server/hexserver" class="rating green-gradient color" rel="nofollow" target="_blank" title="Голосовать на TMonitoring">
			<i class="far fa-heart btn-icon"></i>
			Голос на TMonitoring
		</a>
		<a href="//hotmc.ru/minecraft-server-198591" class="rating red-gradient color" rel="nofollow" target="_blank" title="Голосовать на HotMC">
			<i class="far fa-heart btn-icon"></i>
			Голос на HotMC
		</a>
		<a href="//mc-monitor.ru/server/hex-craft" class="rating violet-gradient color status-tooltip" rel="nofollow" target="_blank" title="Голосовать на Mc-Monitor" style="margin-bottom: 0px;">
			<i class="far fa-heart btn-icon"></i>
			Голос на Mc-Monitor
		</a>
    </div>
    <div class="right-block" style="padding: 0px;">
		<a href="//vk.com/hex_craft" target="_blank" title="Наша группа ВК" style="text-decoration: none;">
			<div class="vk_bar">
				<span class="social_text vk">Группа в</span>
				<div class="vk_img"></div>
			</div>
		</a>
    </div>
    <div class="right-block" style="padding: 0px;">
        <a href="//discord.gg/DcrfcRv" target="_blank" title="Наш сервер в Дискорде" style="text-decoration: none;">
			<div class="vk_bar">
				<span class="social_text discord">Сервер в</span>
				<div class="discord_img"></div>
			</div>
		</a>
    </div>
</div>
