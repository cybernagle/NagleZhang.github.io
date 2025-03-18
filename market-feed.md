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
      {% if entry.summary contains "<p>" %}
        <p>{{ entry.summary markdownify }}</p>
      {% else %}
        <p>{{ entry.summary }}</p>
      {% endif %}
      <small>{{ entry.published }}</small>
    </li>
  {% endfor %}
  </ul>
{% endfor %}
