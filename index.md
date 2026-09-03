---
title: Shiwen An
permalink: /
---

<table class="plain contact">
<tr>
<td>
Ph.D. candidate in Information and Communication Engineering<br>
Institute of Science Tokyo<br>
4259 Nagatsuta-cho, Midori-ku<br>
Yokohama, Kanagawa 226-8503, Japan<br>
<br>
Email: an.s.aa@m.titech.ac.jp<br>
<br>
<a href="https://github.com/zazabap">GitHub</a> &middot;
<a href="https://scholar.google.com/citations?user=RVarZsQAAAAJ">Google Scholar</a> &middot;
<a href="/assets/pdf/resume.pdf">CV (PDF)</a>
</td>
<td><img src="/assets/img/prof_pic.jpg" alt="Shiwen An" width="180"></td>
</tr>
</table>

> *Ludwig Boltzmann, who spent much of his life studying statistical mechanics, died in 1906, by his own hand. Paul Ehrenfest, carrying on the work, died similarly in 1933. Now it is our turn to study statistical mechanics. Perhaps it will be wise to approach the subject cautiously.*
>
> &mdash; David L. Goodstein, *States of Matter*

## Biography

I am a Ph.D. candidate at the [Institute of Science Tokyo](https://www.isct.ac.jp/en) (formerly Tokyo Institute of Technology), where I am supervised by [Prof. Konstantinos Slavakis](http://www.slavakislab.ict.e.titech.ac.jp/) and advised by [Prof. Jun Sakuma](https://www.riken.jp/en/research/labs/aip/ai_soc/ai_sec_privacy/index.html). My research focuses on the intersection of quantum computing, machine learning, and AI security.

I obtained my B.S. in Physics from the [University of California, San Diego](http://ucsd.edu) and my M.S. in Experimental Particle Physics from [KEK](https://atlas.kek.jp/main/news/index.html).

## Research

**Quantum software development.** `LogosQ` is a quantum computing library written in Rust. The library focuses on efficient quantum circuit simulation and optimization. For more information, tutorials, and documentation, please visit [logosqbook.vercel.app](https://logosqbook.vercel.app/). If you are interested in optimization and computation in Rust, feel free to check it out!

**Quantum machine learning.** I have recently published research on novel feature extraction algorithms for graphs that can be effectively applied with Variational Quantum Circuits (VQCs) in resource-limited settings. This work bridges classical graph theory with quantum machine learning techniques.

**AI security.** My ongoing work includes security analysis and attacks on various fine-tuned and pretrained AI models, including Llama2-7B, Llama3.1-8B-Instruct, Qwen, DeepSeek, and GPT family models. This research aims to understand and improve the robustness of large language models against adversarial attacks.

## News

<table class="plain">
{% assign news = site.news | sort: "date" | reverse %}
{% for item in news limit: 6 %}
<tr>
<td nowrap><i>{{ item.date | date: "%b %Y" }}</i></td>
<td>{{ item.title }}</td>
</tr>
{% endfor %}
</table>

Details of each item are on the [news page](/news/).
