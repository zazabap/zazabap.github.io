---
layout: page
title: ParametricDFT.jl
description: Learning parametric quantum Fourier transforms via Riemannian optimization on manifolds
img: assets/img/projects/comparison_3x3.png
importance: 1
category: work
related_publications: true
---

## Overview

[ParametricDFT.jl](https://github.com/nzy1997/ParametricDFT.jl) is a Julia package for learning **parametric quantum Fourier transforms** using manifold optimization. It implements a variational approach to approximate the Discrete Fourier Transform (DFT) using parameterized quantum circuits, with applications to **image compression** and **signal processing**.

The core idea: optimize quantum circuit parameters on Riemannian manifolds (products of U(2) and U(1) groups) to learn frequency-domain representations that are more compressible than the standard DFT.

---

## Circuit Architectures

The package supports three parametric circuit designs:

<div class="row justify-content-sm-center">
    <div class="col-sm-10 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/projects/comparison_3x3.png" title="Standard vs Entangled QFT" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Comparison of Standard 2D QFT and Entangled QFT architectures for a 3×3 system. The entangled variant adds learnable cross-dimensional gates (red) that couple row and column qubits.
</div>

- **Standard QFT Basis** — Full quantum Fourier transform circuit with Hadamard and controlled-phase gates
- **Entangled QFT Basis** — QFT with additional learnable 2-qubit entanglement gates between row and column qubits
- **TEBD Basis** — Time-Evolving Block Decimation with ring topology for 2D separable transforms

---

## Training & Optimization

The package provides Riemannian optimization on the unitary group, with support for multiple solvers:

- Riemannian Gradient Descent
- Riemannian Conjugate Gradient
- Riemannian L-BFGS
- Riemannian Adam

All optimizers support both **CPU and GPU** execution via a custom CUDA-compatible backend.

---

## GPU Acceleration

A key contribution is GPU-accelerated Riemannian optimization that bypasses limitations of existing manifold optimization libraries. Batched operations on (2,2,n) tensor arrays minimize kernel launches for significant speedups at scale.

---

## Key Dependencies

| Package                                                        | Role                             |
| -------------------------------------------------------------- | -------------------------------- |
| [Yao.jl](https://github.com/QuantumBFS/Yao.jl)                 | Quantum circuit construction     |
| [OMEinsum.jl](https://github.com/under-Peter/OMEinsum.jl)      | Tensor network contractions      |
| [Manifolds.jl](https://github.com/JuliaManifolds/Manifolds.jl) | Riemannian geometry abstractions |
| [Manopt.jl](https://github.com/JuliaManifolds/Manopt.jl)       | Riemannian optimization solvers  |
| [Zygote.jl](https://github.com/FluxML/Zygote.jl)               | Automatic differentiation        |
| [CUDA.jl](https://github.com/JuliaGPU/CUDA.jl)                 | GPU acceleration                 |

---

## Links

- **Source code:** [github.com/nzy1997/ParametricDFT.jl](https://github.com/nzy1997/ParametricDFT.jl)
- **Documentation:** [ParametricDFT.jl docs](https://nzy1997.github.io/ParametricDFT.jl/dev/)
- **Theory notes:** Available in the repository under `note/`
