---
title: "[ Read ] 新年的第一篇工作日志, 最近工作的一些态度与总结"
subtitle: "「随想」"
layout: post
author: "NagleZh"
header-style: text
lang: zh
tags:
  - 笔记
---


# 新年的第一篇 

最近工作中最多的事情，写代码的任务量少，更多的是去阅读开源的一些产品。  

在重 jenkins 的项目当中，很多项目都是没有文档的，所以使用者必须要从各个 plugin 当中去找到对应的每一个 class 的使用方法，以及逻辑。 这样在创建项目过程当中，才能够更加的稳妥。  

这几天主要阅读的项目叫做 jcasc， jenkins configuration as code。 代码量不大，但是确实也存在一些不能满足需求的地方，只能通过直接拿到类来进行操作。jcasc 的产品的 config 管理都在统一的一个类里面管理，叫做 CasCGlobalConfig，当一开始我没有了解到这一点的时候，在它的主类里面（ConfigurationAsCode) ，找了半天，也没有找到对 config 操作的一个配置。  
无奈考虑到放弃的时候，在 jelly 的代码当中，发现了一个路径，进而才发现了这个 casc 的 global config 类。当有了这个发现的时候，上午的时间已经过去了。  
所以阅读代码的时候，按图索骥比遍历的这个过程效率是要高一些的。  
但是这也不意味着说，遍历整个类的实现就没有价值，这个起码会帮你对整个设计有一个简单的概念形成。  

还有一件事情就是昨天晚上准备做一下一本书的阅读方法的视频。大概录制了几十个视频，没有一个令我满意的。（这是一件很沮丧的事情）  
我觉得这个跟我的心态有关系，我跟自己说，周三是录制视频的时间，那么周三下班之后，处理完晚餐，就可以开始视频的录制了。这个时候，我的心态，更多的是，去完成一个任务。这种心态，或者说动机，让我完全理清不了思路。  
这个是不对的！  
我制作视频的初衷，是将一个复杂的概念，让人更加简单的去学习，或者理解。  
而这个整理的过程，也是自我学习的一个过程。如果我抱着去完成制作视频任务的这样一个心态（动机），那么我就完全不知道要输出什么样的内容。  
这是我的问题，也是我需要调整和提醒自己的地方。  


第三件事情，就是备考机器学习证书的这个事情（本周六）。

以上。
