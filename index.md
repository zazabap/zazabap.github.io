---
title: Shiwen An
permalink: /
---

Ph.D. candidate in Information and Communication Engineering<br>
Institute of Science Tokyo<br>
4259 Nagatsuta-cho, Midori-ku<br>
Yokohama, Kanagawa 226-8503, Japan

> *Ludwig Boltzmann, who spent much of his life studying statistical mechanics, died in 1906, by his own hand. Paul Ehrenfest, carrying on the work, died similarly in 1933. Now it is our turn to study statistical mechanics. Perhaps it will be wise to approach the subject cautiously.*
>
> &mdash; David L. Goodstein, *States of Matter*

## Biography

I am a Ph.D. candidate at the [Institute of Science Tokyo](https://www.isct.ac.jp/en) (formerly Tokyo Institute of Technology), where I am supervised by [Prof. Konstantinos Slavakis](http://www.slavakislab.ict.e.titech.ac.jp/) and advised by [Prof. Jun Sakuma](https://www.riken.jp/en/research/labs/aip/ai_soc/ai_sec_privacy/index.html). My research focuses on the intersection of quantum computing, machine learning, and AI security.

I obtained my B.S. in Physics from the [University of California, San Diego](http://ucsd.edu) and my M.S. in Experimental Particle Physics from [KEK](https://atlas.kek.jp/main/news/index.html).

## Research

**Scientific computing.** [LogosQ](https://github.com/zazabap/LogosQ) is a quantum computing library written in Rust, focused on efficient circuit simulation and optimization. Tutorials and documentation are at [logosqbook.vercel.app](https://logosqbook.vercel.app/). [ManifoldsGPU.jl](https://github.com/JuliaManifolds/ManifoldsGPU.jl) brings GPU and CUDA acceleration to the [JuliaManifolds](https://github.com/JuliaManifolds) ecosystem, so that Riemannian optimization on products of unitary and Stiefel manifolds runs on the accelerator instead of falling back to the CPU. It grew out of the training needs of [pdft](/projects/1_project/). Both projects are open source, and contributions are welcome.

**Quantum machine learning.** I am currently exploring learnable Fourier bases and parameterized tensor networks. The starting point is the quantum Fourier transform: viewed as a tensor network of one- and two-qubit gates, it becomes a family of bases whose parameters can be trained on unitary manifolds while keeping exact invertibility, near-linear transform cost, and a parameter count polylogarithmic in the signal size. In [pdft](/projects/1_project/) ([arXiv:2608.00053](https://arxiv.org/abs/2608.00053)) such trained bases yield more compressible image representations than the fixed DFT or DCT. I am now studying which other classical transforms admit this kind of parameterization, and what structured tensor networks offer over generic variational circuits. Earlier work in this direction proposed a [tensor-based binary graph encoding](https://arxiv.org/abs/2501.14185) for variational quantum classifiers in resource-limited settings.

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
