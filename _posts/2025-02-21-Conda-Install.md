---
title: 'Install Miniconda on Server'
date: 2025-02-21
permalink: /posts/2025/02/conda-install/
tags:
  - conda
  - env 
  - python
---


### **Step 1: Download Miniconda Locally**
Run the following command to download the latest Miniconda installer for Linux (adjust the link if using macOS):

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
```

### **Step 2: Install Miniconda Locally**
Run the installation script:

```bash
bash ~/miniconda.sh -b -p ~/miniconda
```

- `-b` → Run in batch mode (no prompts).
- `-p ~/miniconda` → Install it in your home directory (`~/miniconda`).

### **Step 3: Initialize Miniconda**
Activate the installed Miniconda:

```bash
~/miniconda/bin/conda init
```

To activate the installation manually, add this to your `~/.bashrc` or `~/.bash_profile`:

```bash
export PATH="$HOME/miniconda/bin:$PATH"
```

Then, apply the changes:

```bash
source ~/.bashrc
```

### **Step 4: Create a Virtual Environment**
Once Miniconda is installed, create a virtual environment:

```bash
conda create --prefix ~/myenv python=3.10 -y
```

Activate the environment:

```bash
conda activate ~/myenv
```

To deactivate the environment:

```bash
conda deactivate
```

---

### **Additional Notes:**
- If you don’t want to modify `~/.bashrc`, you can manually activate Miniconda each session with:
  ```bash
  export PATH="$HOME/miniconda/bin:$PATH"
  ```
- If `conda activate ~/myenv` doesn't work, try:
  ```bash
  source activate ~/myenv
  ```

This setup ensures Miniconda and virtual environments remain local without interfering with the system-wide installation. 🚀