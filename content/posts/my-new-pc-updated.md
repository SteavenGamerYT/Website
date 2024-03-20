---
title: "My New PC"

date: 2024-03-20
url: /my-new-pc-updated/
image: images/2023-thumbs/my-first-post.jpg
categories:
  - Linux
  - Windows
tags:
  - Ubuntu
  - Debian
  - Debian 12
draft: false
---
Finally, I have bought my dream (budget) PC!

## Specs

```
Case + PSU: Case Gamdias Aura GC1 Elite Mesh RGB Mid-Tower ATX Case + Helios E1-600W 80%+ Efficiency PSU
Motherboard: MSI A520M-A PRO (MS-7C96)
Cpu: AMD Ryzen™ 5 5500 
Gpu: NVIDIA GeForce GTX 1650
Ram: 8x2 16gb 3200mhz ddr4 
NVMe: CT500P2SSD8 500gb
OS: Arch Linux
```

## OS
So why did i chose Arch Linux over Windows?

### Windows
So at first lets talk about windows, The main resone why i dont use windows right now is

Its too slow.

It have tons of spyware.

It have tons of bloatware.

Its basicly limiting for me.

### Debian

So why didnt i just go with debain if i hate windows?

Debain is not rolling release, its 5 years release.

that means that i would have to relay on distrobox for updated packages.

While there is homebrew for cli apps, flatpak for gui apps, I dont like them.

Also debain is using 525xx nvidia drivers, that doesnt work

### Arch Linux

Everything works right?

Well no, when stuff doesnt work, Its not arch linux Fault.

Insited of creating my own fixs for the stuff that doesnt work.

I just tell devs to fix and its always faster to get the thing fixed that way

For an example, I had issue with hyprland that steam and games would crash when i open discord or change workspace.

Installing hyprland-git have fixed it but the Choatic version was broken.

What i did is, I have just reported it and they have looked into the issue and fixed it.

Hyprland is fully working now.

## Nvidia drivers

I have used 545xx for some time, and it have broken wayland.

Btw 550xx is still broken.

So how did i fix it?

at Frist i have installed `wayland-protocols-explicit-sync-git` and `xorg-xwayland-explicit-sync-git` and `xorgproto-explicit-sync-git` .

Then I have installed 535xx Drivers

then in `/etc/modprobe.d` i have added
`nvidia.conf` and `blacklist.conf` .

in `nvidia.conf` i have 

```sh
options nvidia NVreg_UsePageAttributeTable=1 NVreg_InitializeSystemMemoryAllocations=0 NVreg_DynamicPowerManagement=0x02
options nvidia_drm modeset=1 fbdev=1
```

in `blacklist.conf` I have 
```sh
# Blacklist the Intel TCO Watchdog/Timer module
blacklist iTCO_wdt

# Blacklist the AMD SP5100 TCO Watchdog/Timer module (Required for Ryzen cpus)
blacklist sp5100_tco
```

## Price

How much did the pc cost?

The pc have costed 20k EGP or 647$, Under 700$!

Update: Usd was 1$ = 30egp, Usd right now 1$ = 50egp, its 400$ now