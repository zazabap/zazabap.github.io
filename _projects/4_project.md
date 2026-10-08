---
title: Notes on Quantum Error Correction
description: A companion to Roffe's introductory guide in which the amplitudes, subspaces and syndrome circuits respond as you apply errors
importance: 4
math: true
---

## Overview

[Notes on quantum error correction](/qec-note/) follow Joschka Roffe's
[*Quantum error correction: an introductory guide*](https://arxiv.org/abs/1907.11157)
(Contemporary Physics, 2019) one section at a time, then continue past it
to CSS and quantum LDPC codes. The codes of the first parts are small enough
to draw, so each page draws them: the amplitudes of the encoded state as bars
grouped by subspace, the stabilizer meters reading $$+1$$ or $$-1$$, and the
syndrome-extraction circuit stepped one gate at a time. Clicking a qubit
applies an error to it and every picture on the page responds. Each part
ends with a problem set whose solutions stay hidden until opened.

## The four parts

1. [Quantum redundancy and stabilizer measurement](/qec-note/01-quantum-redundancy.html)
   (Roffe §3): the two- and three-qubit codes, codespace and error spaces,
   the ancilla circuit, error suppression by detection alone, and why the
   three-qubit code has distance 1.
2. [The stabilizer formalism](/qec-note/02-stabilizer-formalism.html)
   (Roffe §4): stabilizer measurement, the stabilizer group, logical
   operators and encoding by projection, with the $$[[4,2,2]]$$ detection
   code and the Shor $$[[9,1,3]]$$ code as worked examples.
3. [CSS codes](/qec-note/03-css-codes.html): codes built from two classical
   codes, separate decoding of $$X$$ and $$Z$$ errors, and the Steane
   $$[[7,1,3]]$$ code.
4. [Quantum LDPC codes](/qec-note/04-qldpc-codes.html): sparse checks, the
   hypergraph product, and belief-propagation decoding with its failure modes.

Parts 3 and 4 go beyond the guide and end with references.

## How it is built

- Plain HTML, one stylesheet, a few small JavaScript modules; no framework
  and no build step. The notes live in their own repository and are included
  here as a git submodule.
- Two engines: a real-amplitude state vector for the pictures (at most a few
  qubits), and the binary symplectic representation of Pauli operators for
  syndromes, logical actions and distances, which keeps working for large codes.
- The algebra is tested against the paper's tables and equations with `node --test`.

## Links

- **Read the notes:** [zazabap.github.io/qec-note](/qec-note/)
- **Source:** [github.com/zazabap/qec-note](https://github.com/zazabap/qec-note)
- **The paper:** [arXiv:1907.11157](https://arxiv.org/abs/1907.11157)
