---
title: 'Fine-Tuning LLaMA 2 with `torchrun`'
date: 2025-02-14
permalink: /posts/2025/02/fine-tune/
tags:
  - pyTorch
  - Parallel Computing
  - AI Infrastructure 
  - Fine-tuning
---
Fine-tuning large models like LLaMA 2 is a big task, but with `torchrun`, you can scale it across multiple GPUs with ease. In this post, I’ll walk you through how to do it step by step.

### What You Need

Before we start, make sure you have:
- A machine with multiple GPUs (H100 is ideal)
- PyTorch 2.0.1+ with CUDA 12.1
- `torchrun` (comes with PyTorch)
- `transformers` from Hugging Face
- `datasets` for loading training data
- `deepspeed` (optional, but helpful)

Run this to install everything:
```bash
pip install torch transformers datasets deepspeed
```

### Getting Your Training Script Ready

To fine-tune LLaMA 2, we need a script. Here’s a simple one called `train.py`:

```python
import torch
import torch.distributed as dist
from transformers import AutoModelForCausalLM, AutoTokenizer, TrainingArguments, Trainer
from datasets import load_dataset

# This is really important for effective fine-tuning. As the training prompts 
# vary in LLMs, please notice the difference when fine-tuning
def format_prompt(example):
    B_INST, E_INST = "[INST]", "[/INST]"
    B_SYS, E_SYS = "<<SYS>>\n", "\n<</SYS>>\n\n"
    system_prompt = "You are a helpful, respectful and honest assistant. Always answer as helpfully as possible, while being safe."
    system_prompt = B_SYS + system_prompt + E_SYS
    return {"text": f"{B_INST} {system_prompt} {example['text']} {E_INST}"}

def main():
    dist.init_process_group("nccl")
    model_name = "meta-llama/Llama-2-7b-hf"
    tokenizer = AutoTokenizer.from_pretrained(model_name)
    model = AutoModelForCausalLM.from_pretrained(model_name, torch_dtype=torch.float16)
    
    dataset = load_dataset("wikitext", "wikitext-2-raw-v1")
    dataset = dataset.map(format_prompt)
    tokenized_datasets = dataset.map(lambda x: tokenizer(x["text"], truncation=True, padding="max_length", max_length=512), batched=True)
    
    training_args = TrainingArguments(
        output_dir="./results",
        per_device_train_batch_size=2,
        evaluation_strategy="steps",
        logging_steps=10,
        save_steps=500,
        learning_rate=2e-5,
        num_train_epochs=3,
        weight_decay=0.01,
        report_to="none",
        ddp_find_unused_parameters=False
    )
    
    trainer = Trainer(
        model=model,
        args=training_args,
        train_dataset=tokenized_datasets["train"],
        eval_dataset=tokenized_datasets["validation"]
    )
    
    trainer.train()
    dist.destroy_process_group()

if __name__ == "__main__":
    main()
```

### Running the Training

Now comes the fun part—running it. If you have multiple GPUs, use this:
```bash
torchrun --nproc_per_node=4 --master_port=29500 train.py
```
Here’s what’s happening:
- `--nproc_per_node=4`: Uses 4 GPUs
- `--master_port=29500`: The port for communication

If you’re training across multiple nodes, set up environment variables:
```bash
MASTER_ADDR="<master-node-ip>" MASTER_PORT=29500 RANK=<node-rank> WORLD_SIZE=<total-nodes> torchrun --nproc_per_node=4 train.py
```

This approach ensures that LLaMA 2 is fine-tuned with properly formatted prompts, aligning with the model's training methodology. For better efficiency, try `deepspeed` or gradient checkpointing. Good luck!

