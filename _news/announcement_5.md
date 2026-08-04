---
layout: post
title: '"Fast Trainable Multilinear Bases for Image Compression" got published on arXiv.'
date: 2026-08-04 09:00:00+0900
inline: false
related_posts: false
---

**"Fast Trainable Multilinear Bases for Image Compression"** (with Zhongyi Ni, Huanhai Zhou, and Jin-Guo Liu) is now on arXiv: [arXiv:2608.00053](https://arxiv.org/abs/2608.00053).

We generalize the DFT, the DCT, and their block-wise variants to isometric multilinear bases that keep near-linear transform cost, exact invertibility, and a parameter count polylogarithmic in the image size. The basis is parameterized as an isometric tensor network inspired by quantum many-body theory and trained per dataset with Riemannian optimization on the manifold of unitary matrices. On Quick Draw line drawings, the trained basis stores images in roughly 20% fewer bytes than JPEG's 8×8 block cosine transform at the same reconstruction quality.

The implementation ships as the JAX-based Python library [zazabap/pdft](https://github.com/zazabap/pdft), with the benchmark suite and reproduction scripts at [zazabap/pdft-benchmarks](https://github.com/zazabap/pdft-benchmarks).
