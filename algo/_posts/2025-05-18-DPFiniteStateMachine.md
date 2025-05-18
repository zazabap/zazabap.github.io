---
layout: notion
title: 'Finite State Machine Dynamic Programming'
date: 2025-05-18
categories: [dp]
tags: [fsm, state, transitions]
---

# Finite State Machine Dynamic Programming

## FSM DP Overview

Finite State Machine Dynamic Programming (FSM DP) is a technique for solving problems where the solution depends on a sequence of states and transitions between them. This approach is especially useful for problems involving multiple stages, constraints, or "modes" that affect future decisions.

### Key Characteristics

- **Explicit States:** The DP state includes a "mode" or "state" variable representing the current status.
- **Transitions:** The solution involves moving between states according to problem-specific rules.
- **Multi-dimensional DP:** Often, the DP table has more than one dimension (e.g., position and state).

### Common Applications

- **Stock trading problems:** Tracking whether you hold a stock, can buy, or must sell.
- **String parsing:** Keeping track of matching parentheses, valid substrings, etc.
- **Game strategies:** Modeling turns, cooldowns, or special moves.

### Example Problem: Best Time to Buy and Sell Stock with Cooldown

Given an array of prices, find the maximum profit with as many transactions as you like, but after you sell, you must wait one day before buying again.

#### State Definition

Let `dp[i][state]` be the maximum profit on day `i` in a given `state`:
- `state = 0`: Not holding a stock, can buy.
- `state = 1`: Holding a stock.
- `state = 2`: In cooldown (just sold).

#### Recurrence Relation

```
dp[i][0] = max(dp[i-1][0], dp[i-1][2])           # Rest or come out of cooldown
dp[i][1] = max(dp[i-1][1], dp[i-1][0] - price)   # Hold or buy
dp[i][2] = dp[i-1][1] + price                    # Sell
```

#### Example Code (Python)

```python
def max_profit(prices):
    if not prices:
        return 0
    n = len(prices)
    dp = [[0]*3 for _ in range(n)]
    dp[0][0] = 0
    dp[0][1] = -prices[0]
    dp[0][2] = 0
    for i in range(1, n):
        dp[i][0] = max(dp[i-1][0], dp[i-1][2])
        dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i])
        dp[i][2] = dp[i-1][1] + prices[i]
    return max(dp[-1][0], dp[-1][2])
```

### Tips for FSM DP

- Clearly define all possible states and transitions.
- Use multi-dimensional arrays or dictionaries for DP tables.
- Draw a state diagram to visualize transitions.

---

FSM DP is a versatile tool for modeling and solving problems with multiple interacting states. Mastering it will help you tackle a wide range of sequence and constraint-based challenges!

