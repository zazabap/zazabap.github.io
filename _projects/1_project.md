---
title: pdft
description: Trainable multilinear bases for image compression, learned by Riemannian optimization in JAX
importance: 1
---

## Overview

[pdft](https://github.com/zazabap/pdft) is a **JAX** library for learning **parametric quantum Fourier transforms** by manifold optimization. It replaces the fixed DFT or DCT with a basis that is trained per dataset, while keeping near-linear transform cost, exact invertibility, and a parameter count polylogarithmic in the image size.

The core idea: optimize circuit parameters on Riemannian manifolds (products of U(2) and U(1) groups) to learn frequency-domain representations that are more compressible than the standard DFT. On Quick Draw line drawings, the trained basis stores images in roughly 20% fewer bytes than JPEG's 8×8 block cosine transform at the same reconstruction quality.

pdft is the maintained implementation. It supersedes the original Julia package [ParametricDFT.jl](https://github.com/nzy1997/ParametricDFT.jl), which is slated for archival — see [Julia lineage](#julia-lineage) below.

---

## Circuit Architectures

<img src="/assets/img/projects/topology_gallery.png" alt="Four circuit variants and the DCT-IV">
<p class="caption">
    Figure 2 from the paper — four circuit variants and the DCT-IV acting on an input image <b>x</b>. A box spanning two legs is a general two-qubit tensor U<sup>(4)</sup> ∈ U(4), shared by (a)–(c), which differ only in wiring. A bond with two endpoint dots is a controlled phase M ∈ U(1)<sup>4</sup>, used in (d) both within and across the two wires.
</p>

The variants keep the same local gate and differ in how those tensors are wired:

- **QFT** — the parametric Cooley–Tukey template the rest of the family relaxes from
- **RichBasis** (a) — relaxes the QFT's phase gate to an all-to-all pattern
- **TEBD** (b) — nearest-neighbour ring topology
- **MERA** (c) — hierarchy of disentanglers and isometries
- **Entangled QFT** (d) — two QFT registers plus one controlled phase between each matched row–column pair; setting those phases to zero recovers the separable QFT
- **DCT-IV** (e) — real-orthogonal, exact, and used as an initialization
- **Blocked variants** of the above

---

## Training

Optimization runs on the manifold of unitary matrices, so every iterate stays exactly orthonormal and the learned transform remains invertible by construction. Two Riemannian optimizers are provided: gradient descent and Adam.

```python
import jax
import jax.numpy as jnp
import pdft

target = jax.random.normal(jax.random.PRNGKey(7), (4, 4)).astype(jnp.complex128)
basis = pdft.QFTBasis(m=2, n=2)

result = pdft.train_basis(
    basis,
    target=target,
    loss=pdft.L1Norm(),
    optimizer=pdft.RiemannianGD(lr=0.01),
    steps=50,
    seed=0,
)
```

Because the whole stack is JAX, training is JIT-compiled and runs on CPU, GPU, or TPU without a separate accelerator backend.

Beyond training, the package covers JSON and compression I/O, visualization, and runnable demos under `examples/` for basis training, optimizer benchmarking, and MERA.

---

## Julia Lineage

pdft began as a port of [ParametricDFT.jl](https://github.com/nzy1997/ParametricDFT.jl) and is a feature-complete one: parity against the Julia reference is verified by committed golden files covering training routines, I/O, and visualization. With the port complete, the Julia package is being retired in favor of pdft.

One piece of that work outlived the port. GPU-accelerated Riemannian optimization, originally written to bypass limitations in existing Julia manifold libraries, was upstreamed into [ManifoldsGPU.jl](/projects/3_project/) and now serves the JuliaManifolds ecosystem independently of this project.

---

## Key Dependencies

| Package                               | Role                                       |
| ------------------------------------- | ------------------------------------------ |
| [JAX](https://github.com/jax-ml/jax)  | Autodiff, JIT compilation, accelerators    |
| [NumPy](https://numpy.org/)           | Array manipulation and I/O                 |
| [Matplotlib](https://matplotlib.org/) | Visualization of bases and reconstructions |

---

## Links

- **Source code:** [github.com/zazabap/pdft](https://github.com/zazabap/pdft)
- **Benchmarks:** [github.com/zazabap/pdft-benchmarks](https://github.com/zazabap/pdft-benchmarks)
- **Paper:** [Fast Trainable Multilinear Bases for Image Compression (arXiv:2608.00053)](https://arxiv.org/abs/2608.00053)
- **Julia original:** [github.com/nzy1997/ParametricDFT.jl](https://github.com/nzy1997/ParametricDFT.jl) (being archived)
