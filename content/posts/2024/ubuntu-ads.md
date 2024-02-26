---
title: "Ubuntu apt ads"

date: 2024-02-25
url: /ubuntu-apt-ads/
image: images/2024/ubuntu-pro-ads.jpg
categories:
  - Linux
tags:
  - Ubuntu
draft: false
---

So are you tired of ubuntu apt ads?

Just disable them

```sh
sudo pro config set apt_news=false
mkdir -p relocated_apt
sudo mv /etc/apt/apt.conf.d/20apt-esm-hook.conf ~/relocated_apt/.
```