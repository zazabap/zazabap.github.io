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

I am a Ph.D. candidate at the [Institute of Science Tokyo](https://www.isct.ac.jp/en) (formerly Tokyo Institute of Technology), where I am supervised by [Prof. Konstantinos Slavakis](http://www.slavakislab.ict.e.titech.ac.jp/). My research focuses on the intersection of quantum computing and machine learning.

I obtained my B.S. in Physics from the [University of California, San Diego](http://ucsd.edu) and my M.S. in Experimental Particle Physics from [KEK](https://atlas.kek.jp/main/news/index.html).

## Research

**Scientific computing.** [LogosQ](https://github.com/zazabap/LogosQ) is a quantum computing library written in Rust, focused on efficient circuit simulation and optimization. Tutorials and documentation are at [logosqbook.vercel.app](https://logosqbook.vercel.app/). [ManifoldsGPU.jl](https://github.com/JuliaManifolds/ManifoldsGPU.jl) brings GPU and CUDA acceleration to the [JuliaManifolds](https://github.com/JuliaManifolds) ecosystem, so that Riemannian optimization on products of unitary and Stiefel manifolds runs on the accelerator instead of falling back to the CPU. It grew out of the training needs of [pdft](/projects/1_project/). Both projects are open source, and contributions are welcome.

**Quantum machine learning.** I work on learnable Fourier bases and parameterized tensor networks. Viewed as a circuit of one- and two-qubit gates, the quantum Fourier transform becomes a family of bases that can be trained on unitary manifolds while keeping exact invertibility and near-linear transform cost. Trained this way, [pdft](/projects/1_project/) compresses images better than the fixed DFT or DCT ([arXiv:2608.00053](https://arxiv.org/abs/2608.00053)), and with the Hadamards held fixed the same circuits inpaint images with minimum coherence guaranteed by construction ([arXiv:2609.17298](https://arxiv.org/abs/2609.17298)). Earlier work proposed a [tensor-based binary graph encoding](https://arxiv.org/abs/2501.14185) for variational quantum classifiers.

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
