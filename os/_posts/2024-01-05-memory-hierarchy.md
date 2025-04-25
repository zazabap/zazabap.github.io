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


### Cache Implementation Example
```cpp
// Simple direct-mapped cache implementation
struct CacheEntry {
    bool valid;
    uint32_t tag;
    uint8_t data[64];  // 64-byte cache line
};

class Cache {
private:
    CacheEntry* entries;
    int size;
    
public:
    Cache(int cacheSize) {
        size = cacheSize / sizeof(CacheEntry);
        entries = new CacheEntry[size];
        
        // Initialize cache entries
        for (int i = 0; i < size; i++) {
            entries[i].valid = false;
            entries[i].tag = 0;
        }
    }
    
    bool read(uint32_t address, uint8_t* data) {
        uint32_t index = (address / 64) % size;
        uint32_t tag = address / (64 * size);
        
        if (entries[index].valid && entries[index].tag == tag) {
            // Cache hit
            memcpy(data, entries[index].data, 64);
            return true;
        }
        
        // Cache miss
        return false;
    }
};
```

### Memory Access Pattern Analysis
```python
def analyze_memory_access(addresses):
    cache_hits = 0
    cache_misses = 0
    cache = {}  # Simple cache simulation
    
    for addr in addresses:
        cache_line = addr // 64  # Assuming 64-byte cache lines
        if cache_line in cache:
            cache_hits += 1
        else:
            cache_misses += 1
            cache[cache_line] = True
            
            # Evict if cache is full (simplified)
            if len(cache) > 1024:  # Assuming 1024 cache lines
                cache.pop(next(iter(cache)))
    
    hit_rate = cache_hits / (cache_hits + cache_misses)
    return hit_rate
```