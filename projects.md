---
title: Projects
permalink: /projects/
---

Scientific software in quantum computing, manifold optimization, and computational complexity.

{% assign projects = site.projects | sort: "importance" %}
<ul>
{% for p in projects %}
<li><a href="{{ p.url | relative_url }}">{{ p.title }}</a> &mdash; {{ p.description }}</li>
{% endfor %}
</ul>

See also [LogosQ](https://github.com/zazabap/LogosQ), a high-performance and type-safe quantum computing library in Rust ([documentation](https://logosqbook.vercel.app/)).
