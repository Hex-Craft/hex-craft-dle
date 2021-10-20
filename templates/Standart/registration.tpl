 [registration]
    <span class="name-rog">
<div class="hr-line"></div>
РЕГИСТРАЦИЯ АККАУНТА
</span>
    <div class="section-register">
        <i class="fas fa-dice-one" style="font-size: 54px;"></i>
        <div class="register-panel">
            <div class="arrow-road"></div>
            <span class="name-form">Придумайте себе никнейм <p class="reveria">Минимум 4 символа, максимум 16, пробелы запрещены</p></span>
            <input type="text" name="name" id="name" placeholder="Логин" maxlength="16" class="register-field" pattern="[a-zA-Z0-9_]{3,16}" required="">
            <button class="generatel-btn" title="Проверить" onclick="CheckLogin(); return false;" style="width: 40px; margin-top: 50px; margin: 50px 0 0 704px; position: absolute;">
                <i class="fas fa-question"></i>
            </button>
        </div>
    </div>
    <center>
		<br>
        <div id="result-registration" style="float: right;"></div>
    </center>
    <div class="section-register">
        <i class="fas fa-dice-two" style="font-size: 54px;"></i>
        <div class="register-panel">
            <div class="arrow-road"></div>
            <span class="name-form">Email адрес<p class="reveria">Нужен для восстановления пароля</p></span>
            <input type="email" name="email" id="mail" placeholder="Почта" class="register-field">
        </div>
    </div>
    <div class="section-register">
        <i class="fas fa-dice-three" style="font-size: 54px;"></i>
        <div class="register-panel">
            <div class="arrow-road"></div>
            <span class="name-form">Пароль<p class="reveria">Максимально сложный и длиннее 8 символов!</p></span>
            <input type="password" name="password1" id="password" maxlength="32" placeholder="Пароль" class="register-field">
        </div>
    </div>
    <div class="section-register">
        <i class="fas fa-dice-four" style="font-size: 54px;"></i>
        <div class="register-panel">
            <div class="arrow-road"></div>
            <span class="name-form">Повторите пароль<p class="reveria">Убедиться, что не допущены ошибки</p></span>
            <input type="password" name="password2" id="password-repeat" placeholder="Повторите пароль" class="register-field">
        </div>
    </div>
    <div class="finish-register">
		<div class="captcha">
			[sec_code] <div class="c-captcha">
						{reg_code}
						<input placeholder="Повторите код" title="Введите код указанный на картинке" type="text" name="sec_code" id="sec_code" required>
					</div> 
			[/sec_code] 
			[recaptcha] {recaptcha} [/recaptcha]
		</div>
		<button type="submit" name="submit" style="margin-right: 20px; height: 50px; font-size: 14px;">Зарегистрироваться</button>
    </div>

    <center style="margin-top:10px;"><span>Нажимая расположенную выше кнопку «Зарегистрироваться»,<br> я принимаю условия <a href="/policy.html" target="_blank">пользовательского соглашения</a> и <a href="/server_rules.html" target="/server_rules.html">правила игры</a>.</span></center>
[/registration]
[validation]

<div class="news-link" style="padding-bottom: 20px;">
	<center><span style="font-size: 18px;">Вы были успешно зарегистрированы и залогинены!<br>
	Желаем Приятной игры на наших серверах!</span></center>
	<center><a href="/" class="btn-drop" style="margin: 10px auto; width: 300px; float: none;">На главную</a></center>
</div>
   
[/validation]
