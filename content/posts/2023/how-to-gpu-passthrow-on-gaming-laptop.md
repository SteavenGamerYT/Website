---
title: "How to GPU PASSTHROW on Gaming Laptop"

date: 2023-05-16
url: /how-to-gpu-passthrow-on-gaming-laptop
image: images/2023-thumbs/my-first-post.jpg
categories:
  - Linux
  - Windows
tags:
  - Ubuntu
  - Arch
  - Fedora
  - Windows
  - HARMIC
draft: false
---
<!--more-->
## REQUIREMENTS

16gb of ram

more then 8cores cpu

2 displays

2 keyboards

2 mouses

ARCH LINUX

WAYLAND and KDE

## Packages

`yay -S nvidia supergfxctl plasma5-applets-supergfxctl qemu-desktop libvirt edk2-ovmf virt-manager dnsmasq update-grub`

## Grub Confgration

`sudo nano /etc/default/grub`

Open Grub Config and Find `GRUB_CMDLINE_LINUX_DEFAULT=` and add `nvidia_drm.modeset=1 intel_iommu=on iommu=pt`

Example of my laptop `GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4 nvidia_drm.modeset=1 resume=/dev/disk/by-uuid/1dbe024d-28d7-4f2b-b556-b2969fd0e549 resume_offset=91174912 intel_iommu=on iommu=pt"`

![](/images/2023/gpupassthrow2023/grub.conf.png)

Update Grub NOW

`sudo update-grub`
## Supergfxctl Confgration

Enable and start the service

`sudo systemctl enable --now supergfxd`

Edit the Config to Support VFIO


`sudo nano /etc/supergfxd.conf`


Change `vfio_enable` from `false` to `true`

Change `hotplug_type` from `none` to `Std`

Your config should look like this
```sh
{
  "mode": "Hybrid",
  "vfio_enable": true,
  "vfio_save": false,
  "always_reboot": false,
  "no_logind": false,
  "logout_timeout_s": 180,
  "hotplug_type": "Std"
}
```
![](/images/2023/gpupassthrow2023/supergfxd.conf.png)

Restart the Service Now `sudo systemctl restart supergfxd`

Reboot

## Libvirt Confgration

`sudo gnome-text-editor /etc/libvirt/qemu.conf`

Remove # from `#user = "libvirt-qemu"` and replace `libvirt-qemu` with your username

example `#user = "omarhanykasban"`

Remove # from `#group = "libvirt-qemu"`

this how it should look like

![](/images/2023/gpupassthrow2023/qemu.conf.png)

`sudo gnome-text-editor /etc/libvirt/libvirtd.conf`

Remove # from `#unix_sock_group = "libvirt"`

and Remove # from `#unix_sock_ro_perms = "0777"`

this how it should look like

![](/images/2023/gpupassthrow2023/libvirt.conf.png)

Enable the service `sudo systemctl enable --now libvirtd`

Enable network support in libvirt

```sh
sudo virsh net-autostart default
sudo virsh net-start default
```

Add your Self into the libvirt and qemu and kvm groups

`sudo usermod -a -G libvirt,qemu,kvm omarhanykasban`

## later adding the gui things and creating video

later adding the gui things and creating video
## Walkthrough Video

{{< youtube 11111111 >}}