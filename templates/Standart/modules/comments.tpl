<div class="comment" id="{comment-id}">
	<div class="com_info">
		<div class="com_user">
			<img src="https://hex-craft.ru/skin.php?user={login}&mode=3" style="height: 50px; float: left;">
		</div>
		<b class="name-com" style="width: auto; margin-left: 10px;">{author}&nbsp;</b>
		<span class="grey" style="width: 170px; position: absolute;">
			{date}
		</span>
		<div class="meta-com">
			[rating]
			<div class="rate-com" style="float: right; margin-top: -14px;">
				[rating-type-3]
				<div class="rate_like	">
					[rating-plus]&nbsp;<i class="fas fa-caret-up" style="color:green; font-size: 24px;"></i>&nbsp;[/rating-plus]
				</div>
				{rating}
				<div class="rate_like-dislike">
					[rating-minus]&nbsp;<i class="fas fa-caret-down" style="color:red; font-size: 24px;"></i>&nbsp;[/rating-minus]
				</div>
				[/rating-type-3]
			</div>
			[/rating]
			
			<ul class="left-com" style="margin: 0px; left: 300px; width: 500px;">
				<li class="reply grey" title="Цитировать">[fast]<span>Цитировать</span>[/fast]</li>
				[treecomments] 
				<li class="reply grey" title="Ответить">[reply]<span>Ответить</span>[/reply]</li>
				[/treecomments]
				[not-group=5] 
				<li class="edit_btn" title="Редактировать">[com-edit]<i title="Редактировать">Редактировать</i>[/com-edit]</li>
				<li class="del" title="Удалить">[com-del]<span class="title_hide">Удалить</span>[/com-del]</li>
				<li class="mass">{mass-action}</li>
				[/not-group]
			</ul>
		</div>
	</div>
	<div class="com-content" style="width: 800px; height: auto; display: contents;">
		[available=lastcomments|search]<h4 class="title">{news_title}</h4>[/available]
		<div class="text">{comment}</div>
	</div>
</div>