---
title: "Wayland"

date: 2024-02-25
url: /wayland/
image: images/2024/wayland.png
categories:
  - Linux
tags:
  - Wayland
  - Xwayland
draft: false
---

So We all know that wayland is the feature of display server in Linux.

In this post I will show you how i setup wayland on my main pc and laptop.

## Electron

We all hate or love Electron, Electron have many issues for me, this Why i setup Electron apps as web apps as posable.

Still there is tons of apps that is not web apps and built using Electron, this how i make them use wayland.

You bascily edit there .desktop file and add `--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-webrtc-pipewire-capturer`.

Vs code for an example

```sh
[Desktop Entry]
Name=Visual Studio Code
Comment=Code Editing. Refined.
GenericName=Text Editor
Exec=/usr/bin/code --unity-launch --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-webrtc-pipewire-capturer %F
Icon=visual-studio-code
Type=Application
StartupNotify=false
StartupWMClass=Code
Categories=TextEditor;Development;IDE;
MimeType=text/plain;inode/directory;application/x-code-workspace;
Actions=new-empty-window;
Keywords=vscode;

[Desktop Action new-empty-window]
Name=New Empty Window
Exec=/usr/bin/code --new-window --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-webrtc-pipewire-capturer %F
Icon=visual-studio-code
```

You could try making `~/.config/electron-flags.conf` and `~/.config/chromium-flags.conf` and putting in them

```sh
--enable-features=UseOzonePlatform
--ozone-platform=wayland
--enable-webrtc-pipewire-capturer
```

however this didnt work for me.

also you can tell newer versions of elctron that wayland is the only thing that exiets by adding `ELECTRON_OZONE_PLATFORM_HINT=wayland` to `/etc/environment`

## Hyprland

even if hyprland wm is wayland it requires some config for wayland to work.

Put this in `~/.config/hypr/hyprland.conf`

```sh
env = WLR_NO_HARDWARE_CURSORS,1
env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
env = GDK_BACKEND,wayland
env = XDG_CURRENT_DESKTOP.Hyprland
env = XDG_SESSION_DESKTOP,Hyprland
env = XDG_SESSION_TYPE,wayland
env = ELECTRON_OZONE_PLATFORM_HINT,wayland
```


## Steam

If you are using intel or amd gpu, then Game scope should just work.

Use it like `gamescope -h 720 -H 1080 -U -r 60 -f --  mangohud %command%`

This tells gamescope to run game in 720p and upscale it to 1080p

## GDM

If you are using gdm and Nvidia gpu, you midge have seen that you only can boot to xorg.

This can be fixed by doing the following

`sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules` 

by running this you are disabling the gdm rules that controls how nvidia + wayland work, bascily telling it to show wayland sesisons on nvidia gpus

`sudo nano /etc/gdm/custom.conf` or in some distros `sudo nano /etc/gdm3/custom.conf`

make sure that `WaylandEnable=false` is set to true like this `WaylandEnable=true`

also add this kernel parameter `nvidia-drm.modeset=1`