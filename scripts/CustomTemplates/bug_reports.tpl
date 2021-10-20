<div class="issue-ticket-container issue-6">
    <span class="issue-ticket-title"><i class="fas fa-info-circle"></i> Как правильно оформлять тикеты</span>
    <br>
    <br>
    <span class="issue-ticket-description">
	При создании тикета правильно выберите тип проблемы с которой вы столкнулись. Например если что-то работает не так как должно, это наверняка баг. Если этот баг не влияет на геймплей наверняка это косметический баг. Если же вы обнаружили дюп, это явно проблема первой важности.<br>Вы также можете предложить что-либо или указать на неточность в переводе.
	<br>&nbsp;
	</span>
</div>

<form class="issue-ticket-container" style="max-height: none;" method="POST" action="/scripts/GameModules/AddBugReport.php">
<span class="issue-ticket-title">Создать новый тикет</span>
	<div>
		<div class="issue-input-block">
			<span>Кратко опишите суть проблемы</span>
			<br>
			<input type="text" maxlength="48" name="title" placeholder="Не работает крафт в IC2" required style="width: 400px;">
		</div>
		<div class="issue-input-block f-r">
			<span>Ваша операционная система</span>
			<br>
			<input type="text" maxlength="32" name="system" placeholder="Windows 10 10.0.19041" required style="width: 400px;">
		</div>
		
		<div class="issue-input-block">
			<span>Важность</span>
			<br>
			<select name="importance" style="width: 400px" required>
				<option value="1">1 (критически)</option>
				<option value="2">2 (важно)</option>
				<option value="3">3 (средняя)</option>
				<option value="4">4 (обычно)</option>
				<option value="5" selected>5 (косметическое)</option>
			</select>
		</div>
		<div class="issue-input-block f-r">
			<span>Тип проблемы</span>
			<br>
			<select name="type" style="width: 400px" required>
				<option value="Баг">Баг</option>
				<option value="Дюп">Дюп</option>
				<option value="Косметическое">Косметическое</option>
				<option value="Перевод">Перевод</option>
				<option value="Предложение" selected>Предложение</option>
			</select>
		</div>
		
		<div class="issue-input-block">
			<span>Кол-во выделенной для игры оперативной памяти</span>
			<br>
			<input type="number" maxlength="16" name="ram" placeholder="4096" required style="width: 400px;" step="512">
		</div>
		<div class="issue-input-block f-r">
			<span>Источник бага</span>
			<br>
			<select name="source" style="width: 400px" required>
				<option value="Сайт">Сайт</option>
				<option value="Лаунчер">Лаунчер</option>
				<option value="Дискорд бот">Дискорд бот</option>
				<option value="Classic">Classic</option>
				<option value="Hi-Tech" selected>Hi-Tech</option>
				<option value="Magic">Magic</option>
			</select>
		</div>
		
		<div class="issue-input-block">
			<span>Наличие шейдеров или ресурспаков</span>
			<br>
			<input type="checkbox" name="shaders" style="margin-top: 10px;"> У меня установлены шейдеры/ресурспаки
		</div>
	</div>
    <span>Теперь опишите ваш запрос в полных подробностях.<br>Если вы хотите указать на ошибку перевода, напишите название мода, ID предмета, и место ошибки(интерфейс).</span>
    <textarea name="description" id="countable" maxlength="4096" onchange="countChar()" onkeyup="countChar()" class="issue-text" required placeholder="1. Шаги воспроизведения
2. Ожидаемый результат
3. Фактический результат"></textarea>
    <br>
    <span id="counter" class="counter-text">0/4096</span>
	<br>
	<br>
	
	<input type="text" name="user" value="{$user.name}" hidden>
	<input type="text" name="discord_token" value="{$user.discord_token}" hidden>
	
	<input type="submit" class="btn-drop" style="width: 200px; margin-bottom: 20px;" value="Добавить тикет">
</form>

<hr>

{foreach from=$reports item=report}
    <div class="issue-ticket-container issue-{$report.importance}">
        <span class="issue-ticket-title">{$report.title}</span>
        <span style="float: right; margin-top: 10px;">{$report.status} <i class="fas fa-{$report.process}"></i></span><br>
        <span>
		Тип: {$report.type} | Сервер: {$report.server} | Система: {$report.system} | ОЗУ: {$report.ram}МБ | Шейдеры: <i class="fas fa-{$report.shaders}"></i>
		</span>
		<div class="issue-desc-container">
            <span class="issue-ticket-description">{$report.description}</span>
        </div>
        <div class="issue-info"><i class="fa fa-calendar" aria-hidden="true"></i> {$report.datetime} &nbsp;&nbsp;
            <a onclick="ShowProfile('{$report.user}', 'https://hex-craft.ru/user/{$report.user}/', '1'); return false;"
               href="https://hex-craft.ru/user/{$report.user}/"><i class="fa fa-user" aria-hidden="true"></i>
                {$report.user}</a></div>
    </div>
{/foreach}

<script>
    // Авторазмер textarea
    var tx = document.getElementsByTagName('textarea');

    for (var i = 0; i < tx.length; i++) {
        tx[i].setAttribute('style', 'height: ' + (tx[i].scrollHeight) + 'px;');
        tx[i].addEventListener("input", OnInput, false);
    }

    function OnInput() {
        this.style.height = 'auto';
        this.style.height = (this.scrollHeight) + 'px';
    }

    // Счёт символов
    function countChar() {
        var countable = document.getElementById("countable");
        var counter = document.getElementById("counter");
        counter.innerHTML = countable.value.length + "/4096";
    }
</script>