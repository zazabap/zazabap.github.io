---
title: ManifoldsGPU.jl
description: GPU and CUDA acceleration for Riemannian optimization in the JuliaManifolds ecosystem
importance: 3
---

## Overview

[ManifoldsGPU.jl](https://github.com/JuliaManifolds/ManifoldsGPU.jl) brings **GPU and CUDA acceleration** to the [JuliaManifolds](https://github.com/JuliaManifolds) ecosystem, so that Riemannian optimization on matrix manifolds runs on the accelerator instead of falling back to the CPU.

The package grew out of a concrete need. Training parametric bases in [pdft](/projects/1_project/) and its Julia predecessor requires thousands of retraction and exponential-map evaluations on products of unitary and Stiefel manifolds. Existing manifold libraries perform these element-by-element, which on a GPU means one kernel launch per manifold point — launch overhead dominates and the accelerator sits idle.

---

## Batched Manifold Operations

The core idea is to treat a power manifold as a **batch** rather than a loop. Manifold operations and retractions are rewritten over stacked tensor arrays so that a single kernel covers every point in the power manifold at once, minimizing launch overhead at scale.

Reported speedups over the CPU baseline:

| Operation                                        | Speedup on CUDA |
| ------------------------------------------------ | --------------- |
| `exp!` on `PowerManifold(Stiefel(32, 16), 2048)` | ~20×            |
| `PolarRetraction` with batched SVD               | ~15×            |

The repository ships benchmarking scripts so these numbers can be reproduced on other hardware.

---

## Ecosystem Position

| Package                                                        | Role                                         |
| -------------------------------------------------------------- | -------------------------------------------- |
| [Manifolds.jl](https://github.com/JuliaManifolds/Manifolds.jl) | Riemannian geometry abstractions             |
| [Manopt.jl](https://github.com/JuliaManifolds/Manopt.jl)       | Riemannian optimization solvers              |
| [CUDA.jl](https://github.com/JuliaGPU/CUDA.jl)                 | GPU kernels and array backend                |
| **ManifoldsGPU.jl**                                            | GPU-accelerated implementations of the above |

---

## Status

The package is in early development and its API is not yet stable. It is developed in the open under the JuliaManifolds organization, with continuous integration, [Aqua.jl](https://github.com/JuliaTesting/Aqua.jl) quality assurance, and [Runic](https://github.com/fredrikekre/Runic.jl) formatting enforced in CI.

---

## Links

- **Source code:** [github.com/JuliaManifolds/ManifoldsGPU.jl](https://github.com/JuliaManifolds/ManifoldsGPU.jl)
- **Downstream use:** [pdft](https://github.com/zazabap/pdft) and its Julia predecessor [ParametricDFT.jl](https://github.com/nzy1997/ParametricDFT.jl)
