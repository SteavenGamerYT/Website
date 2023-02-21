---
title: "How to install Arch Linux"

date: 2023-02-21
url: /how-to-install-arch-linux
image: https://itsfoss.com/content/images/wordpress/2017/12/install-arch-linux-featured-800x450.png
categories:
  - Linux
tags:
  - Linux
  - Arch Linux
draft: false
---
Arch Linux is a general-purpose rolling release Linux distribution that is very popular among DIY enthusiasts and hardcore Linux users.

The default installation covers only a minimal base system and expects the end-user to configure the system by himself/herself.

This is why installing Arch Linux is a challenge in itself but at the same time, it is a learning opportunity for intermediate Linux users.

Fret not, you can easily get Arch Linux up and running if you follow the steps mentioned below.
## How to install Arch Linux
As of now, there are two ways using which you can install Arch Linux:

Without the guided installer


With the help of Archinstaller (guided installer)


In case you didn’t know, Arch Linux introduced a guided installer in 2021 (a menu based system to help you easily configure things for installation).


In this tutorial, we focus on configuring things ourselves, without the need of archinstaller. It is potentially more time-consuming but BETTER FOR FOX, YES FOX


The installation steps can differ at some points depending on whether you have a UEFI or legacy BIOS system. Most new systems come with UEFI these days.


I have written it here with a focus on the UEFI system but I’ll also mention the steps that are different for the legacy BIOS systems.


**The method discussed here wipes out existing operating system(s) from your computer and installs Arch Linux on it. So if you are going to follow this tutorial, make sure that you have backed up your files, or else you’ll lose all of them. You have been warned.**


The method discussed here wipes out existing operating system(s) from your computer and installs Arch Linux on it. So if you are going to follow this tutorial, make sure that you have backed up your files, or else you’ll lose all of them. You have been warned.


## Requirements for installing Arch Linux:


An x86_64 (i.e. 64 bit) compatible machine


Minimum 512 MB of RAM (recommended 2 GB)


At least 2 GB of free disk space (recommended 20 GB for basic usage with a desktop environment)


An active internet connection


A USB drive with a minimum 2 GB of storage capacity


Familiarity with the Linux command line


Once you have made sure you have all the requirements, let’s install Arch Linux.

## Step 1: Download the Arch Linux ISO
You can download the ISO from the official website. Both direct download and torrent links are available.

https://archlinux.org/download/

## Step 2: Create a live USB of Arch Linux
You will have to create a live USB of Arch Linux from the ISO you just downloaded.

You may use the Etcher GUI tool to create the live USB. It is available for both Windows and Linux.

![](https://itsfoss.com/content/images/wordpress/2020/01/arch_linux_live_usb.jpg)

Alternatively, if you are on Linux, you can use the dd command to create a live USB. Replace /path/to/archlinux.iso with the path where you have downloaded the ISO file, and /dev/sdx with your USB drive in the example below. You can get your drive information using lsblk command.

`dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx status=progress && sync`

Stick to balenaEtcher if you are comfortable with a GUI.

## Step 3: Boot from the live USB

**Do note that in some cases, you may not be able to boot from live USB with secure boot enabled. If that’s the case with you, disable the secure boot first.**

Once you have created a live USB for Arch Linux, shut down your PC. Plugin your USB and boot your system. While booting keep pressing F2, F10 or F12 key (depending upon your system) to go into boot settings.

Here, select to boot from USB or removable disk. Once you do that and the system boots, you should see an option like this:
![](https://itsfoss.com/content/images/wordpress/2022/05/Arch-Linux-Boot-Screen-800x611.png)

Select Boot Arch Linux (x86_64). After various checks, Arch Linux will boot to the login prompt with the root user.

## Not using US keyboard? Read this
The default keyboard layout in the live session is US. While most English language keyboards will work just fine, the same cannot be true for French, German and other keyboards.


If you face difficulty, you can list out all the supported keyboard layout:


`ls /usr/share/kbd/keymaps/**/*.map.gz`


And then change the layout to the an appropriate one using loadkeys command. For example, if you want a German keyboard, this is what you’ll use:


`loadkeys de-latin1`


The next steps include partitioning the disk, creating the filesystem and mounting it.


**Again, read all the instructions properly and follow each step carefully. You miss one step or ignore something and you’ll have difficulty installing Arch.**


## Step 4: Partition the disks
For partitioning the disks, we’ll use command line based partition manager fdisk.


Use this command to list all the disk and partitions on your system:


`fdisk -l`


**Your hard disk should be labelled /dev/sda or /dev/nvme0n1. Please use the appropriate disk labeling for your system. I am using /dev/sda because that’s more common.**


First, select the disk you are going to format and partition:


`fdisk /dev/sda`


I suggest that you delete any existing partitions on the disk using command d. Once you have the entire disk space free, it’s time to create new partitions with command n.


## Check if you have UEFI mode enabled
Some steps are different for UEFI and non-UEFI systems.You should verify if you have UEFI enabled system or not. Use this command:

`ls /sys/firmware/efi/efivars`

If this directory exists, you have a UEFI enabled system. You should follow the steps for UEFI system. The steps that differ are clearly mentioned.

## Create an ESP partition (For UEFI systems only)
If you have a UEFI system, you must create an EFI partition at the beginning of your disk. Otherwise, skip this step.

When you enter n, it will ask you to choose a disk number, enter 1. Stay with the default block size, when it asks for the partition size, enter +512M.
![](https://itsfoss.com/content/images/wordpress/2022/05/fdisk_new_efi-800x290.png)

One important steps is to change the type of the EFI partition to EFI System (instead of Linux system).

Enter t to change type. Enter L to see all the partition types available and then enter its corresponding number to the EFI system.

![](https://itsfoss.com/content/images/wordpress/2022/05/Change-type-of-EFI-System-Partition-800x659.png)
## Create root partition
You need to create root partition for both UEFI and legacy systems.

The common partitioning practice was/is to create root, swap and home partitions separately. You may just create a single root partition and create a swapfile and home under the root directory itself.

So, in this approach, we’ll have a single root partition, no swap, no home.

While you are in the fdisk command, press n to create a new partition. It will automatically give it partition number 2. This time keep on pressing enter to allocate entire remaining disk space to the root partition.

![](https://itsfoss.com/content/images/wordpress/2022/05/New-_Partition-800x246.png)

When you are done with the disk partitioning, enter w command to write the changes to the disk and exit out of fdisk command.

## Step 4: Create filesystem

Now that you have your disk partitions ready, it’s time to create filesystem on it. Follow the steps for your system

## Creating filesystem for UEFI system
So, you have two disk partitions and the first one is EFI type. Create a FAT32 file system on it using the mkfs command:

`mkfs.fat -F32 /dev/sda1`

Now create an Ext4 filesystem on the root partition:

`mkfs.ext4 /dev/sda2`
## Creating filesystem for non-UEFI system
For non-UEFI system, you only have one single root partition. So just make it ext4:

`mkfs.ext4 /dev/sda1`
## Step 5: Connect to WiFi
You can connect to WiFi interactively using this helpful utility called iwctl. Just enter this command and follow the on-screen instructions:

`iwctl`

Next, you can list all your wireless interfaces/devices connected using the command:

`device list`

You need to select the preferred one.

Once you select the wireless interface, scan for available network using the command below:

`station wlan0 scan`

While it scans for the network, you don’t get to see the network names yet. So, to see the connections available, you can type in:

`station wlan0 get-networks`

Among the listed networks, you can connect to your target Wi-Fi using the command:

`station wlan0 connect "Name of Network/WiFi"`

If it is protected by a password, you will be asked for it, enter the credentials and you should be connected to it.

Exit the network setup prompt using Ctrl + D.

Now, we’re connected to the network, but to make sure, you can check if you could use the internet by using the ping command:

`ping google.com`

If you get bytes in reply, you are connected. Use Ctrl+C to stop the ping reply.

## Step 6: Select an appropriate mirror

Thankfully, there is a fix for that. First sync the pacman repository so that you can download and install software:

`pacman -Syy`

Now, install reflector too that you can use to list the fresh and fast mirrors located in your country:

`pacman -S reflector`

Make a backup of mirror list (just in case):

`cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak`

Now, get the good mirror list with reflector and save it to mirrorlist. You can change the country from US to your own country.

`reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist`

All good to go now.


# Step 7: Install Arch Linux
Since you have all the things ready, it’s time to finally install the Arch Linux. You’ll be installing it on the root directory so mount it first.

Do you remember the name of the root partition? Use it to mount it:

`mount /dev/sda2 /mnt`

Note that this is valid for UEFI systems, you will have to use /dev/sda1 in non-UEFI systems.

With root mounted, it’s time to use the wonderful pacstrap script to install all the necessary packages:

`pacstrap /mnt base linux linux-firmware vim nano`

It will take some time to download and install these packages. If the downloads get interrupted, no need to panic. You can run the above command once again and it resumed the download.

I have added Vim and Nano text editor to the list because you’ll need to edit some files post-installation. You can use anything you are comfortable with.

For reference, head to our nano vs vim article to explore the differences between these editors.

## Step 8: Configure the installed Arch system
Generate a fstab file to define how disk partitions, block devices, or remote file systems are mounted into the filesystem.

`genfstab -U /mnt >> /mnt/etc/fstab`

Now use arch-chroot and enter the mounted disk as root. Actually, now you are using the just installed Arch Linux system on the disk. You’ll have to do some configuration changes to the installed system so that you could run it properly when you boot from the disk.

`arch-chroot /mnt`
## Setting Timezone
To set up timezone on Linux, you can use timedatectl command. First find your time zone:

`timedatectl list-timezones`

Exit from the list using Ctrl + C or just q. And then set it up like this (replace Europe/Paris with your desired time zone):

`timedatectl set-timezone Europe/Paris`

## Setting up Locale
This is what sets the language, numbering, date, and currency formats for your system.

The file /etc/locale.gen contains all the local settings and system language in a commented format.

Open the file using Vim or Nano editor and uncomment (remove the # from the start of the line) the language you prefer.

The command to open the file looks like:

`nano /etc/locale.gen`
![](https://itsfoss.com/content/images/wordpress/2022/05/localeGen-800x335.png)
I have used en_GB.UTF-8 (English with Great Britain). Hit Ctrl + X and then Y to save the selection and continue.

Now generate the locale config in the /etc directory file using the below commands one by one:

```
locale-gen
echo LANG=en_GB.UTF-8 > /etc/locale.conf
export LANG=en_GB.UTF-8
```
Both locale and timezone settings can be changed later on as well when you are using your Arch Linux system.

## Network configuration
Create a /etc/hostname file and add the hostname entry to this file. Hostname is basically the name of your computer on the network.

In my case, I’ll set the hostname as myarch. You can choose whatever you want:

`echo myarch > /etc/hostname`

The next part is to create the hosts file:

`touch /etc/hosts`

And edit this /etc/hosts file with Vim or Nano editor to add the following lines to it (replace myarch with hostname you chose earlier):

`127.0.0.1	localhost
::1		localhost
127.0.1.1	myarch`
## Set up root password
You should also set the password for the root account using the passwd command:

`passwd`

You will be prompted to enter (and re-type) your password to confirm.
## Step 9: Install Grub bootloader

This is one of the crucial steps and it differs for UEFI and non-UEFI systems. Let me mention the steps for the UEFI systems first.

Make sure that you are still using arch-chroot. Install required packages:

`pacman -S grub efibootmgr`

Create the directory where EFI partition will be mounted:

`mkdir /boot/efi`

Now, mount the ESP partition you had created

`mount /dev/sda1 /boot/efi`

Install grub like this:

`grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi`

One last step:

`grub-mkconfig -o /boot/grub/grub.cfg`

## Install grub on Non-UEFI systems
Install grub package first:

`pacman -S grub`

And then install grub like this (don’t put the disk number sda1, just the disk name sda):

`grub-install /dev/sda`

Last step:

`grub-mkconfig -o /boot/grub/grub.cfg`

## Step 10: Create Additional user and enforce privileges

You should not boot into a system, which has only a root user account. This way, every change you make will happen without any authentication required, and you might end up messing up your system.

Of course, you can still choose to do it, but it is not the recommended solution for a stable and secure experience.

So there should be an additional user, who gets root privileges using sudo. That reminds me, you should also install the sudo package if you didn’t already:


`pacman -S sudo`

Now create a new user and give permissions. In my case, ‘steavengameryt’ is the new username I chose. You can select your own.

```
useradd -m steavengameryt
passwd steavengameryt
```

Enter the password for this user and confirm. Now, you will be adding this user to a group of users that grants specific permissions. This should be self-explanatory, while the wheel group is needed for a user act as the super user.

`usermod -aG wheel,audio,video,storage steavengameryt`

Finally, you need to edit the visudo file, specifically the line referring to wheel should be uncommented as shown in the image below.

It opens in VI editor by default. So we need to force it use nano:

`EDITOR=nano visudo`
![](https://itsfoss.com/content/images/wordpress/2022/05/visudo-800x273.png)
Save the changes and exit from this file.

## Step 11: Install a desktop environment (GNOME in this case)
The first step is to install the X environment. Type the below command to install the Xorg as display server along with the network manager. You can refer to the official documentation for Wayland.

`pacman -S xorg networkmanager`

Now, you can install GNOME desktop environment on Arch Linux using:

`pacman -S gnome`

The last step includes enabling the display manager GDM for Arch. I also suggest enabling Network Manager

```
systemctl enable gdm.service
systemctl enable NetworkManager.service
```

Now exit from chroot using the exit command:


`exit`

Finally, unmount the root partition using the following command:

`umount /mnt`

Or,

`umount -l /mnt`

And then shut down your system

`shutdown now`

Don’t forget to take out the live USB before powering on the system again. If everything goes well, you should see the Grub screen and then the GNOME login screen.

## Final Words on Arch Linux installation

You might have realized by now that installing Arch Linux is not as easy as installing Ubuntu. However, with a little patience, you can surely accomplish it and then tell the world that you use Arch Linux.

Arch Linux installation itself provides a great deal of learning. I recommend a few essential things to do after installing Arch Linux where you’ll find steps to install various other desktop environments (if you didn’t install it here) and learn more about the OS.

You can keep playing with it and see how powerful Arch is.

Let us know in the comments if you face any difficulty while installing Arch Linux.