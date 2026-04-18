---
layout: about
title: about
permalink: /
subtitle: "Ludwig Boltzman, who spent much of his life studying statistical mechanics, died in 1906, by his own hand. Paul Ehrenfest, carrying on the work, died similarly in 1933. Now it is our turn to study statistical mechanics. Perhaps it will be wise to approach the subject cautiously."

profile:
  align: right
  image: prof_pic.png
  image_circular: true # crops the image to make it circular
  more_info: >
    <p>4259 Nagatsuta-cho, Midori-ku, Yokohama, Kanagawa 226-8503 Japan</p>

selected_papers: true # includes a list of papers marked as "selected={true}"
social: false # includes social icons at the bottom of the page

announcements:
  enabled: true # includes a list of news items
  scrollable: true # adds a vertical scroll bar if there are more than 3 news items
  limit: 5 # leave blank to include all the news in the `_news` folder

latest_posts:
  enabled: false
  scrollable: true # adds a vertical scroll bar if there are more than 3 new posts items
  limit: 3 # leave blank to include all the blog posts
---

## Biography

I am a Ph.D. candidate at [Institute of Science Tokyo](https://www.isct.ac.jp/en) (formerly Tokyo Institute of Technology), where I am supervised by [Prof. Konstantinos Slavakis](http://www.slavakislab.ict.e.titech.ac.jp/) and advised by [Prof. Jun Sakuma](https://www.riken.jp/en/research/labs/aip/ai_soc/ai_sec_privacy/index.html). My research focuses on the intersection of quantum computing, machine learning, and AI security.

I obtained my B.S. in Physics from the [University of California, San Diego](http://ucsd.edu) and M.S. in Experimental Particle Physics from [KEK](https://atlas.kek.jp/main/news/index.html)

### Quantum Software Development

`LogosQ` is a quantum computing library written in Rust. The library focuses on efficient quantum circuit simulation and optimization. For more information, tutorials, and documentation, please visit [https://logosqbook.vercel.app/](https://logosqbook.vercel.app/). If you are interested in optimization and computation in Rust, feel free to check it out!

### Quantum Machine Learning

I have recently published research on novel feature extraction algorithms for graphs that can be effectively applied with Variational Quantum Circuits (VQCs) in resource-limited settings. This work bridges classical graph theory with quantum machine learning techniques.

### AI Security

My ongoing work includes security analysis and attacks on various fine-tuned and pretrained AI models, including Llama2-7B, Llama3.1-8B-Instruct, Qwen, DeepSeek, and GPT family models. This research aims to understand and improve the robustness of large language models against adversarial attacks.

### Problem Reductions at Scale

Together with Xi-Wei Pan and Prof. Jin-Guo Liu, I co-authored **"Problem Reductions at Scale: Agentic Integration of Computationally Hard Problems"** ([arXiv:2604.11535](https://arxiv.org/abs/2604.11535)). The companion Rust library [problem-reductions](https://github.com/CodingThrust/problem-reductions) provides a `pred` CLI and a reduction graph over 100+ NP-hard problems and 200+ reduction rules, so that registering a solver for one problem unlocks it across the whole connected landscape.
