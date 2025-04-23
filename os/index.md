---
layout: notion
title: "Computer Architecture & Operating Systems"
permalink: /os/
---

# Computer Architecture & Operating Systems Notes

Welcome to my digital garden of Computer Architecture and Operating Systems knowledge.

## Recent Notes

{% for post in site.categories.os limit:5 %}
<div class="page-block">
  <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
  <p>{{ post.excerpt }}</p>
  <small>{{ post.date | date: "%B %d, %Y" }}</small>
</div>
{% endfor %}

## Topics

### Computer Architecture
- Processor Design
- Memory Hierarchy
- Instruction Set Architecture (ISA)
- Pipelining
- Cache Organization

### Operating Systems
- Process Management
- Memory Management
- File Systems
- I/O Systems
- Virtualization