---
title: "The Importance of Setting Shader Cache Paths for Non-Steam Games"

date: 2024-06-27
url: /shader-cache/
image: images/2023-thumbs/my-first-post.jpg
categories:
  - Linux
tags:
  - Linux
draft: false
---

When running non-Steam games on Linux, it's essential to set specific environment variables to optimize performance and ensure smooth gameplay. These environment variables control where shader cache files are stored, which can significantly impact the gaming experience. Here are the key shader cache paths you should set and why they matter:

## DXVK_STATE_CACHE_PATH

`DXVK_STATE_CACHE_PATH` is used by DXVK, a Vulkan-based compatibility layer for Direct3D 9/10/11. Setting this path allows DXVK to store its state cache, which can drastically reduce stuttering caused by shader compilation during gameplay.

### Why It's Important:
- **Reduced Stuttering**: By caching shader states, the game can retrieve them from the cache instead of recompiling, leading to smoother gameplay.
- **Improved Load Times**: Games will load faster as the shaders are already compiled and stored.

### Example:
```sh
export DXVK_STATE_CACHE_PATH="$HOME/.cache/dxvk"
```
## MESA_GLSL_CACHE_DIR
VKD3D_SHADER_CACHE_PATH is used by vkd3d, a Direct3D 12 to Vulkan translation library. This variable specifies where the shader cache should be stored for games using Direct3D 12.

### Why It's Important:
- **Reduced Compilation Overhead**: Cached shaders reduce the need for on-the-fly compilation, which can cause performance drops.
- **Smoother Gameplay:** Helps in maintaining consistent frame rates by avoiding sudden spikes due to shader compilation.

## VKD3D_SHADER_CACHE_PATH

`VKD3D_SHADER_CACHE_PATH` is used by vkd3d, a Direct3D 12 to Vulkan translation library. This variable specifies where the shader cache should be stored for games using Direct3D 12.

### Why It's Important:
- **Reduced Compilation Overhead**: Cached shaders reduce the need for on-the-fly compilation, which can cause performance drops.
- **Smoother Gameplay**: Helps in maintaining consistent frame rates by avoiding sudden spikes due to shader compilation.

### Example:
```sh
export VKD3D_SHADER_CACHE_PATH="$HOME/.cache/vkd3d"
```

## __GL_SHADER_DISK_CACHE_PATH

`__GL_SHADER_DISK_CACHE_PATH` is used by NVIDIA's proprietary drivers for storing shader disk cache. This environment variable defines where NVIDIA should store its compiled shader programs.

### Why It's Important:
- **Optimized Performance**: Ensures that shader compilation happens less frequently, leading to better overall game performance.
- **Reduced Latency**: Minimizes delays caused by on-the-fly shader compilation.

### Example:
```sh
export __GL_SHADER_DISK_CACHE_PATH="$HOME/.cache/nvidia"
```

## Conclusion

In the world of gaming on Linux, optimizing performance isn't just about hardware; it's also about leveraging software configurations effectively. Setting shader cache paths for non-Steam games using environment variables like `DXVK_STATE_CACHE_PATH`, `MESA_GLSL_CACHE_DIR`, `VKD3D_SHADER_CACHE_PATH`, and `__GL_SHADER_DISK_CACHE_PATH` plays a crucial role in enhancing your gaming experience.

By storing compiled shaders in designated cache directories, you can significantly reduce stuttering, improve load times, and ensure smoother gameplay sessions. These optimizations not only enhance performance but also contribute to a more consistent gaming experience, whether you're battling foes in a fast-paced shooter or exploring vast virtual worlds.

Don't forget to integrate these environment variables into your game launchers or startup scripts to reap the full benefits of shader caching. With these optimizations in place, you're poised to enjoy your favorite non-Steam games on Linux with minimal disruptions and maximum enjoyment.

Happy gaming!
