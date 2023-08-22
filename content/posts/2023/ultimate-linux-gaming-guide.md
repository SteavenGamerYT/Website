---
title: "The Ultimate Linux Gaming Guide"

date: 2023-08-22
url: /ultimate-linux-gaming-guide
image: images/2023/gaming-guide/gaming.jpg
categories:
  - Linux
tags:
  - Linux Gaming
  - Ubuntu
  - Arch
  - Fedora
  - Debain
featured: true
---
This guide goes over setting up your Linux system for gaming. I will include multiple setup instructions for various Linux distributions.  
<!--more-->

![gaming](/images/2023/gaming-guide/gaming.jpg)

This guide will broken into parts that you will need to verify on your system. Each part, should be checked to guarantee an optimal experience. 

***
## Repos
### Ubuntu Repos
Enable 32-bit libraries

```
sudo dpkg --add-architecture i386 
```

### Fedora Repos
You need to enable RPM Fusion in order to download any Gaming Related Stuff in Fedora.

```sh
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora
  rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf group update core
```
### Arch Repos

**Enable Multilib for 32- bit support**  
`/etc/pacman.conf` *Note: you can remove the # to enable multilib shown below*

```
[multilib]
Include = /etc/pacman.d/mirrorlist
```
## AUR helper
Only For Arch Linux
```sh
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```
## Video Drivers

Just like any operating system, having the latest drivers helps with performance in most games. 

![AMD](/images/amd-title.png)

### AMD Drivers

Should be Preinstalled In Lastest Ubuntu 22.04 lts or Linux Mint 21 or POP OS 22.04 or Fedora 38.

If Its not Preinstalled, Installing anything that wants them will get them Installed.


![nVidia](/images/nvidia-title.png)

### Nvidia Drivers
### Ubuntu
`sudo apt install nvidia-driver-535 -y`

### Fedora
`sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda`

### Arch
`sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings`

*Note: Not working? Are you using a recent nVidia card? I recommend at least RTX 20 Series or Above!

## Custom Linux Kernel

This is NO LONGER RECOMMADED on ubuntu, Since this Kernals Can BREAK NVIDIA drivers.

If you want Custom Kernal on Fedora then Reinstall to Nobara.

https://nobaraproject.org

### Zen (Arch Linux Only)

Built into Arch Linux and part of the official pacman repositories. This does a lot of the same tweaks as Liquorix for Ubuntu but for Arch Linux. 


`sudo pacman -Syu linux-zen linux-zen-headers`

***
![wine](/images/wine.png)
***

## Gaming Lunchers + Tools

### Ubuntu 22.04/Mint 21/Pop OS! 22.04

```sh
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt update
sudo apt-get install --install-recommends winehq-staging -y
sudo apt-get install lutris gamemode mangohud goverlay flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install com.heroicgameslauncher.hgl com.vysp3r.ProtonPlus
```

### Arch-Based Distros

`yay -Syu steam lutris gamemode lib32-gamemode mangohud lib32-mangohud goverlay protonplus wine-stagging wine-mono wine-gecko winetricks protontricks heroic-games-launcher-bin`

### Fedora

```sh
sudo dnf install steam lutris mangohud goverlay flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install com.heroicgameslauncher.hgl com.vysp3r.ProtonPlus
```
***