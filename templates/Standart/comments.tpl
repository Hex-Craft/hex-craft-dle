<div class="comment" id="{comment-id}">
	<div class="com_info">
		<div class="com_user">
			<img src="https://hex-craft.ru/skin.php?user={login}&mode=3" style="height: 50px; float: left;">
		</div>
		<b class="name-com" style="width: auto; margin-left: 10px;">{author}&nbsp;</b>
		<span class="grey" style="width: 170px; position: absolute;">
			{date}
		</span>
		<div class="meta-com" style="float: right">
			<span class="pm-button" title="Цитировать">[fast]<span>Ответить</span>[/fast]</span>
			[treecomments] 
				<span class="pm-button" title="Ответить">[reply]<span>Ответить</span>[/reply]</span>
			[/treecomments]
			[not-group=5] 
				<span class="pm-button" title="Удалить">[com-del]<span class="title_hide">Удалить</span>[/com-del]</span>
				[group=1]
					<span class="pm-button" title="Редактировать">[com-edit]<span title="Редактировать">Редактировать</span>[/com-edit]</span>
					<span class="mass">{mass-action}</span>
				[/group]
			[/not-group]
		</div>
		[rating]
			<div style="float: right; display: flex;">
				[rating-type-3]
				<div class="rate_like">
					[rating-plus]&nbsp;<i class="fas fa-caret-up" style="color:green; font-size: 24px;"></i>&nbsp;[/rating-plus]
				</div>
				{rating}
				<div class="rate_like-dislike">
					[rating-minus]&nbsp;<i class="fas fa-caret-down" style="color:red; font-size: 24px;"></i>&nbsp;[/rating-minus]
				</div>
				[/rating-type-3]
			</div>
		[/rating]
	</div>
	<div class="com-content" style="width: 800px; height: auto; display: contents;">
		[available=lastcomments|search]<h4 class="title">{news_title}</h4>[/available]
		<div class="text">{comment}</div>
	</div>
</div>