<div class="news-link">
    <span class="just-news">{category}</span>
    <h3 class="news-log"> {title}</h3>
    <p class="description">
	<!-- <img class="fullstory-img fr-dii" src="{image-1}" alt=""> -->
	{full-story}
    </p>
    <br>
    <a href="javascript:history.go(-1)" class="btn-drop" style="float: right;"><span class="ic-sx22"></span><span rel="18"></span> Вернуться</a>
    <span class="time-data"><i class="fa fa-calendar" aria-hidden="true"></i> {date}</span>
    <span class="time-data"><i class="fa fa-eye" aria-hidden="true"></i> {views}</span>
    <span class="time-data"><i class="fa fa-user" aria-hidden="true"></i> {author}</span>
    <span class="time-data"><i class="fa fa-comment" aria-hidden="true"></i> {comments-num}</span>
	[rating]
	[rating-type-2]
		<div class="rate_like" title="Мне нравится">
		[rating-plus]
		<span class="time-data">
			<i class="fas fa-heart" style="color:red;position: relative;"><use xlink:href="#icon-like"></use></i>
			<div style="position: relative;display: inline;">{rating}</div>
		</span>
		[/rating-plus]
		</div>
	
	[/rating-type-2]
	[/rating]
	[group=1]<span class="time-data" onclick="ajax_prep_for_edit('{news-id}', 'short'); return false;" style="cursor: pointer; height: 41px;" href="#"><i class="fas fa-pencil-alt" style="line-height: 20px;"></i></span>[/group]
	</div>
	<script src="https://yastatic.net/es5-shims/0.0.2/es5-shims.min.js"></script>
	<script src="https://yastatic.net/share2/share.js"></script>
	<div class="ya-share2" data-services="collections,vkontakte,facebook,odnoklassniki,moimir,twitter,reddit,telegram" style="margin: -30px 0 14px 10px;"></div>
	