---
layout: notion
title: "Competitive Programming"
permalink: /algo/
---

# Competitive Programming

Sharpen your problem-solving skills and master algorithms with curated notes, tutorials, and challenges.

## 📝 Recent Notes

{% assign algo_posts = site.posts | where_exp: "post", "post.categories contains 'algo'" | sort: 'date' | reverse %}
<ul>
  {% for post in algo_posts limit:5 %}
    <li>
      <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      <span style="color: #888;">({{ post.date | date: "%Y-%m-%d" }})</span>
    </li>
  {% endfor %}
</ul>

## 📚 Main Topics

### 📐 Algorithms
<div class="topic-table" markdown="1">

| Topic | Description |
|:------|:------------|
| 🔢 Sorting & Searching | Classic and advanced sorting/searching techniques |
| 🌲 Data Structures | Arrays, Trees, Graphs, Heaps, and more |
| 📊 Dynamic Programming | Optimization and subproblem strategies |
| 🧩 Greedy Algorithms | Making optimal local choices |
| 🔗 Graph Algorithms | BFS, DFS, shortest paths, and flows |

</div>

### 🏆 Problem Solving
<div class="topic-table" markdown="1">

| Topic | Description |
|:------|:------------|
| 💡 Problem Patterns | Common approaches and templates |
| 🏅 Contest Strategies | Tips for ACM/ICPC, Codeforces, LeetCode, etc. |
| 🛠️ Practice Problems | Curated problems and solutions |
| 📝 Editorials | Step-by-step explanations |

</div>

## 🚀 Start Practicing

Begin your journey by exploring the topics above or checking out the latest notes and problems.  
New content is added regularly—happy coding!