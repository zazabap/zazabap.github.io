---
layout: notion
title: 'Introduction to Computer Architecture'
date: 2024-01-01
categories: [computer-architecture]
tags: [fundamentals, cpu, memory]
---

# Introduction to Computer Architecture

## Overview
Computer architecture is the design and organization of computer systems. This post covers the fundamental concepts and principles that govern how computers work at their most basic level.

## Table of Contents
1. [Processor Architecture](#processor-architecture)
2. [Memory Systems](#memory-systems)
3. [I/O Systems](#io-systems)
4. [Performance Metrics](#performance-metrics)

## Processor Architecture
### Components
- **Control Unit**: Manages instruction execution
- **ALU**: Performs arithmetic and logical operations
- **Registers**: High-speed storage elements

### Performance Metrics
CPU execution time calculation:
$$ T_{CPU} = N \times CPI \times T_c $$
- $$N$$ = Number of Instructions
- $$CPI$$ = Cycles Per Instruction
- $$T_c$$ = Clock Cycle Time

### Parallel Processing
Amdahl's Law for speedup calculation:
$$ S_{overall} = \frac{1}{(1-p) + \frac{p}{s}} $$
- $$p$$ = Parallelizable code fraction
- $$s$$ = Parallel portion speedup

## Memory Systems
### Hierarchy
1. Cache Memory
2. Main Memory
3. Virtual Memory

### Access Time
Average Memory Access Time (AMAT):
$$ AMAT = H_t + (1-h) \times M_p $$
- $$H_t$$ = Hit Time
- $$h$$ = Hit Rate
- $$M_p$$ = Miss Penalty

## I/O Systems
### Components
- System Buses
- Controllers
- Peripheral Devices

### Performance
DMA Transfer Time calculation:
$$ T_{DMA} = T_{setup} + \frac{n}{B} $$
- $$n$$ = Bytes to transfer
- $$B$$ = Bus bandwidth

## Further Reading
1. Computer Organization and Design (Patterson & Hennessy)
2. Modern Processor Design (Shen & Lipasti)

## Related Topics
- [Memory Hierarchy](/os/memory-hierarchy)
- [Pipelining](/os/pipelining)
- [Cache Design](/os/cache-design)