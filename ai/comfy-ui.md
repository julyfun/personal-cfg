# MiniMax H3 + ComfyUI Quick Start

目标：让 AI 在 Linux + NVIDIA 环境里，快速把 ComfyUI 和 MiniMax H3 跑起来。

## 1. 安装 ComfyUI

```bash
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI

# 慢就用 PyPI 镜像
export UV_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
export PIP_INDEX_URL=$UV_INDEX_URL

uv venv .venv
source .venv/bin/activate
uv pip install -r requirements.txt
```

可选：

```bash
uv pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
```

## 2. 安装 MiniMax H3 自定义节点

把节点放到：

```bash
ComfyUI/custom_nodes/ComfyUI_RH_MinMaxH3
```

重启 ComfyUI 后，右键搜索 `MiniMax H3` 或 `Qwen3-VL`。

## 3. 放模型

推荐扁平权重根：

```bash
ComfyUI/models/MiniMax-H3/
  MiniMax-H3-FL2VA-int8_convrot.safetensors
  MiniMax-H3-Ref2VA-int8_convrot.safetensors
  qwen3-vl-32b-int8_convrot.safetensors
  MiniMax-H3-video_vae.safetensors
  MiniMax-H3-audio_vae.safetensors
```

也可以让 `ComfyUI/models/MiniMax-H3` 指向 `models/diffusers/MiniMax-H3` 的软链接。

注意：

- `qwen3-vl-32b-int8_convrot.safetensors` 是推荐项
- 只有你真的有完整 shard 时，才选 `qwen3-vl-32b`
- 如果选 `qwen3-vl-32b`，`FL2VA/text_encoder/` 下要有完整 14 个 shard

## 4. 启动

```bash
python main.py --listen 127.0.0.1 --port 8188 --disable-auto-launch
```

远程机器本地查看：

```bash
ssh -N -L 8188:127.0.0.1:8188 qz-notebook-ssh
```

## 5. 最小工作流

```text
RHMiniMaxH3DirectModelLoader
RHMiniMaxH3DirectTextEncoderLoader
RHMiniMaxH3DirectVAELoader
RHMiniMaxH3T2VATarget
RHMiniMaxH3T2VATextEncode
RHMiniMaxH3EmptyAVLatent
RHMiniMaxH3DualSigmaSampler
RHMiniMaxH3DecodeAV
CreateVideo
SaveVideo
```

连线顺序：

```text
ModelLoader -> Sampler
TextEncoderLoader -> T2VATextEncode -> Sampler
T2VATarget -> EmptyAVLatent -> Sampler
VAELoader -> DecodeAV
Sampler -> DecodeAV -> CreateVideo -> SaveVideo
```

## 6. 推荐参数

```text
model_root = MiniMax-H3
transformer_path = MiniMax-H3-FL2VA-int8_convrot.safetensors
text_encoder_path = qwen3-vl-32b-int8_convrot.safetensors
video_vae_path = MiniMax-H3-video_vae.safetensors
audio_vae_path = MiniMax-H3-audio_vae.safetensors
aspect_ratio = 16:9 或 9:16
duration_seconds = 5
sigma_points = 21
sampler_mode = res_multistep
video_shift = 12
audio_shift = 3
accel = off
fps = 24
bit_depth = 8
```

## 7. 常见坑

- 节点没出现：刷新 ComfyUI 页面
- 报 missing shards：说明选到了分片版 `qwen3-vl-32b`，改成 `qwen3-vl-32b-int8_convrot.safetensors`
- 权重路径不对：优先检查 `ComfyUI/models/MiniMax-H3`


