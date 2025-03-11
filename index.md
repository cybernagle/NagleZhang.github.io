---
layout: default
title: Home
---

## 最新博客文章

{% for post in site.posts %}
<article class="post-preview">
    <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
    <div class="post-meta">
        <time datetime="{{ post.date | date_to_xmlschema }}">
            {{ post.date | date: "%Y年%m月%d日" }}
        </time>
        {% if post.categories %}
        <span class="categories">
            分类：
            {% for category in post.categories %}
            <a href="/categories#{{ category }}">{{ category }}</a>
            {% endfor %}
        </span>
        {% endif %}
    </div>
    
    <div class="post-excerpt">
        {{ post.excerpt | strip_html | truncatewords: 50 }}
    </div>

    {% if post.bilibili_video %}
    <div class="bilibili-video">
        <iframe src="//player.bilibili.com/player.html?bvid={{ post.bilibili_video }}" 
                scrolling="no" 
                border="0" 
                frameborder="no" 
                framespacing="0" 
                allowfullscreen="true">
        </iframe>
    </div>
    {% endif %}
    
    <a href="{{ post.url | relative_url }}" class="read-more">阅读更多</a>
</article>
{% endfor %}

<hr>