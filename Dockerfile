FROM nvidia/cuda:12.8.1-cudnn-devel-ubuntu22.04

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

RUN apt-get update && apt-get install -y --no-install-recommends \
        curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p "$HOME/.transparent-background" \
    && curl -fSL 'https://github.com/plemeri/transparent-background/releases/download/1.2.12/ckpt_base.pth' -o "$HOME/.transparent-background/ckpt_base.pth" \
    && curl -fSL 'https://github.com/plemeri/transparent-background/releases/download/1.2.12/ckpt_base_nightly.pth' -o "$HOME/.transparent-background/ckpt_base_nightly.pth" \
    && curl -fSL 'https://github.com/plemeri/transparent-background/releases/download/1.2.12/ckpt_fast.pth' -o "$HOME/.transparent-background/ckpt_fast.pth"

WORKDIR /app
COPY . ./
RUN uv venv && uv pip install --extra-index-url https://download.pytorch.org/whl/cu128 .

ENTRYPOINT ["uv", "run", "transparent-background"]
