---
layout: notion
title: "Computer Architecture & Operating Systems"
permalink: /os/
---

# [Computer Architecture & Operating Systems](os/_posts/2024-01-01-introduction-to-computer-architecture.md)

Exploring the fundamentals and advanced concepts of computer systems, from silicon to software.

## 📝 Recent Notes

{% for post in site.categories.os limit:5 %}
### [{{ post.title }}]({{ post.url }})
{{ post.excerpt | strip_html | truncatewords: 30 }}
*{{ post.date | date: "%B %d, %Y" }}*
{% endfor %}

## 📚 Main Topics

### 🔧 Computer Architecture
- ⚡ Processor Design
- 📊 Memory Hierarchy
- 💻 Instruction Set Architecture (ISA)
- 🔄 Pipelining
- 💾 Cache Organization

### 🖥️ Operating Systems
- ⚙️ Process Management
- 🧠 Memory Management
- 📁 File Systems
- 🔌 I/O Systems
- 📦 Virtualization

---

## 🚀 Start Learning
Begin your journey through computer systems by exploring any of the topics above.
New content is added regularly. Stay tuned!