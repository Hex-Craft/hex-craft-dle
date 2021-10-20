[shortrss]<item turbo="true">
<title>{title}</title>
<guid isPermaLink="true">{rsslink}</guid>
<link>{rsslink}</link>
<description>{short-story}</description>
[allow-turbo]<![CDATA[{full-story}]]>[/allow-turbo]
<category>{category}</category>
<dc:creator>{rssauthor}</dc:creator>
<pubDate>{rssdate}</pubDate>
</item>[/shortrss]
[fullrss]<item turbo="true">
<title>{title}</title>
<guid isPermaLink="true">{rsslink}</guid>
<link>{rsslink}</link>
<description><![CDATA[{short-story}]]></description>
[allow-turbo]<![CDATA[{full-story}]]>[/allow-turbo]
<category><![CDATA[{category}]]></category>
<dc:creator>{rssauthor}</dc:creator>
<pubDate>{rssdate}</pubDate>
</item>[/fullrss]
[yandexrss]<item turbo="true">
<title>{title}</title>
<link>{rsslink}</link>
<description>{short-story}</description>
<category>{category}</category>{images}
<pubDate>{rssdate}</pubDate>
<yandex:full-text>{full-story}</yandex:full-text>
[allow-turbo]<![CDATA[{full-story}]]>[/allow-turbo]
</item>[/yandexrss]