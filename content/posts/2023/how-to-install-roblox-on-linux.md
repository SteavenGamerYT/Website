---
title: "How to install Roblox on Linux"

date: 2023-04-01
url: /how-to-install-roblox-on-linux
image: images/roblox.png
categories:
  - Linux
tags:
  - Ubuntu
  - Fedora
  - Arch
  - Roblox
  - Gaming
draft: false
---
So to play roblox on linux, you need to use **grapejuice**

## System Requrements
**Ubuntu 22.04 or higher**

**Fedora 36 or Higher**

**Arch Linux UP TO Date**

**and Vulkan compatable GPU**

## Installtion

## Ubuntu

```sh
sudo dpkg --add-architecture i386 -y
curl https://gitlab.com/brinkervii/grapejuice/-/raw/master/ci_scripts/signing_keys/public_key.gpg | sudo tee /usr/share/keyrings/grapejuice-archive-keyring.gpg
sudo tee /etc/apt/sources.list.d/grapejuice.list <<< 'deb [signed-by=/usr/share/keyrings/grapejuice-archive-keyring.gpg] https://brinkervii.gitlab.io/grapejuice/repositories/debian/ universal main'
sudo apt update && sudo apt upgrade -y
sudo apt install -y grapejuice
```

## Fedora

```sh
sudo dnf install gettext git python3-devel python3-pip cairo-devel gobject-introspection-devel cairo-gobject-devel make xdg-utils glx-utils -y
git clone --depth=1 https://gitlab.com/brinkervii/grapejuice.git /tmp/grapejuice
cd /tmp/grapejuice
./install.py
```

## Arch

```sh
git clone --depth=1 https://aur.archlinux.org/grapejuice-git.git /tmp/grapejuice-git
cd /tmp/grapejuice-git
makepkg -si
```

Or 

`yay -S grapejuice`


## Custom Wine to fix Mouse Problems

```sh
cd /tmp
wget https://pastebin.com/raw/5SeVb005 -O install.py
python3 install.py
```