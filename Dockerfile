FROM nvidia/cuda:12.8.1-cudnn-devel-ubuntu22.04

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app
COPY . /app

RUN uv venv && uv pip install --extra-index-url https://download.pytorch.org/whl/cu128 .

ENTRYPOINT ["uv", "run", "transparent-background"]
