---
layout: notion
title: 'Understanding Memory Hierarchy'
date: 2024-01-05
categories: [computer-architecture]
tags: [memory, cache, performance]
---

# Understanding Memory Hierarchy

## Overview
Memory hierarchy is a crucial concept in computer architecture that addresses the trade-off between memory speed and capacity.

## Memory Levels
1. Registers
2. Cache (L1, L2, L3)
3. Main Memory (RAM)
4. Secondary Storage

## Performance Metrics
### Hit Rate Calculation
$$ \text{Hit Rate} = \frac{\text{Cache Hits}}{\text{Total Memory Accesses}} $$

### Miss Penalty
$$ \text{Miss Penalty} = \text{Access Time}_{\text{lower level}} + \text{Transfer Time} $$