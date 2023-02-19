---
title: "The Ultimate Linux Gaming Guide"

date: 2023-02-19
url: /ultimate-linux-gaming-guide/
image: images/2020/gaming-guide/gaming.jpg
categories:
  - Linux
tags:
  - Linux Gaming
featured: true
---
This guide goes over setting up your Linux system for gaming. I will include multiple setup instructions for various Linux distributions.  
<!--more-->

![gaming](/images/2023/gaming-guide/gaming.jpg)

This guide will broken into parts that you will need to verify on your system. Each part, should be checked to guarantee an optimal experience. 

***

## Video Drivers

Just like any operating system, having the latest drivers helps with performance in most games. 

### Ubuntu Based Distributions  

Enable 32-bit libraries

```
sudo dpkg --add-architecture i386 
```

![AMD](/images/amd-title.png)

#### AMD Mesa Driver Install

```
sudo add-apt-repository ppa:kisak/kisak-mesa -y
sudo apt update
sudo apt install libgl1-mesa-dri:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386 -y
```

*Note: Did you run into an error? Make sure you are running Ubuntu 22.04, Linux Mint 21.1, or Pop OS 22.04! - Older versions are not recommended*

![nVidia](/images/nvidia-title.png)

#### Nvidia Proprietary Driver Install

```
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update
sudo apt install nvidia-driver-525 -y
```

*Note: Not working? Are you using a recent nVidia card? I recommend at least GTX 900 Series or Above!

### Arch Based Distributions

**Enable Multilib for 32- bit support**  
`/etc/pacman.conf` *Note: you can remove the # to enable multilib shown below*

```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

```
sudo pacman -S --noconfirm --needed lib32-mesa vulkan-icd-loader lib32-vulkan-icd-loader
```

***

## Custom Linux Kernel Benchmarks

![custom-kernel](/images/2023/gaming-guide/custom-kernel.svg)

### Xanmod (Debian-based Only)

Official Site: <https://xanmod.org>

```
echo 'deb http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-kernel.list
wget -qO - https://dl.xanmod.org/gpg.key | sudo apt-key --keyring /etc/apt/trusted.gpg.d/xanmod-kernel.gpg add -
sudo apt update && sudo apt install linux-xanmod-x64v3 -y
```

### Liquorix (Debian-based Only)

Official Site: <https://liquorix.net>

Debian Prerequisites (No PPA)

```
codename="$(find /etc/apt -type f -name '*.list' | xargs grep -E '^deb' | awk '{print $3}' | grep -Eo '^[a-z]+' | sort | uniq -c | sort -n | tail -n1 | grep -Eo '[a-z]+$')" && sudo apt-get install apt-transport-https curl && echo -e "deb http://liquorix.net/debian $codename main\ndeb-src http://liquorix.net/debian $codename main\n\n# Mirrors:\n#\n# Unit193 - France\n# deb http://mirror.unit193.net/liquorix $codename main\n# deb-src http://mirror.unit193.net/liquorix $codename main" | sudo tee /etc/apt/sources.list.d/liquorix.list && curl 'https://liquorix.net/linux-liquorix.pub' | sudo apt-key add - && sudo apt-get update -y
```

Ubuntu based Prerequisites (PPA):

```
sudo add-apt-repository ppa:damentz/liquorix && sudo apt-get update -y
```

64-bit Install:

```
sudo apt-get install linux-image-liquorix-amd64 linux-headers-liquorix-amd64 -y
```

### Zen (Arch-based Only)

Built into Arch Linux and part of the official pacman repositories. This does a lot of the same tweaks as Liquorix but for Arch based distributions. 

```
pacman -S --noconfirm --needed linux-zen
```

### Mainline (Debian Bleeding Edge)

Source Project: <https://github.com/pimlie/ubuntu-mainline-kernel.sh>

This will update a debian stable release to the latest official kernel.

#### Installation 

```
sudo apt install wget -y
wget https://raw.githubusercontent.com/pimlie/ubuntu-mainline-kernel.sh/master/ubuntu-mainline-kernel.sh
chmod +x ubuntu-mainline-kernel.sh
sudo mv ubuntu-mainline-kernel.sh /usr/local/bin/
```

#### Usage

From terminal type any of the following commands:

```
ubuntu-mainline-kernel.sh -c # Check if Newer Kernel available
ubuntu-mainline-kernel.sh -i # Install latest kernel
ubuntu-mainline-kernel.sh -l # List locally installed kernels
ubuntu-mainline-kernel.sh -u # Uninstall mainline kernel
```

***

## ACO - Faster Compiling (AMD Only)

![aco](/images/2023/gaming-guide/aco.jpg)

This is where Linus Tech Tips recently covered - Linux gaming is BETTER than windows? on June 17, 2020 <https://youtu.be/6T_-HMkgxt0> and I covered last year - Mesa ACO Linux | The Future is Now! on November 20, 2019 <https://youtu.be/fm_mzPBnWB0>

Basically this changes the compiling from LLVM to ACO which is considerably faster. The installation process is quite a bit easier now as well compared to my video. You do need up-to-date drivers mesa 20+ and edit `/etc/environment`.

Add this to `/etc/environment`

```
RADV_PERFTEST=aco
```

***
![wine](/images/wine.png)
***

## Wine Dependancies and Lutris

There are several packages that wine, proton and lutris game installs need. I recommend installing all the dependancies before installing lutris.

### Ubuntu/Mint/Pop OS! 20

```
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt update
sudo apt-get install --install-recommends winehq-staging -y
sudo apt-get install lutris -y
```

### Arch-Based Distros

```
sudo pacman -S --noconfirm --needed wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader lutris
```

***

## ESync - Helps Game Overhead

Check to see if esync is enabled already (most distributions do by default)

```
ulimit -Hn
```

If this returns more than 500,000 than ESYNC IS ENABLED! If not, proceed with these instructions:  
Change the following files and add this line to the bottom

`/etc/systemd/system.conf` & `/etc/systemd/user.conf`

```
DefaultLimitNOFILE=524288
```

`/etc/security/limits.conf`

```
username hard nofile 524288
```

*Note: Change username to your username!!!*

***
![gamemode](/images/2023/gaming-guide/gamemode.jpg)
***

## GameMode - No CPU Throttling

GitHub Source Project: <https://github.com/FeralInteractive/gamemode>

### Ubuntu/Debian Dependencies

```
apt install meson libsystemd-dev pkg-config ninja-build git libdbus-1-dev libinih-dev dbus-user-session -y
```

### Arch Dependencies

```
pacman -S --noconfirm --needed meson systemd git dbus
```

### Build and Install GameMode

```
git clone https://github.com/FeralInteractive/gamemode.git
cd gamemode
git checkout 1.7 # omit to build the master branch
./bootstrap.sh
```

### Uninstall GameMode

```
systemctl --user stop gamemoded.service
ninja uninstall -C builddir
```

### GameMode Usage

There are multiple ways to Use GameMode

- **Lutris** - Under settings you can enable GameMode for all games you launch
- **Steam** - Go to Launch options for the game of choice and type in `gamemoderun %command%`
- **Terminal** - type `gamemoderun ./game`
- **Gnome Tool** - If you use GNOME Desktop Environment install this extension: <https://extensions.gnome.org/extension/1852/gamemode/>

***
![proton](/images/2023/gaming-guide/proton.jpg)
***

## Custom Proton

The stock steam proton is rather old and behind the Wine team. Which means there are a lot of performance tweaks and improvements that you aren't getting yet. This is why I recommend everyone install Custom proton as I find the releases a considerable improvement when gaming in Steam. 

**Note: DO NOT USE STEAM IN A FLATPAK! You will lose some performance and modifications are more difficult!**

Source Project: <https://github.com/GloriousEggroll/proton-ge-custom#manual>  
Auto-Install Project: <https://github.com/Termuellinator/ProtonUpdater>

For Installation, we will use the ProtonUpdater script on GitHub.

```
cd ~
wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
sudo chmod +x cproton.sh
./cproton.sh
```

***

## Video Walkthrough

{{< youtube xvrft9ULvho >}}  

## Conclusion

Doing these tweaks or just some of them will make a drastic difference when it comes to Gaming on Linux. I personally use all of the tweaks, but sometimes I end up not using the Custom kernel if I have issues with drivers like nvidia sometimes does not like it.
