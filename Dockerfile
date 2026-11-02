# Headless Blender 5.2.3 on CUDA 12.4 (Ubuntu 22.04) with CuPy in Blender's Python, for GPU rendering
# on rented machines (RunPod and the like). Nothing else is in the image.
FROM nvidia/cuda:12.4.1-base-ubuntu22.04
ARG BLENDER=5.2.3
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends curl ca-certificates xz-utils \
      libxi6 libxxf86vm1 libxfixes3 libxrender1 libgl1 libegl1 libxkbcommon0 libsm6 libice6 libx11-6 libxext6 \
      libglib2.0-0 libglvnd0 libvulkan1 \
 && rm -rf /var/lib/apt/lists/*
RUN curl -fsL "https://download.blender.org/release/Blender${BLENDER%.*}/blender-${BLENDER}-linux-x64.tar.xz" \
      | tar -xJ -C /opt \
 && ln -s "/opt/blender-${BLENDER}-linux-x64" /opt/blender
# CuPy and NVRTC in Blender's Python, for GPU maths inside Blender scripts
RUN /opt/blender/5.2/python/bin/python3.13 -m pip install -q --no-cache-dir --disable-pip-version-check \
      --root-user-action=ignore cupy-cuda12x nvidia-cuda-nvrtc-cu12
LABEL org.opencontainers.image.description="Headless Blender 5.2.3 on CUDA 12.4 (Ubuntu 22.04) with CuPy, for GPU rendering"
