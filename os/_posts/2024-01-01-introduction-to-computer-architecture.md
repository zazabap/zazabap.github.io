---
layout: notion
title: 'Introduction to Computer Architecture'
date: 2024-01-01
categories: [os, computer-architecture]
tags: [fundamentals, cpu, memory]
---

# Introduction to Computer Architecture

Computer architecture is the design and organization of computer systems. This post covers the fundamental concepts and principles that govern how computers work at their most basic level.

## Key Components

1. **Processor (CPU)**
   - Control Unit
   - Arithmetic Logic Unit (ALU)
   - Registers
   
   ### Performance Metrics
   CPU Time can be expressed as:
   $$ T_{CPU} = N \times CPI \times T_c $$
   where:
   - $$N$$ = Number of Instructions
   - $$CPI$$ = Cycles Per Instruction
   - $$T_c$$ = Clock Cycle Time

   Amdahl's Law for speedup:
   $$ S_{overall} = \frac{1}{(1-p) + \frac{p}{s}} $$
   where:
   - $$p$$ = fraction of parallelizable code
   - $$s$$ = speedup of parallel portion

2. **Memory System**
   - Cache
   - Main Memory
   - Virtual Memory

   ### Memory Access Time
   Average Memory Access Time (AMAT):
   $$ AMAT = H_t + (1-h) \times M_p $$
   where:
   - $$H_t$$ = Hit Time
   - $$h$$ = Hit Rate
   - $$M_p$$ = Miss Penalty

3. **I/O System**
   - Buses
   - Controllers
   - Peripherals

   ### I/O Performance
   DMA Transfer Time:
   $$ T_{DMA} = T_{setup} + \frac{n}{B} $$
   where:
   - $$n$$ = number of bytes
   - $$B$$ = bus bandwidth

## Further Reading

- Computer Organization and Design (Patterson & Hennessy)
- Modern Processor Design (Shen & Lipasti)