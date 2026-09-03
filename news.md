---
title: News
permalink: /news/
---

{% assign news = site.news | sort: "date" | reverse %}
{% for item in news %}
<h3>{{ item.date | date: "%B %-d, %Y" }}</h3>
{{ item.content | markdownify }}
{% endfor %}
