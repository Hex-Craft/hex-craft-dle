<article class="box story">
	<div class="box_in">
		<h2>Личные сообщения</h2>
		<div class="pm-box">
			<nav id="pm-menu">
				<div class="pm-status">
					[not-group=1]{pm-sum} / {pm-limit} сообщений[/not-group]
				</div>
				<a href="/index.php?do=pm&folder=inbox" class="btn-drop" style="width: 180px; margin-right: 12px;">
					<i class="fas fa-envelope" style="display: block;padding-top: 6px;"></i>
					<span style="margin-top: -10px; display: block;">Входящие</span>
				</a>
				<a href="/index.php?do=pm&folder=outbox" class="btn-drop" style="width: 180px; margin-right: 12px">
					<i class="fas fa-envelope-open" style="display: block;padding-top: 6px;"></i>
					<span style="margin-top: -10px; display: block;">Отправленные</span>
				</a>
				<a href="/index.php?do=pm&doaction=newpm" class="btn-drop" style="width: 180px;">
					<i class="fas fa-pencil-square" style="display: block;padding-top: 6px;"></i>
					<span style="margin-top: -10px; display: block;">Написать</span>
				</a>
			</nav>
		</div>
		[pmlist]
		<div class="pmlist">
			{pmlist}
		</div>
		[/pmlist]
		[newpm]
		<div class="newpm-panel">
			<h4 class="heading">Создать сообщение</h4>
			<div class="addform addpm">
				<ul class="ui-form">
					<li class="form-group combo" style="display: block">
						<div class="combo_field" style="margin-bottom: 5px;">
							<input placeholder="Имя адресата" type="text" name="name" value="{author}" class="wide" required>
						</div>
						<div class="combo_field">
							<input placeholder="Тема сообщения" type="text" name="subj" value="{subj}" class="wide" required>
						</div>
					</li>
					<li id="comment-editor" style="display: block">{editor}</li>
					<input type="hidden" id="outboxcopy" name="outboxcopy" value="1" checked="checked" visible>  
				[recaptcha]
					<li style="display: block">{recaptcha}</li>
				[/recaptcha]
				[question]
					<li class="form-group" style="display: block">
						<label for="question_answer">Вопрос: {question}</label>
						<input placeholder="Ответ" type="text" name="question_answer" id="question_answer" class="wide" required>
					</li>
				[/question]
				</ul>
				<div class="form_submit">
					[sec_code]
						<div class="c-captcha">
							{sec_code}
							<input placeholder="Повторите код" title="Введите код указанный на картинке" type="text" name="sec_code" id="sec_code" required>
						</div>
					[/sec_code]
					<button class="btn btn-big" type="submit" name="add" style="margin-right: 10px; font-size: 20px;"><b>Отправить</b></button>
					<button class="btn btn-big" type="button" onclick="dlePMPreview()" style="font-size: 20px;">Предпросмотр</button>
				</div>
			</div>
		</div>
		[/newpm]
	</div>
	[readpm]
	<div class="comment" id="{comment-id}">
		<div class="com_info" style="margin-bottom: 16px">
			<div class="avatar">
				<img src="https://hex-craft.ru/skin.php?user={author-nolink}&mode=3" style="height: 50px; float: left;">
			</div>
			<div class="com_user">
				<b class="pmname">{author}[online]<span class="com_online com_status" title="{author-nolink} - онлайн">Онлайн</span>[/online][offline]<span class="com_offline com_status" title="{author-nolink} - оффлайн">Оффлайн</span>[/offline]</b>
				
				<span class="grey">
					отправлено: {date}
				</span>
			</div>
			<div class="meta">
				<span class="pm-button" title="Ответить">[reply]<span>Ответить</span>[/reply]</span>
				<span class="pm-button" title="Игнорировать">[ignore]<span>Игнорировать</span>[/ignore]</span>
				<span class="pm-button" title="Жалоба">[complaint]<span class="title_hide">Жалоба</span>[/complaint]</span>
				<span class="pm-button" title="Удалить">[del]<span class="title_hide">Удалить</span>[/del]</span>
			</div>
		</div>
		<h4 class="pm-subject">Тема: {subj}</h4>
		<div class="com_content">{text}</div>
	</div>
	[/readpm]
</article>