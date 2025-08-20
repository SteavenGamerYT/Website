---
title: "How to install Waydroid and fix bugs"

date: 2025-07-20
url: /how-to-install-waydroid-and-fix-bugs/
image: images/2023-thumbs/my-first-post.jpg
categories:
  - Linux
tags:
  - Linux
  - Android
  - Waydroid
draft: false
---

## Installtion

At first install the package.

`sudo pacman -S waydroid`

then download the image.

`sudo waydroid init -s GAPPS`

Update it if you had it before.

`sudo waydroid upgrade`

enable the service

`sudo systemctl enable --now waydroid-container`

### Google Services
Now you are going to notice that you can't add your google account.

its fine as google services is not ready to be used yet.

`sudo waydroid shell -- sh -c "sqlite3 /data/data/*/*/gservices.db 'select * from main where name = \"android_id\";'"`

you will get letters and numbers copy them and put them in 

https://www.google.com/android/uncertified

now restart waydroid

```sh
sudo waydroid session stop
sudo systemctl restart waydroid-container
```

sign in with your google account.

## Modding Waydroid
yeah not everything will be working out of the box.

### Amd Gpu
At first stop waydroid

```sh
sudo waydroid session stop
sudo systemctl stop waydroid-container
```

At first copy the vendor.img from /var/lib/waydroid/images.

```sh
mkdir -p ~/Waydroid
cp -a /var/lib/waydroid/images/vendor.img ~/Waydroid/vendor.img
```


Now Expand it by 100mb.

```sh
sudo dd if=/dev/zero bs=1M count=100 >> ~/Waydroid/vendor.img
sudo e2fsck -f ~/Waydroid/vendor.img
sudo resize2fs ~/Waydroid/vendor.img
```

Now its time to mount it to replace amd gpu vulkan with working ones from `lineage-20-20250503-MAINLINE-waydroid_x86_64-vendor`.

```sh
mkdir -p ~/Waydroid/vendor
sudo mount -o loop,rw ~/Waydroid/vendor.img ~/Waydroid/vendor
```

Now Download this file and unzip it.

https://drive.google.com/file/d/15e_ukNAgIQB-fdt7dKEb2RSQWnet4LLn/view?usp=sharing

Copy files.

```sh
sudo cp -a ~/Documents/Waydroid/vendor2/lib/hw/vulkan.radeon.so ~/Waydroid/vendor/lib/hw/vulkan.radeon.so
sudo cp -a ~/Documents/Waydroid/vendor2/lib64/hw/vulkan.radeon.so ~/Waydroid/vendor/lib64/hw/vulkan.radeon.so
```

Now unmount it and replace the file.

```sh
sudo umount ~/Waydroid/vendor
sudo cp -a ~/Waydroid/vendor.img /var/lib/waydroid/images/vendor.img
```

Now edit this file `/var/lib/waydroid/waydroid.cfg`

in `[properties]` add `ro.hardware.gralloc = minigbm_gbm_mesa`

Update waydroid config files

`sudo waydroid upgrade -o`

Start waydroid.

```sh
sudo systemctl start waydroid-container
```

### Amd GPU (if above didn't work)

so above did not work for me.

so i found a fix.

download.

`lineage-20-20250503-MAINLINE-waydroid_x86_64-vendor`

https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86_64/lineage-20-20250503-MAINLINE-waydroid_x86_64-vendor.zip/download

unzip it.

Stop waydroid and replace the vendor file.

```sh
sudo waydroid session stop
sudo systemctl stop waydroid-container
sudo cp -a ~/Waydroid/vendor.img /var/lib/waydroid/images/vendor.img
```

Now edit this file `/var/lib/waydroid/waydroid.cfg`

in `[properties]` add `ro.hardware.gralloc = minigbm_gbm_mesa`

Update waydroid config files

`sudo waydroid upgrade -o`


Start waydroid and use it.

`sudo systemctl start waydroid-container`

### Disable Root
At first stop waydroid

```sh
sudo waydroid session stop
sudo systemctl stop waydroid-container
```

At first copy the system.img from /var/lib/waydroid/images.

```sh
mkdir -p ~/Waydroid
cp -a /var/lib/waydroid/images/system.img ~/Waydroid/system.img
```

Now Expand it by 100mb.

```sh
sudo dd if=/dev/zero bs=1M count=100 >> ~/Waydroid/system.img
sudo e2fsck -f ~/Waydroid/system.img
sudo resize2fs ~/Waydroid/system.img
```

Mount it.

```sh
mkdir -p ~/Waydroid/system
sudo mount -o loop,rw ~/Waydroid/system.img ~/Waydroid/system
```

Now run this to disable root.

```sh
sudo cp -a ~/Waydroid/system/system/build.prop ~/Waydroid/system/system/build.prop.bak
sudo sed -i 's/^ro.secure=.*/ro.secure=1/' ~/Waydroid/system/system/build.prop
sudo sed -i 's/^ro.debuggable=.*/ro.debuggable=0/' ~/Waydroid/system/system/build.prop
sudo sed -i 's/^ro.build.tags=.*/ro.build.tags=release-keys/' ~/Waydroid/system/system/build.prop
sudo grep -q "^persist.sys.root_access=" ~/Waydroid/system/system/build.prop || echo "persist.sys.root_access=0" | sudo tee -a ~/Waydroid/system/system/build.prop
```

Now unmount it and copy it.

```sh
sudo umount ~/Waydroid/system
sudo cp -a ~/Waydroid/system.img /var/lib/waydroid/images/system.img
```

Start waydroid.

```sh
sudo systemctl start waydroid-container
```

## Multi-Gpu
Waydroid does not support Multi-Gpu PC setup.

and it only supports intel or amd.

use this script to make it only use 1 gpu.

https://github.com/Quackdoc/waydroid-scripts/blob/main/waydroid-choose-gpu.sh

use it like 

```sh
sudo ./waydroid-choose-gpu.sh
1
```

## Arm Support

to add Arm support.

First install Wayland extres.

`paru -S waydroid-script-git`

Secound install libndk into waydroid.

`sudo waydroid-extras install libndk`


## Clipboard

Install PyClip

`paru -S python-pyclip`

Install the clipboard for xorg or wayland.

Xorg: `sudo pacman -S xclip`

Wayland: `sudo pacman -S wl-clipboard`