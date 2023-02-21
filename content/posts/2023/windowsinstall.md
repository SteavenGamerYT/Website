---
title: "How to create bootable Windows 10 USB install media"

date: 2023-02-21
url: /create-bootable-usb-windows-10
image: images/2023/create-bootable-usb-windows-10/windows-10-create-bootable-usb-hero.webp
categories:
  - Windows
tags:
  - Windows
  - Windows 10
draft: false
---
You can create a bootable Windows 10 USB flash drive with multiple tools, and in this guide, I’ll show you how. When a new version of Windows 10 becomes available, not everyone gets the latest release on the same day. Instead, Microsoft upgrades computers gradually, taking some time until the new version reaches every device.

However, if you do not want to wait for the automatic upgrade, the company lets you download the Windows 10 (version 22H2, 21H2, and older releases) installation files using the Media Creation Tool. The tool helps perform an in-place upgrade or create a bootable installation media using a USB flash drive to perform a clean install. Furthermore, you can even use third-party tools like Rufus to download and create a bootable media to install Windows 10 from USB.

This guide will teach you how to create a USB flash drive to upgrade or reinstall Windows 10 on different devices using the Media Creation Tools and Rufus.

## Create Windows 10 bootable USB from Media Creation Tool
To create a bootable USB of Windows 10, use these steps:
1. Open Microsoft website.
2. Under the “Create Windows 10 installation media” section, click the “Download tool now” button.
3. Double-click the MediaCrationToolxxxx.exe file to launch the tool.
4. Click the Accept button.
5. Select the “Create installation media (USB flash drive, DVD, or ISO file) for another PC” option.
![](/images/2023/create-bootable-usb-windows-10/media-cration-tool-usb-other-pc_.webp)
6. Click the Next button.
7. Click the Next button again.

**Quick note: If you are about to create a Windows 10 USB for another device, clear the “Use the recommended options for this PC” option to select the correct language, architecture, and edition as necessary.**
![](/images/2023/create-bootable-usb-windows-10/mct-language-32-64-edtion_.webp)
8. Select the “USB flash drive” option to create the bootable USB installation media.
![](/images/2023/create-bootable-usb-windows-10/usb-media-creation-tool-windows-10_2020.webp)
9. Click the Next button.

10. Select the USB flash drive from the list, but ensure it doesn’t have any important files, as this process will erase everything on it.

11. Click the Finish button.

## Create Windows 10 bootable USB from Rufus
To use Rufus to create a bootable media to install Windows 10 from USB on UEFI or BIOS computers, use these steps:
1. Open Rufus’ website.
2. Under the “Download” section, click the link to download the latest version.
3. Double-click the executable to launch the tool.
4. Click the Settings button a the bottom of the page (the third button from the left).
5. Under the “Settings” section, use the “Check for updates” drop-down menu and select the Daily option.
6. Click the Close button.
7. Click the Close button again to close the app.
8. Reopen the Rufus tool.
9. Under the “Device” section, use the drop-down menu, and select the USB flash drive to create the bootable media.

**Quick tip: You need to connect a USB flash drive with at least 8GB of storage. You may need to restart the tool if you do not see the device on the list.**

10. Under the “Boot selection” section, use the drop-down menu and select the “Disk or ISO image” option.
11. Click the down arrow button on the right and select the Download option.
![](/images/2023/create-bootable-usb-windows-10/rufus-2023-windows-10-iso-download-option.webp)
12. Click the Download button.
13. Select the Windows 10 option.
14. Click the Continue button.
15. Under the “Release” section, select the version of Windows 10 to download, such as version 22H2.
![](/images/2023/create-bootable-usb-windows-10/rufus-download-iso-settings-2022-win10.webp)
16. Click the Continue button.
17. Click the Continue button on the “Edition” setting (since there’s only one option).
18. Select the language for the installation — for example, English.
19. Click the Continue button.
20. Select the x64 (64-bit) operating system architecture. (You may need to download the x86 (32-bit) option if you have an older machine.)
21. Click the Download button.
22. Select the location to save the Windows 10 ISO file.
23. (Optional) Confirm a name for the USB flash drive in the “Volume label” setting.
24. Continue with the default settings after the download.
25. Click the Start button.
![](/images/2023/create-bootable-usb-windows-10/create-windows-10-usb-rufus-2022.webp)
26. (Optional) Skip the install customization settings.
27. Click the OK button.
28. Click the OK button again.


Once you complete the steps, you can boot and install Windows 10 on computers running on UEFI or BIOS, depending on your firmware.

## Walkthrough Video

{{< youtube 11111111 >}}
