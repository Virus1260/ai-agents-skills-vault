---
name: heretic
description: Fully automatic censorship removal, directional ablation (abliteration), and refusal suppression for transformer-based LLMs using Heretic. Optimize refusal suppression while co-minimizing KL divergence to preserve model intelligence, reasoning capabilities, and remove AI slop.
---

# Heretic: Automated LLM Censorship Removal & Abliteration

Heretic is a tool that removes censorship ("safety alignment" refusals) from transformer-based language models without post-training or fine-tuning datasets.

It pairs **directional ablation** (also known as "abliteration", including norm-preserving biprojected abliteration) with a **TPE-based Bayesian parameter optimizer** powered by Optuna.

Heretic co-minimizes:
1. **Refusals** on harmful/adversarial prompt datasets (via `KeywordRate`).
2. **Kullback-Leibler (KL) Divergence** from the unaligned model on harmless prompts (via `KLDivergence`).

This yields a decensored model that suppresses refusals while preserving the original model's benchmarks, reasoning quality, and language coherence.

---

## When to Use This Skill

- Decensoring or removing refusal guardrails from open-weights models (Llama, Gemma, Qwen, Mistral, etc.).
- Eliminating robotic corporate refusals ("*As an AI language model, I cannot...*").
- Performing anti-slop abliteration to remove repetitive AI cliches ("*tapestry*", "*beacon*", "*testament*", "*delve*", "*resplendent*").
- Benchmarking and comparing refusal rates vs. degradation on modified LLMs.
- Exporting abliterated Safetensors weights or uploading directly to Hugging Face Hub.

## When NOT to Use This Skill

- Pure state-space models (e.g., Mamba) or proprietary closed-API models (OpenAI, Anthropic) without weight access.
- Fine-tuning new domain knowledge (use LoRA/QLoRA instead; abliteration only removes refusal directions in latent representations).

---

## Core Installation & Prerequisites

Heretic is available as a global CLI tool via `uv tool` or `pip`:

```bash
# Global CLI via uv tool (Recommended)
uv tool install heretic-llm

# Or standard pip installation
pip install -U heretic-llm
```

### Hardware & Environment Requirements
- **Python**: 3.10+
- **PyTorch**: 2.2+ (PyTorch 2.6+ recommended for `torch.accelerator` and MXFP4 quantized models).
- **GPU VRAM**:
  - 4B - 8B models: ~16GB - 24GB VRAM (or use 4-bit quantization).
  - 12B - 14B models: ~24GB - 48GB VRAM.
  - 70B+ / MoE models: Multi-GPU setup with Accelerate (`device_map="auto"`).

---

## Primary Workflows

### 1. Automatic Zero-Config Decensoring
Run Heretic with any Hugging Face model identifier or local directory:

```bash
heretic Qwen/Qwen3-4B-Instruct-2507
```

Heretic automatically:
1. Detects available GPU acceleration and memory.
2. Benchmarks optimal inference batch size (`mlabonne/harmless_alpaca`).
3. Runs baseline refusal and KL divergence evaluations.
4. Executes Optuna Bayesian trials (default: 100 trials, 30 exploration trials) searching for the optimal directional ablation vector and layer range.
5. Saves the winning weights to safetensors.

### 2. Anti-Slop Abliteration (Removing AI Writing Cliches)
Abliteration is not limited to safety refusals; Heretic can target linguistic slop words by penalizing models that generate cliché AI tokens:

```bash
heretic --config references/config.noslop.toml meta-llama/Llama-3.1-8B-Instruct
```

Key configuration in `config.noslop.toml`:
```toml
max_response_length = 300
system_prompt = "You are a professional writer."

[scorer.KeywordRate]
score_name = "Responses with slop"
keyword_markers = [
    "tapestry", "beacon", "testament", "delve", "resplendent",
    "ethereal", "unravel", "celestial", "symphony", "kaleidoscopic"
]
```

### 3. Evaluating Model Quality & Refusal Rate
Evaluate an abliterated model against the original reference model:

```bash
heretic --model google/gemma-3-12b-it --evaluate-model p-e-w/gemma-3-12b-it-heretic
```

This outputs:
- **Refusal Count**: E.g., drops from 97/100 to 3/100.
- **KL Divergence**: Minimal divergence (e.g., 0.16 vs 1.04 in manual abliterations) proves reasoning preservation.

---

## Memory & Multi-GPU Configuration (`config.toml`)

Place a customized `config.toml` in your working directory:

### VRAM-Constrained Hardware (16GB GPUs)
```toml
# Use 4-bit BitsAndBytes quantization during analysis
quantization = "bnb_4bit"

# Immediately offload residual analysis tensors to host RAM
offload_outputs_to_cpu = true

# Limit maximum batch size
max_batch_size = 32

# Max shard size for exported model files
max_shard_size = "4GB"
```

### Multi-GPU Setups
```toml
device_map = "auto"
# Set per-device limits if mixing card sizes:
# max_memory = { "0" = "20GB", "1" = "24GB", "cpu" = "64GB" }
```

### Chain-of-Thought (Reasoning) Models
For models with thinking phases (DeepSeek-R1, Qwen-Thinking), ensure CoT blocks are skipped so evaluation inspects the actual response:

```toml
chain_of_thought_skips = [
    ["<think>", "<think></think>"],
    ["<thought>", "<thought></thought>"],
    ["[THINK]", "[THINK][/THINK]"]
]
```

---

## Reference Configurations

Inspect pre-built configuration presets in [`references/`](references/):
- [`config.default.toml`](references/config.default.toml) – Full default configuration with all tunable parameters.
- [`config.noslop.toml`](references/config.noslop.toml) – Writing refinement & AI slop suppression.
- [`config.nohumor.toml`](references/config.nohumor.toml) – Seriousness & tone alignment.
- [`config.piqa.toml`](references/config.piqa.toml) – Benchmark optimization.
