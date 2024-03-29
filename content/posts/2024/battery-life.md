---
title: "How to Improve Battery Life on Linux"

date: 2024-02-25
url: /battery-life/
image: images/2024/battery-life.avif
categories:
  - Linux
tags:
  - Battery
  - Battery Life
draft: false
---

## Battery Life
So at first, most distros ship with `power-profiles-daemon`.

This app is good for changing profiles but doesn't give you the best battery life, so we can remove it by running:

`sudo pacman -Rns power-profiles-daemon` 

`sudo apt purge power-profiles-daemon`

`sudo dnf remove power-profiles-daemon`

Now we can install TLP, by running:

`sudo pacman -S tlp`

`sudo apt install tlp`

`sudo dnf install tlp`

Now configure TLP:

```sh
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket
sudo systemctl mask power-profiles-daemon.service
sudo systemctl enable --now tlp
sudo tlp start
```

Now you can have better battery life, it will last longer after charging. This doesn't improve battery health though

## Battery Health

To get better battery health:

Run: `ls /sys/class/power_supply/BAT0/`

If you have `charge_control_end_threshold` then you can continue, if not then consider getting a better laptop.

Create a custom service to set the battery maximum charge to 80%:

`sudo nano /etc/systemd/system/battery_charge_threshold.service`

```sh
[Unit]
Description=Set the battery charge threshold
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/bin/bash -c 'echo 80 > /sys/class/power_supply/BAT0/charge_control_end_threshold'

[Install]
WantedBy=multi-user.target
```

```sh
sudo chmod 644 /etc/systemd/system/battery_charge_threshold.service
sudo systemctl daemon-reload
sudo systemctl enable battery_charge_threshold.service --now
```
