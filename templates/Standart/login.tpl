[group=5]
<div class="right-block" style="height: 300px;">
    <div class="n-m">Авторизация</div>
    <form action="" method="post">
        <input class="registration_short_field" id="loginname" maxlength="32" name="login_name" placeholder="Логин" required="" style="margin-top:10px;width: 240px;" type="text">
        <br>
        <input class="registration_short_field" id="loginpassword" maxlength="32" name="login_password" placeholder="Пароль" required="" style="margin-top:10px;width: 240px;" type="password">
        <br>
		[vk]
		<a href="{vk_url}" class="no-link"><div style="background-color: #2787f5; color: #fff;" class="login_icon"><i class="fab fa-vk"></i></div>
		[/vk]
		[mailru]
		<a href="{mailru_url}" class="no-link"><div style="background-color: #005ff9; color: #ff9e00;" class="login_icon"><i class="fas fa-at"></i></div>
		[/mailru]
		[yandex]
		<a href="{yandex_url}" class="no-link"><div style="background-color: #e92100; color: #fff;" class="login_icon"><i class="fab fa-yandex"></i></div>
		[/yandex]
		[google]
		<a href="{google_url}" class="no-link"><div style="background-color: #fff; margin-right:0px; position: absolute;" class="login_icon"><div id="google"></div></div>
		[/google]
        <button class="btn-drop" id="loginsubmit" type="submit" style="width: 240px;">Войти</button>
        <input name="login" type="hidden" value="submit">
        <a class="reg-uss" href="{registration-link}">Регистрация</a>
		<a class="rest-pass" href="{lostpassword-link}">Забыли пароль?</a>
    </form>
</div>
[/group]
[not-group=5]
<div class="right-block">
<div class="n-m">Ваш Аккаунт</div>
<div id="loginpane">
<div style="margin-top: 10px;">
<img src="https://hex-craft.ru/skin.php?user={login}&mode=3" style="display: block; position: relative; height: 50px; left: 10px;">
<div class="name">
Привет,<br>
<a href="{profile-link}" id="username"><b>{login}</b></a>!
</div>
<ul class="login_menu">
<li>
<b class="lm_num"><i class="fas fa-header" style="color:#42a4f3"></i></b>У вас: {user_balance} хекселей
</li>
<li class="underline">
<a href="/webcash/plugin/upbalance" class="status-tooltip">
	<div class="tooltip-triangle tt-left tooltip-triangle-achievements" style="top: 3px; left: 0px;"></div>
	<span class="status-tooltiptext tooltip-achievements" style="top: -6px; left: -140px; line-height: 30px; width: 180px;">Нажми что-бы купить</span>
	<b class="lm_num"><i class="fas fa-coins" style="color:#42a4f3"></i></b>У вас: {include file="/engine/modules/webcash/site/showbalance.php"}
</a>
</li>
<li>
<a href="{profile-link}"><b class="lm_num"><i class="fas fa-user-cog" style="color:#42a4f3"></i></b>Личный кабинет</a>
</li>
<li>
<a href="{pm-link}"><b class="lm_num"><i class="fas fa-envelope" style="width:19px;margin-left:1px;color:#42a4f3"></i></b>Почта <span style="font-size: 12px;">( <span style="color:#4695ed">{new-pm}</span> )</span></a>
</li>
<li>
<a href="/clan.html"><b class="lm_num"><i class="fas fa-fist-raised" style="color:#42a4f3"></i></b>Кланы</a>
</li>
<li>
<a href="/help.html"><b class="lm_num"><i class="fas fa-headset" style="color:#42a4f3"></i></b>Помощь </a>
</li>
<li>
<a href="/donate.html"><b class="lm_num"><i class="fas fa-shopping-cart" style="color:#42a4f3"></i></b>Донат</a>
</li>
<li>
<a href="/issue_tracker.html"><b class="lm_num"><i class="fas fa-bug" style="color:#42a4f3"></i></b>Сообщить об ошибке</a>
</li>
</ul>
<div class="login_form_links">
<a href="{logout-link}">Выход</a>
</div>
</div>
</div>
</div>
[/not-group]