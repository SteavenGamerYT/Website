---
title: "How to Set Super key to Ulancher on gnome"
date: 2024-04-04
url: /how-to-set-super-key-to-ulancher-on-gnome/
image: images/2023-thumbs/my-first-post.jpg
categories:
  - Linux
tags:
  - Ubuntu
  - Arch
  - Fedora
draft: false
---

If you're a GNOME user and love using Ulauncher for quick app launches and searches, you might find it convenient to assign a specific key to launch Ulauncher. By default, the super key (also known as the Windows key) is often utilized for various system functions. However, with a few simple commands, you can reassign the super key to launch Ulauncher seamlessly.

Firstly, open your terminal and enter the following commands:

```bash
CKBPATH=org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings
gsettings reset org.gnome.mutter overlay-key
gsettings reset-recursively $CKBPATH/ulauncher/
gsettings set org.gnome.mutter overlay-key ''
gsettings set $CKBPATH/ulauncher/ name 'ulauncher'
gsettings set $CKBPATH/ulauncher/ command 'ulauncher-toggle'
gsettings set $CKBPATH/ulauncher/ binding 'Super_L'
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ulauncher/']"
```

Explanation of the commands:

`CKBPATH=org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings`: This sets up the path for custom keybindings.

`gsettings reset org.gnome.mutter overlay-key`: This resets the overlay key.

`gsettings reset-recursively $CKBPATH/ulauncher/`: This recursively resets any previous Ulauncher keybindings.

`gsettings set org.gnome.mutter overlay-key ''`: This ensures there is no overlay key set.

`gsettings set $CKBPATH/ulauncher/ name 'ulauncher'`: Sets the name for the Ulauncher keybinding.

`gsettings set $CKBPATH/ulauncher/ command 'ulauncher-toggle'`: Sets the command to launch Ulauncher.

`gsettings set $CKBPATH/ulauncher/ binding 'Super_L'`: Sets the super key (Left) to trigger Ulauncher.

`gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ulauncher/']"`: Adds the Ulauncher keybinding to the custom keybindings list.

Once you've executed these commands, your super key (Left) will now launch Ulauncher whenever pressed. Feel free to adjust the keybindings according to your preference.

Enjoy the convenience of accessing Ulauncher swiftly with just a key press!