---
layout: notion
title: "Computer Architecture & Operating Systems"
permalink: /os/
---

<div class="page-block">
  <h1>Computer Architecture & Operating Systems Notes</h1>
  <p>Welcome to my digital garden of Computer Architecture and Operating Systems knowledge.</p>
</div>

<div class="page-block">
  <h2>Recent Notes</h2>
  {% for post in site.categories.os limit:5 %}
    <div class="note-item">
      <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
      <p>{{ post.excerpt }}</p>
      <span class="date-tag">{{ post.date | date: "%B %d, %Y" }}</span>
    </div>
  {% endfor %}
</div>

<div class="page-block topic-section">
  <h2>Topics</h2>
  
  <h3>Computer Architecture</h3>
  <ul class="topic-list">
    <li>Processor Design</li>
    <li>Memory Hierarchy</li>
    <li>Instruction Set Architecture (ISA)</li>
    <li>Pipelining</li>
    <li>Cache Organization</li>
  </ul>

  <h3>Operating Systems</h3>
  <ul class="topic-list">
    <li>Process Management</li>
    <li>Memory Management</li>
    <li>File Systems</li>
    <li>I/O Systems</li>
    <li>Virtualization</li>
  </ul>
</div>