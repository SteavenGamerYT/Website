---
title: "How to fix not enough ram error in some games"

date: 2024-02-25
url: /games/
image: images/2023-thumbs/my-first-post.jpg
categories:
  - Linux
tags:
  - Steam
  - Games
draft: false
---

So some Games wont run and will give not enough memoery

like Hogwarts legacy or the finals

To fix that add `vm.max_map_count=2147483642` to `/etc/sysctl.d/90-override.conf`, then run `sudo sysctl -w vm.max_map_count=2147483642  `