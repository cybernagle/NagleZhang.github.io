---
layout: page
title: Market Feed
permalink: /feed/
---

<h1>Market Feed</h1>
{% for feed in site.data %}
  <h2>{{ feed[0] }}</h2>
  <ul>
  {% for entry in feed[1] limit:10 %}
    <li>
      <a href="{{ entry.url }}">{{ entry.title }}</a>
      <p>{{ entry.summary | truncate: 200 }}</p>
      <small>{{ entry.published }}</small>
    </li>
  {% endfor %}
  </ul>
{% endfor %}


