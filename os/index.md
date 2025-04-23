---
layout: notion
title: "Computer Architecture & Operating Systems"
permalink: /os/
---

<div class="page-block hero-section">
  <h1>Computer Architecture & Operating Systems</h1>
  <p class="lead-text">Exploring the fundamentals and advanced concepts of computer systems, from silicon to software.</p>
  <div class="stats">
    <div class="stat-item">
      <span class="stat-number">{{ site.categories.os | size }}</span>
      <span class="stat-label">Articles</span>
    </div>
    <div class="stat-item">
      <span class="stat-number">2</span>
      <span class="stat-label">Main Topics</span>
    </div>
  </div>
</div>

<div class="page-block featured-section">
  <h2>📝 Recent Notes</h2>
  {% for post in site.categories.os limit:5 %}
    <div class="note-item">
      <div class="note-meta">
        <span class="date-tag">{{ post.date | date: "%B %d, %Y" }}</span>
        {% if post.tags %}
          <div class="tags">
            {% for tag in post.tags %}
              <span class="tag">{{ tag }}</span>
            {% endfor %}
          </div>
        {% endif %}
      </div>
      <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
      <p class="excerpt">{{ post.excerpt | strip_html | truncatewords: 30 }}</p>
      <a href="{{ post.url }}" class="read-more">Read more →</a>
    </div>
  {% endfor %}
</div>

<div class="page-block topic-section">
  <h2>📚 Learning Paths</h2>
  
  <div class="topic-grid">
    <div class="topic-card">
      <h3>🔧 Computer Architecture</h3>
      <ul class="topic-list">
        <li>
          <span class="topic-icon">⚡</span>
          <span class="topic-text">Processor Design</span>
        </li>
        <li>
          <span class="topic-icon">📊</span>
          <span class="topic-text">Memory Hierarchy</span>
        </li>
        <li>
          <span class="topic-icon">💻</span>
          <span class="topic-text">Instruction Set Architecture (ISA)</span>
        </li>
        <li>
          <span class="topic-icon">🔄</span>
          <span class="topic-text">Pipelining</span>
        </li>
        <li>
          <span class="topic-icon">💾</span>
          <span class="topic-text">Cache Organization</span>
        </li>
      </ul>
    </div>

    <div class="topic-card">
      <h3>🖥️ Operating Systems</h3>
      <ul class="topic-list">
        <li>
          <span class="topic-icon">⚙️</span>
          <span class="topic-text">Process Management</span>
        </li>
        <li>
          <span class="topic-icon">🧠</span>
          <span class="topic-text">Memory Management</span>
        </li>
        <li>
          <span class="topic-icon">📁</span>
          <span class="topic-text">File Systems</span>
        </li>
        <li>
          <span class="topic-icon">🔌</span>
          <span class="topic-text">I/O Systems</span>
        </li>
        <li>
          <span class="topic-icon">📦</span>
          <span class="topic-text">Virtualization</span>
        </li>
      </ul>
    </div>
  </div>
</div>

<div class="page-block cta-section">
  <h2>🚀 Start Learning</h2>
  <p>Begin your journey through computer systems by exploring any of the topics above.</p>
  <p>New content is added regularly. Stay tuned!</p>
</div>