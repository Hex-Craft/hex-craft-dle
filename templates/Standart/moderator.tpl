<span class="name-rog">
<div class="hr-line"></div>
{description}
<div class="news-link" style="padding:20px; margin-bottom: 0px; color: #828282; font-weight: 300;">
<h2>Заполните анкету:</h2>
<form method="POST" style="font-size: 19px" action="/scripts/GameModules/ModerRequest.php">
	<span>Необходимо заполнить все поля.</span><br>
	<span>Как вас зовут?</span><br>
	<input type="text" name="login" required placeholder="Имя" maxlength="32" value=""><br><br>
	<span>Сколько вам лет? (минимальный возраст - 14 лет)</span><br>
	<input type="text" name="age" required placeholder="Возраст" maxlength="2"><br><br>
	<span>Сколько времени вы играете на нашем сервере?</span><br>
	<input type="text" name="playtime" required placeholder="Время игры" maxlength="128"><br><br>
	<span>В какое время вы обычно заходите на сервер? (по МСК)</span><br>
	<input type="text" name="realtime" required placeholder="Обычно в игре" maxlength="128"><br><br>
	<span>Оцените ваше знание русского языка по 10 бальной шкале</span><br>
	<input type="text" name="mark" required placeholder="Оценка русского языка" maxlength="2"><br><br>
	<span>Ваш Discord#Tag для связи</span><br>
	<input type="text" name="discord" required placeholder="Discord#Tag" maxlength="32"><br><br>
	<span>Почему вы хотите стать модератором?</span><br>
	<textarea name="why" wrap="soft" style="width: 830; height: 140;" required maxlength="600"></textarea><br><br>
	<span>Напишите основываясь на своем мнение что должно входить в обязанности модератора</span><br>
	<textarea name="todo" style="width: 830; height: 140;" required placeholder="Обязанности модератора" maxlength="600"></textarea><br><br>
	<span>Откуда вы узнали о проекте?</span><br>
	<textarea name="how" style="width: 830; height: 140;" required maxlength="300"></textarea><br><br>
	<span>В правилах в дискорде зашифрована кодовая фраза, буквы для неё выделены жирным и курсивом. Написание этой фразы увеличивает шанс получить должность на 50%(Необязательно)</span><br>
	<input type="text" name="moder" style="width: 830;" placeholder="Кодовая фраза" maxlength="32"><br><br>
	<input type="submit" value="Подать заявку">
</form>
</div>
</span>
{static}