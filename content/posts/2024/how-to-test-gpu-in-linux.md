---
title: "How to test gpu in linux"

date: 2024-02-25
url: /how-to-test-gpu-in-linux/
image: images/2023-thumbs/my-first-post.jpg
categories:
  - Linux
tags:
  - GPU
  - Drivers
draft: false
---

So you just installed linux and looking to test your gpu.

## Vulkan

at frist install `vulkan-tools`.

To test vulkan run `vkcube` if you see the cube then vulkan is working.

## Opengl

Just run `glxinfo | grep "OpenGL renderer"`.

## Laptops

You midge have seen that distros no longer ship with prime-run.

Don't worry you can reinstall it.

`sudo nano /bin/prime-run`

```sh
#!/bin/bash
export __NV_PRIME_RENDER_OFFLOAD=1
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export __VK_LAYER_NV_optimus=NVIDIA_only
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json
exec "$@"
```

`sudo chmod +x /bin/prime-run`

now use it like `prime-run vkcube` or `prime-run glxinfo | grep "OpenGL renderer"`.