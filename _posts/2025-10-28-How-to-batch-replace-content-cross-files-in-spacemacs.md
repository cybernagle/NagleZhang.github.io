---
title: "[ Exp ] How to batch replace content across multiple files in Spacemacs?"
subtitle: "「笔记」"
layout: post
author: "NagleZh"
header-style: text
lang: zh
---

# 当内容在多个文件当中存在的时候, 如何批量修改? 

首先, 使用 projectile-ag 用来查找所有的内容, 命令如下: 

SPACE-/

随后, 超找的内容会形成一个 buffer, 接下来, 可以使用 `C-c C-e` 来打开对应的 buffer. 

在 buffer 里面, 我们就可以使用对应 regex 来进行替换.

最后, 使用 `C-c C-c` 来保存, 即可. 
