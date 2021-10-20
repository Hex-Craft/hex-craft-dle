<div class="news-link" style="padding: 20px">
	<h4 class="title h1">Обратная связь</h4>
	<div class="addform">
		<!-- [not-logged] -->
		<!-- <li class="form-group combo"> -->
			<!-- <div class="combo_field"><input placeholder="Ваше имя" type="text" maxlength="35" name="name" id="name" class="wide" required></div> -->
			<!-- <div class="combo_field"><input placeholder="Ваш E-mail" type="email" maxlength="35" name="email" id="email" class="wide" required></div> -->
		<!-- </li> -->
		<!-- [/not-logged] -->
			<label>Получатель</label><br>
			{recipient}<br>
			<input placeholder="Тема сообщения" type="text" maxlength="45" name="subject" id="subject" class="wide" required style="margin-top: 15px;"><br>
			<textarea placeholder="Сообщение" name="message" id="message" rows="8" class="wide" required style="width: 830px; height: 100px;margin-top: 15px;"></textarea>
		[attachments]
			<label for="question_answer" style="margin-top: 10px; display: block;">Прикрепить файлы:</label>
			<input name="attachments[]" type="file" multiple style="margin-bottom: 15px;"><br>
		[/attachments]
		[recaptcha]
			{recaptcha}
		[/recaptcha]
		[question]
			<label for="question_answer">Вопрос: {question}</label><br>
			<input placeholder="Ответ" type="text" name="question_answer" id="question_answer" class="wide" required>
		[/question]
		<div class="form_submit"  style="height: 53px; margin-top: 15px">
			[sec_code]
				<div class="c-captcha">
					{code}
					<input placeholder="Повторите код" title="Введите код указанный на картинке" type="text" name="sec_code" id="sec_code" required>
				</div>
			[/sec_code]
			<button class="btn btn-big" type="submit" name="send_btn"><b>Отправить сообщение</b></button>
		</div>
	</div>
</div>