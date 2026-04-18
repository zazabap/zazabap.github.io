---
layout: page
title: Problem Reductions
description: A Rust library and CLI (pred) for NP-hard problem definitions, reductions, and routing across solvers
img: assets/img/projects/problem_reductions.png
importance: 2
category: work
related_publications: true
---

## Overview

[problem-reductions](https://github.com/CodingThrust/problem-reductions) is a Rust infrastructure that catalogs **100+ computationally hard problems** and **200+ reduction rules** between them, exposed through a CLI tool called `pred`. Built with agentic coding workflows, it answers two practical questions:

1. Given an NP-hard problem **A**, what is the most efficient target problem **B** to reduce it to so we can reuse an existing solver?
2. How broadly can a solver designed for problem **B** be reused across the rest of the problem landscape?

The reduction graph is transitive: registering a new solver for a single node immediately makes it available to every problem connected to it.

<div class="row justify-content-sm-center">
    <div class="col-sm-10 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/projects/problem_reductions.png" title="Reduction graph across 100+ NP-hard problems" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Figure 1 from the paper — a portion of the reduction graph. Nodes are problem types and directed edges are reductions. Registering a solver for any node propagates along outgoing paths to reachable problems.
</div>

---

## The `pred` CLI

The command-line tool provides a unified interface to:

- **Create** instances of a problem type
- **Show** problem instances, reductions, and solver paths
- **Solve** a problem by automatically searching the reduction graph for the shortest viable path to a registered solver

---

## Reduction Graph

At the core is a registry that stores problems as nodes and reductions as directed edges. A path-search routine finds the sequence of reductions from any source problem to a problem with a registered solver, composing per-edge forward/backward transformations to recover the original solution.

Quality-detection tools flag isolated or unreachable problems so coverage can be improved systematically.

---

## Scale and Engineering

- **Over 170k lines of Rust**, with Python utilities for auxiliary tooling
- Multiple problem types and solvers, including brute-force baselines
- Harness-engineered development loop: constraint design, verification systems, and feedback pipelines drive agentic contributions

---

## Inspirations

| Package                                                                      | Ecosystem |
| ---------------------------------------------------------------------------- | --------- |
| [ProblemReductions.jl](https://github.com/GiggleLiu/ProblemReductions.jl)    | Julia     |
| [UnitDiskMapping.jl](https://github.com/QuEraComputing/UnitDiskMapping.jl)   | Julia     |
| [qubogen](https://github.com/tamuhey/qubogen)                                | Python    |

---

## Links

- **Source code:** [github.com/CodingThrust/problem-reductions](https://github.com/CodingThrust/problem-reductions)
- **Paper:** [Problem Reductions at Scale: Agentic Integration of Computationally Hard Problems (arXiv:2604.11535)](https://arxiv.org/abs/2604.11535)
