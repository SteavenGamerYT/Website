---
title: "How to install Windows 7 Manual"

date: 2023-02-24
url: /how-to-install-windows-7-manual
image: images/2023/windows7.png
categories:
  - Windows
tags:
  - Windows
  - Windows 7
featured: true
---

<!--more-->
## Introduction


So in order to install it you need


## Requirements


Hiren BOOT cd PE ISO


Windows 7 AUG 2018 ISO



## installtion


TO INSTALL follow this steps or video


## STEP 1

boot to herin boot cd 


## STEP 2

locate the windows 7 iso letter


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


## STEP 6 (Bypass OOBE) (optional) (Breaks AMD Systems)


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

{{< youtube H303Qb6RLFI >}}