[short-preview]
<div class="news-link">
    <span class="just-news">{category}</span>
    <h3 class="news-log">{title}</h3>
    <div class="poster">
        <a href="{full-link}"><img class="xfieldimage foto" src="{image-1}" alt=""></a>
    </div>
    <p class="description">
     {short-story limit="480"}
	 </p>
    <br>
    <a href="{full-link}" class="btn-view"><span class="ic-sx24"></span> Подробнее</a>
    <span class="time-data"><i class="fa fa-calendar" aria-hidden="true"></i> {date}</span>
    <span class="time-data"><i class="fa fa-eye" aria-hidden="true"></i> {views}</span>
    <span class="time-data"><i class="fa fa-user" aria-hidden="true"></i> {author}</span>
    <span class="time-data"><i class="fa fa-comment" aria-hidden="true"></i> {comments-num}</span>
	[rating]
	[rating-type-2]
		<div class="rate_like" title="Мне нравится"">
		[rating-plus]
		<span class="time-data">
			<i class="fas fa-heart" style="color:red;"><use xlink:href="#icon-like"></use></i>
			<div style="display: inline;">{rating}</div>
		</span>
		[/rating-plus]
		</div>
	
	[/rating-type-2]
	[/rating]
	[group=1]<span class="time-data" onclick="ajax_prep_for_edit('{news-id}', 'short'); return false;" style="cursor: pointer; height: 41px;" href="#"><i class="fas fa-pencil-alt" style="line-height: 20px;"></i></span>[/group]
</div>
[/short-preview]

[full-preview]
<div class="news-link">
    <span class="just-news"><span class="masha_index masha_index1" rel="1"></span>{category}</span>
    <h3 class="news-log"><span class="masha_index masha_index2" rel="2"></span> {title}</h3>
    <p class="description">
	<!-- <img class="fullstory-img fr-dii" src="{image-1}" alt=""> -->
	{full-story}
    </p>
    <br>
    <a href="javascript:history.go(-1)" class="btn-view"><span class="ic-sx22"></span><span class="masha_index masha_index18" rel="18"></span> Вернуться</a>
    <span class="time-data"><i class="fa fa-calendar" aria-hidden="true"></i> {date}</span>
    <span class="time-data"><i class="fa fa-eye" aria-hidden="true"></i> {views}</span>
    <span class="time-data"><i class="fa fa-user" aria-hidden="true"></i> {author}</span>
    <span class="time-data"><i class="fa fa-comment" aria-hidden="true"></i> {comments-num}</span>
	[rating]
	[rating-type-2]
		<div class="rate_like" title="Мне нравится"">
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
	<div class="ya-share2" data-services="collections,vkontakte,facebook,odnoklassniki,moimir,twitter,reddit,telegram" style="margin-top: -30px;margin-bottom: 14px;"></div>
	
[/full-preview]



<!-- Предпросмотр статических страниц -->
<!-- Совет: достаточно просто скопировать шаблон статической страницы(static.tpl) -->
[static-preview]
<h2><span id="news-title">{description}</span></h2>

<div>
	{static}
	<br clear="all" />
	{pages}
</div>
[/static-preview]