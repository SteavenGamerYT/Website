---
title: "How to update Wine"

date: 2023-04-29
url: /how-to-update-wine/
image: images/wine.png
categories:
  - Linux
tags:
  - Ubuntu
draft: false
---
<!--more-->
Note: only works with Ubuntu becouse fedora and arch and opensuse alraday have up to date wine

## Update
Open https://wiki.winehq.org/Ubuntu and copy the commands for your distro version


for example i am running 23.04 so i ran


```sh
sudo dpkg --add-architecture i386 
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/lunar/winehq-lunar.sources
sudo apt update
sudo apt install --install-recommends winehq-devel
```

if that didnt work please tell me in discord