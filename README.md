# blender-cuda

A container image with headless **Blender 5.2.3** on **CUDA 12.4** (Ubuntu 22.04), ready for GPU rendering
(Cycles with OptiX or CUDA, Eevee) on rented GPU machines, with no install step at start-up.

What's inside: the `nvidia/cuda:12.4.1-base-ubuntu22.04` image, Blender 5.2.3 from blender.org in
`/opt/blender`, the system libraries Blender needs (GL, EGL, Vulkan, X11), and CuPy with NVRTC in
Blender's own Python. Nothing else.

```bash
docker run --gpus all ghcr.io/its-arab/blender-cuda:5.2.3 /opt/blender/blender -b -P your_script.py
```

Built by GitHub Actions from the `Dockerfile` here. Blender is GPL; see https://www.blender.org/about/license/.
