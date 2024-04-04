---
title: "How to Combine Audio Sources"
date: 2024-04-04
url: /how-to-combine-audio-sources/
image: images/2023-thumbs/my-first-post.jpg
categories:
  - Linux
tags:
  - Ubuntu
  - Arch
  - Fedora
draft: false
---

## Introduction

Combining audio sources in PulseAudio can be a powerful feature for managing audio output on Linux systems. Whether you're a music enthusiast, a gamer, or a multimedia creator, combining audio sources allows you to customize your audio setup to suit your needs.

## Load

This command loads the PulseAudio module `module-combine-sink`. PulseAudio is a sound server for Unix-like operating systems, enabling features such as mixing multiple audio streams, network audio, and more.

The `module-combine-sink` module in PulseAudio allows combining multiple audio output devices (sinks) into one virtual sink. This can be useful in various scenarios, such as:

- Playing audio through multiple physical speakers simultaneously.
- Combining audio from different applications, such as playing music from a media player while also receiving notifications from a messaging app.
- Creating a virtual surround sound setup for an immersive gaming experience.

Usage example:

```bash
pactl load-module module-combine-sink
```

## Unload

This command unloads the PulseAudio module module-combine-sink that was previously loaded. This effectively disables the combined sink functionality.

Usage example:

```bash
pactl unload-module module-combine-sink
```

## Conclusion

Combining audio sources in PulseAudio opens up a world of possibilities for customizing your audio setup on Linux. Experiment with different configurations to find the setup that works best for you, whether you're a casual user or an audio enthusiast.