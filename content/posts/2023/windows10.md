---
title: "Windows 10"

date: 2023-02-19
url: /windows10
image: images/2023/windows10.jpg
categories:
  - Windows
tags:
  - Windows 10
draft: false
---

<!--more-->
## Introduction


**Windows 10** ***SUCKS*** get **LINUX**.


YES THIS HOW I GET ***WINDOWS*** ON ***LINUX*** pls do it


## Requirements


Virt Manager and KVM


Supported VMs CPU


Windows 10 ISO


## installtion


TO INSTALL follow this steps or video later adding text


## STEP 1

boot to Windows 10 installer


## STEP 2

locate the windows 10 iso letter


## STEP 3 (DISKPART)

DISKPART in cmd


```
diskpart
sel disk 0
clean
convert gpt
create part efi size=512
foramt fs=fat32
ASSIGN letter=h
create part pri
format quick
ASSIGN letter=C
exit
```


## STEP 4 (DISM)

Use Dism to apply the Image


`DISM.exe /Apply-Image /ImageFile:install.wim /Index:1 /ApplyDir:C:\`


## STEP 5 (BCDBOOT)

Use Bcdboot to create boot files


`bcdboot c:\windows /s h: /f UEFI`


## STEP 6 (Bypass OOBE) (optional)


open regedit and load `C:\windows\system32\config\system` as sys


go to `Computer\HKEY_LOCAL_MACHINE\SYSTEM\Setup`


make Cmdline to `cmd.exe`


restart and now cmd should start


make user


```
net user SteavenGamerYT /add
net localgroup users SteavenGamerYT /add
net localgroup administrators SteavenGamerYT /add
```


now open `regedit` and do as the video adding text later


## Walkthrough Video

{{< youtube HyRo2WMWwzQ >}}