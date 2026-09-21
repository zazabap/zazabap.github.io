---
title: '"Riemannian Gauss–Newton Method for Open-System Projected Variational Quantum Dynamics" is accepted at IEEE QCE 2026 in Toronto, Canada.'
date: 2026-06-27 09:00:00+0900
---

**"Riemannian Gauss–Newton Method for Open-System Projected Variational Quantum Dynamics"** (with Konstantinos Slavakis) is accepted to the poster track of [IEEE Quantum Week 2026 (QCE 2026)](https://qce.quantum.ieee.org/2026/), held in Toronto, Canada, on 13–18 September 2026. The two-page proceedings paper is [available here](/assets/pdf/qce2026-riemannian-gauss-newton-pvqd.pdf).

Projected variational quantum dynamics (p-VQD) refits a fixed-depth circuit to each Trotter step by maximizing a pure-state fidelity. For an open system the target is a mixed reduced state, so that objective is undefined, and the obvious repair, fitting the reduced trace overlap, is provably capped below unity: its maximizer is the dominant eigenvector rather than the target. We purify the thermal bath with a thermofield ancilla so that the joint system–bath–ancilla state stays pure. The fidelity then applies exactly on the joint state, and tracing out the bath and the ancilla afterwards returns the physical reduced dynamics.

Each projection becomes a pure-state least-squares fit. A Riemannian Gauss–Newton inner loop with trust-region damping, whose normal matrix is the Fubini–Study metric, drives it to the ansatz ceiling in two or three iterations where first-order p-VQD stalls orders of magnitude short. On finite-temperature spin–boson and central-spin benchmarks, validated against an independent TDVP baseline, the ansatz sets the attainable fidelity and the optimizer sets the convergence rate. Where the ansatz is under-resourced, the second-order step attains the best tested fidelities.

The JAX reference implementation is at [zazabap/RiemannianPVQD](https://github.com/zazabap/RiemannianPVQD).
