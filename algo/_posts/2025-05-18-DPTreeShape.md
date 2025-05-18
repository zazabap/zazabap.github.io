---
layout: notion-dp
title: 'Tree Shape Dynamic Programming'
date: 2025-05-18
categories: [dp]
tags: [tree, recursion, subtree]
---

# Tree Shape Dynamic Programming

## Tree DP Overview

Tree Shape Dynamic Programming (Tree DP) is a technique used to solve problems defined on trees, where the solution for each node depends on the solutions of its children. Unlike linear DP, Tree DP leverages the hierarchical structure of trees and often uses recursion or depth-first search (DFS).

### Key Characteristics

- **Hierarchical Structure:** The problem is defined on a tree, not a linear sequence.
- **Subtree Solutions:** The DP state for a node is computed using the DP states of its children.
- **Bottom-Up Approach:** Typically, solutions are computed from the leaves up to the root.

### Common Applications

- **Counting subtrees or paths:** E.g., number of nodes in each subtree, longest path, etc.
- **Maximizing/minimizing values:** E.g., maximum sum of non-adjacent nodes, minimum cost to cover the tree, etc.
- **Dynamic programming on rooted trees:** E.g., DP for each node considering its subtree.

### Example Problem: Maximum Sum of Non-Adjacent Nodes

Given a tree where each node has a value, find the maximum sum of values such that no two adjacent nodes are both chosen.

#### State Definition

Let `dp[u][0]` be the maximum sum for subtree rooted at `u` when `u` is **not** chosen.  
Let `dp[u][1]` be the maximum sum when `u` **is** chosen.

#### Recurrence Relation

- If `u` is not chosen:  
  `dp[u][0] = sum(max(dp[v][0], dp[v][1]) for v in children of u)`
- If `u` is chosen:  
  `dp[u][1] = value[u] + sum(dp[v][0] for v in children of u)`

#### Example Code (Python)

```python
def tree_dp(u, parent, tree, value, dp):
    dp[u][0] = 0
    dp[u][1] = value[u]
    for v in tree[u]:
        if v == parent:
            continue
        tree_dp(v, u, tree, value, dp)
        dp[u][0] += max(dp[v][0], dp[v][1])
        dp[u][1] += dp[v][0]
```

### Tips for Tree DP

- Use DFS to traverse the tree and compute DP values.
- Carefully define the DP state to capture the necessary information for each node.
- Consider rerooting techniques for problems that require DP values for all possible roots.

---

Tree DP is a powerful tool for solving hierarchical problems in competitive programming. Understanding how to propagate information up and down the tree is key to mastering this technique!

