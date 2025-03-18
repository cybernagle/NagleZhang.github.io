---
layout: page
title: Market Feed
permalink: /feed/
---

{% for feed in site.data %}
  <h2>{{ feed[0] }}</h2>
  <ul>
  {% for entry in feed[1] limit:10 %}
    <li>
      <a href="{{ entry.url }}">{{ entry.title }}</a>
      {% if entry.summary contains "<p>" %}
        <details>
          <summary>Click to expand</summary>
          <p>{{ entry.summary markdownify }}</p>
        </details>
      {% else %}
        <details>
          <summary>Click to expand</summary>
          <p>{{ entry.summary }}</p>
        </details>
      {% endif %}
      <small>{{ entry.published }}</small>
    </li>
  {% endfor %}
  </ul>
{% endfor %}
