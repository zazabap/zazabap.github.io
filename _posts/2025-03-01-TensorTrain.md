---
title: 'Tensor Train Decomposition and Training'
date: 2025-03-01
permalink: /posts/2025/02/TensorTrain/
tags:
  - Tensor
  - Algorithm
  - Machine Learning 
  - python
---


High-dimensional data (tensors) appear in many fields such as scientific computing, quantum physics, and machine learning. However, storing and operating on these tensors is challenging due to the exponential growth of parameters with the number of dimensions (the so-called “curse of dimensionality”). **Tensor Train (TT) decomposition** is one way to represent high-dimensional tensors in a compact format by expressing them as a sequence of smaller 3D tensors (often called **TT-cores**).

## 1. The Tensor Train Representation

Given an $N$-dimensional tensor  
$$
\mathcal{X} \in \mathbb{R}^{d_1 \times d_2 \times \cdots \times d_N},
$$  
the TT format expresses each element as a product of matrices (slices of the TT-cores):

$$
\mathcal{X}(i_1, i_2, \dots, i_N) = G_1(1, i_1, r_1)\, G_2(r_1, i_2, r_2) \cdots G_N(r_{N-1}, i_N, 1),
$$

where:
- Each **TT-core** $G_k$ is a three-dimensional tensor of size $r_{k-1} \times d_k \times r_k$.
- The boundary conditions are given by $r_0 = 1$ and $r_N = 1$.
- The numbers $r_k$ (for $k = 1, \dots, N-1$) are the **TT-ranks** and they govern the trade-off between accuracy and compression.

This representation means that instead of storing $d_1 \cdot d_2 \cdots d_N$ entries, you only need to store  
$$
\sum_{k=1}^N (r_{k-1} \cdot d_k \cdot r_k)
$$  
numbers, which is typically much smaller when the TT-ranks are low.

## 2. TT Decomposition via Sequential SVD

One common algorithm to compute the TT decomposition is to use a sequence of **Singular Value Decompositions (SVDs)**. The main idea is to “peel off” one dimension at a time while maintaining a low-rank approximation. Let’s break down the procedure step by step.

For the first step, reshape the tensor $\mathcal{X}$ into a matrix. For the first mode, we reshape $\mathcal{X}$ to have dimensions:
$$
X_{(1)} \in \mathbb{R}^{d_1 \times (d_2 \cdot d_3 \cdots d_N)}.
$$

Perform an SVD on the reshaped matrix:
$$
X_{(1)} = U_1\, S_1\, V_1^T.
$$  
Here, $U_1$ is $d_1 \times r_1$ (after truncation), $S_1$ is $r_1 \times r_1$, and $V_1^T$ is $r_1 \times (d_2 \cdot d_3 \cdots d_N)$. The number $r_1$ is the rank (or a chosen truncated rank) for this step.

The first TT-core is obtained by reshaping $U_1$ (or equivalently $U_1\, S_1$) into a 3D tensor with dimensions:
$$
G_1 \in \mathbb{R}^{1 \times d_1 \times r_1},
$$  
since the left boundary rank is 1.
Multiply $S_1$ and $V_1^T$ to form an intermediate tensor:
$$
T_1 = S_1\, V_1^T.
$$  
Reshape $T_1$ into a tensor with dimensions:
$$
T_1 \in \mathbb{R}^{r_1 \times d_2 \times (d_3 \cdots d_N)}.
$$  
Then, merge the first two dimensions (i.e., $r_1$ and $d_2$) to form a matrix suitable for the next SVD:
$$
X_{(2)} \in \mathbb{R}^{(r_1 \cdot d_2) \times (d_3 \cdots d_N)}.
$$

Perform an SVD on $X_{(2)}$:
$$
X_{(2)} = U_2\, S_2\, V_2^T.
$$  
Now, $U_2$ is reshaped into the second TT-core:
$$
G_2 \in \mathbb{R}^{r_1 \times d_2 \times r_2},
$$  
where $r_2$ is determined by the rank of $U_2$ (or the chosen truncation). Continue this procedure until you have processed all modes. The last step will yield a final TT-core:
$$
G_N \in \mathbb{R}^{r_{N-1} \times d_N \times 1}.
$$

### **Key Equations Recap**

- **Full TT Representation**:
  
  $$
  \mathcal{X}(i_1, \dots, i_N) = \sum_{r_1, \dots, r_{N-1}} G_1(1, i_1, r_1)\, G_2(r_1, i_2, r_2) \cdots G_N(r_{N-1}, i_N, 1).
  $$
- **SVD at Step $k$**:
  
  $$
  X_{(k)} = U_k\, S_k\, V_k^T,
  $$
  
  where $X_{(k)}$ is the reshaped tensor for mode $k$.
- **TT-core formation**:
  
  $$
  G_k = \text{reshape}(U_k \text{ (or } U_k\,S_k\text{)}) \quad \text{with dimensions } (r_{k-1} \times d_k \times r_k).
  $$

---

## 3. Detailed Code Example in Python

Below is an annotated Python implementation of the TT decomposition using NumPy and SciPy. Comments in the code explain each step of the process.

```python
import numpy as np
from scipy.linalg import svd

def tensor_train_decomposition(X, max_rank=10):
    """
    Compute the Tensor Train (TT) decomposition of a given tensor X.
    
    Parameters:
        X (ndarray): The input tensor of shape (d1, d2, ..., dN).
        max_rank (int): Maximum allowable rank (truncation parameter) for each SVD.
    
    Returns:
        cores (list): A list containing the TT-cores.
        ranks (list): A list of TT-ranks including boundary ranks.
    """
    # Get the shape and number of dimensions of the tensor
    X_shape = X.shape
    N = len(X_shape)
    
    # Start with boundary rank 1
    ranks = [1]
    cores = []
    
    # Reshape the tensor to prepare for the first SVD:
    # For the first mode, flatten all dimensions except the first.
    tensor = X.reshape(X_shape[0], -1)
    
    # Loop over each mode except the last one
    for k in range(N - 1):
        # Perform the SVD on the current reshaped tensor
        U, S, Vt = svd(tensor, full_matrices=False)
        
        # Determine the rank for truncation (should not exceed max_rank)
        r_k = min(len(S), max_rank)
        
        # Truncate the matrices to keep the most significant components
        U = U[:, :r_k]
        S = np.diag(S[:r_k])
        Vt = Vt[:r_k, :]
        
        # Reshape U into the current TT-core: shape (r_{k-1}, d_k, r_k)
        core_shape = (ranks[-1], X_shape[k], r_k)
        core = U.reshape(core_shape)
        cores.append(core)
        ranks.append(r_k)
        
        # Prepare the tensor for the next iteration: multiply S and Vt
        tensor = S @ Vt
        
        # Reshape the tensor: combine the current rank and the next mode dimension
        new_shape = (r_k * X_shape[k + 1], -1)
        tensor = tensor.reshape(new_shape)
    
    # The last core: reshape the remaining tensor into shape (r_{N-1}, d_N, 1)
    last_core = tensor.reshape(ranks[-1], X_shape[-1], 1)
    cores.append(last_core)
    
    return cores, ranks

# Example Usage:
# Create a random 3D tensor (for example, 4x4x4)
X = np.random.rand(4, 4, 4)
tt_cores, tt_ranks = tensor_train_decomposition(X, max_rank=2)

# Print the shapes of the TT-cores and the TT-ranks
print("TT-ranks:", tt_ranks)
for i, core in enumerate(tt_cores):
    print(f"Core {i+1} shape: {core.shape}")

```

**Explanation of the Code:**

- **Input Tensor and Parameters:**  
  The function `tensor_train_decomposition` accepts an input tensor `X` and a maximum allowable rank `max_rank`. This rank acts as a threshold to truncate less significant singular values during the SVD.

- **Sequential SVD:**  
  The loop goes through each mode (except the last) and performs the following:
  - Reshapes the tensor into a 2D matrix.
  - Computes the SVD and truncates it to the specified maximum rank.
  - Reshapes the left singular matrix into a TT-core.
  - Multiplies $S$ and $V^T$ and reshapes the result to prepare for the next SVD.

- **Final TT-core:**  
  After processing all but the last mode, the remaining tensor is reshaped into the final core.

## **4. Network Construction**

Assume we have a weight matrix  
$$
W \in \mathbb{R}^{I \times J},
$$  
where the input dimension \(I\) and output dimension \(J\) are factorized into multiple modes. For example, if we factorize
$$
I = d_1 \times d_2 \times \cdots \times d_N \quad \text{and} \quad J = e_1 \times e_2 \times \cdots \times e_N,
$$  
then the TT decomposition expresses each element of \(W\) as

$$
W(i_1, i_2, \dots, i_N; \, j_1, j_2, \dots, j_N) = \sum_{r_1, \dots, r_{N-1}} G_1(1, i_1, j_1, r_1) \, G_2(r_1, i_2, j_2, r_2) \cdots G_N(r_{N-1}, i_N, j_N, 1),
$$

where each TT-core  
$$
G_k \in \mathbb{R}^{r_{k-1} \times d_k \times e_k \times r_k},
$$  
with the boundary conditions $r_0 = r_N = 1$. In many implementations (including our demonstration), one might simplify the factorization by assuming the weight matrix is reshaped into a tensor and then decomposed into TT-cores.

For an input vector $x \in \mathbb{R}^{I}$, the output of the layer is computed as

$$
y = W x.
$$

When \(W\) is represented in TT format, we can think of reconstructing \(W\) (or, more efficiently, performing the matrix–vector multiplication) by contracting the TT-cores. In our example, the full weight matrix is reconstructed (conceptually) as

$$
W_{\text{TT}} = \text{Contract}(G_1, G_2, \dots, G_N),
$$

and the forward pass becomes

$$
y = W_{\text{TT}} \, x.
$$

In practice, one may implement the contraction efficiently without explicitly forming the full matrix.

For classification, suppose we have a dataset $\{(x^{(i)}, y^{(i)})\}_{i=1}^m$ and a loss function $L$ (for example, the cross-entropy loss). The model’s prediction for a sample $x^{(i)}$ is

$$
\hat{y}^{(i)} = f(W_{\text{TT}} x^{(i)} + b),
$$

where \(f\) is an activation function (or the identity, depending on the layer), and \(b\) is a bias term. The cross-entropy loss is then given by

$$
L(\theta) = -\sum_{i=1}^{m} \log p_{y^{(i)}}\left( f(W_{\text{TT}} x^{(i)} + b) \right),
$$

with $\theta$ denoting all trainable parameters (i.e. the TT-cores and bias).

Using gradient descent (or a variant such as Adam), the parameters are updated as

$$
\theta \leftarrow \theta - \eta \nabla_{\theta} L,
$$

where $\eta$ is the learning rate.
For each TT-core $G_k$, the chain rule gives

$$
\frac{\partial L}{\partial G_k} = \frac{\partial L}{\partial W_{\text{TT}}} \cdot \frac{\partial W_{\text{TT}}}{\partial G_k}.
$$

Since $W_{\text{TT}}$ is computed via a sequence of tensor contractions, the gradient $\frac{\partial W_{\text{TT}}}{\partial G_k}$involves the derivatives of these contractions. Modern deep learning frameworks (e.g., PyTorch) automatically compute these derivatives, allowing us to update each TT-core during training.

One of the main advantages of TT decomposition is that the number of parameters is reduced from

$$
I \times J
$$

to approximately

$$
\sum_{k=1}^{N} \left(r_{k-1} \cdot d_k \cdot e_k \cdot r_k\right),
$$

which is much smaller when the TT-ranks \(r_k\) are low. This reduction helps in lowering memory consumption and computational costs, and may also have a regularization effect on the model.


## **5. How to format the input data and Tensor Train**

In Tensor Train–based neural networks, the input is typically provided as a flattened vector that is then "tensorized" (i.e., reshaped) to match the factorization used in the TT-layer. This tensorization aligns the dimensions of the input with those of the TT-cores that represent the weight matrix.

Consider the following scenario:

1. **Original Input:**  
   Suppose you have an input vector  
   $$
   x \in \mathbb{R}^{I},
   $$
   where, for example, \( I = 784 \) (as in a flattened 28×28 image).

2. **Tensorization:**  
   You choose a factorization of \( I \) into smaller dimensions, say:
   $$
   I = d_1 \times d_2 \times \cdots \times d_N.
   $$
   For the MNIST example, one natural choice is
   $$
   784 = 28 \times 28,
   $$
   meaning you treat the input as a 2-dimensional tensor with shape $(28, 28)$.

3. **TT-Layer Alignment:**  
   In a TT-decomposed layer, the weight matrix $W$ of a fully connected layer is reshaped and factorized into TT-cores. For instance, if the output dimension $J$ is also factorized as
   $$
   J = e_1 \times e_2 \times \cdots \times e_N,
   $$
   then the full weight matrix $W \in \mathbb{R}^{I \times J}$ is conceptually reshaped to
   $$
   W \in \mathbb{R}^{(d_1 \times d_2 \times \cdots \times d_N) \times (e_1 \times e_2 \times \cdots \times e_N)}.
   $$

   The TT-decomposition represents each element of \( W \) as
   $$
   W(i_1, \dots, i_N; \, j_1, \dots, j_N) = \sum_{r_1, \dots, r_{N-1}} G_1(1, i_1, j_1, r_1) \, G_2(r_1, i_2, j_2, r_2) \cdots G_N(r_{N-1}, i_N, j_N, 1),
   $$
   where each TT-core
   $$
   G_k \in \mathbb{R}^{r_{k-1} \times d_k \times e_k \times r_k},
   $$
   with boundary conditions $r_0 = r_N = 1$.

4. **Forward Pass:**  
   During the forward pass, the input vector $x$ (of size $I$) is first reshaped into a tensor of shape $(d_1, d_2, \dots, d_N)$. The TT-layer then performs a series of tensor contractions with the TT-cores to compute the equivalent of
   $$
   y = W x,
   $$
   where $y$ is the output. Often, this contraction is implemented efficiently without explicitly reconstructing the full matrix $W$.
### Summary

- **Input Format:**  
  A neural network using Tensor Train decomposition expects the input as a vector (or batch of vectors) of size  
  $$
  I = d_1 \times d_2 \times \cdots \times d_N.
  $$
  This vector is then reshaped (tensorized) to the multi-dimensional form $(d_1, d_2, \dots, d_N)$ to align with the TT-cores.

- **TT-Layer Operation:**  
  The TT-layer represents the weight matrix as a series of TT-cores $G_k$, where each core's dimensions are chosen to match the factorized input and output dimensions. The network then uses tensor contractions to perform the linear transformation on the tensorized input.

Example code for the MINIST image dataset classification using Tensor Train format and check the [github][https://github.com/zazabap/TensorTrain]
## References

- Novikov, A., Trofimov, M., & Oseledets, I. (2015). *Tensorizing Neural Networks*. [Link](https://arxiv.org/abs/1509.06569)
- Oseledets, I. V. (2011). *Tensor-Train Decomposition*. [Link](https://epubs.siam.org/doi/abs/10.1137/090752286)
- Cichocki, A., Lee, N., Oseledets, I., Phan, A.-H., Zhao, Q., & Mandic, D. P. (2016). *Tensor Networks for Dimensionality Reduction and Large-scale Optimization: Part 1 Low-Rank Tensor Decompositions*. [Link](https://arxiv.org/abs/1609.00818) 