---
title: '"Quantum-Inspired Trainable and Parameter-Efficient Tensor Networks for Image Inpainting" got published on arXiv.'
date: 2026-09-15 09:00:00+0900
---

**"Quantum-Inspired Trainable and Parameter-Efficient Tensor Networks for Image Inpainting"** (with Konstantinos Slavakis) is now on arXiv: [arXiv:2609.17298](https://arxiv.org/abs/2609.17298). It has been submitted to ICASSP 2027.

This is the follow-up to [Fast Trainable Multilinear Bases for Image Compression](https://arxiv.org/abs/2608.00053): the same quantum Fourier transform circuits, trained this time for image inpainting rather than compression. Inpainting recovers an image from a subset of its pixels, and there the coherence of the transform with the pixel basis matters as much as its sparsity. The diagonal QFT relaxation keeps one fixed Hadamard per wire and frees only the controlled-phase gates, so its coherence is pinned at the minimum for every parameter value, by circuit topology alone. That removes the need for a coherence penalty and for Riemannian optimization: the phases are trained with plain Adam through an unrolled hard-thresholding recovery, and the transform stays exactly invertible with O(N<sup>2</sup> log N) cost.

On DIV2K at 10% observed pixels, the diagonal model with 288 trainable parameters outperforms the DFT by 2.0 dB and the best fixed transform by 1.6 dB in PSNR, and comes within 0.2 dB of a learned butterfly factorization that carries 64 times as many parameters.
