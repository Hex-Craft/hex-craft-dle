<div class="news-link">
    <span class="just-news">{category}</span>
    <h3 class="news-log">{title}</h3>
    <div class="poster">
        <a href="{full-link}">[image-1]<img class="xfieldimage foto lazy" data-src="{image-1}" alt="">[/image-1]</a>
    </div>
    <p class="description">
     {short-story limit="480"}
	 </p>
    <br>
    <a href="{full-link}" class="blue-gradient btn-drop show-full-news-btn"><i style="padding-right: 5px;" class="fas fa-eye"></i> Подробнее</a>
    <span class="time-data"><i class="fa fa-calendar" aria-hidden="true"></i> {date}</span>
    <span class="time-data"><i class="fa fa-eye" aria-hidden="true"></i> {views}</span>
    <span class="time-data"> {author}</span>
    <a href="{full-link}#dle-comments-list" title="Открыть комментарии"><span class="time-data time-data-btn"><i class="fa fa-comment" aria-hidden="true"></i> {comments-num}</span>
	[rating]
	[rating-type-2]
		<div class="rate_like" title="Мне нравится">
		[rating-plus]
		<span class="time-data time-data-btn">
			<i class="fas fa-heart" style="color:red;"><use xlink:href="#icon-like"></use></i>
			<div style="display: inline;">{rating}</div>
		</span>
		[/rating-plus]
		</div>
	
	[/rating-type-2]
	[/rating]
	[group=1]<span class="time-data time-data-btn" onclick="ajax_prep_for_edit('{news-id}', 'short'); return false;" style="cursor: pointer; height: 41px;" href="#" title="Редактировать"><i class="fas fa-pencil-alt" style="line-height: 20px;"></i></span>[/group]
</div>