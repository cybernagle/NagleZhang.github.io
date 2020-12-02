---
title: "[ Read ] 最小二乘法的认识"
subtitle: "「笔记」"
layout: post
author: "NagleZh"
header-style: text
lang: zh
tags:
  - 笔记
---

# 最小二乘法

存在一些离散的值，举例来说，在二位坐标系上的一些点。其中存在一条线举例所有点的直线距离之和最小。  
这样的情况下，我们可以利用最小二乘法来进行近似运算。  

假设说上面的坐标系当中的每一个点是 y， 而我们需要用来进行预测的线可以用 f(x) 来进行表示。  
那么，我们需要做到的就是 `sum(| f(x)-yi |)` 最小。在数学公式当中，使用绝对值符号不是特别方便，所以使用 `sum((f(x) - yi)^2)` 的形式来进行表现。  

这个时候，设计到一个导数计算，当导数为零时，则以上公式 `sum((f(x) - yi)^2)` 最小， `2 * sum( f(x) - yi ) = 0`  
根据上面的公式，就可以进一步的去做运算。

最小二乘法实际上就是去找一条线，和现有的数据集的距离最近。 这条线有可能是一条直线，有可能是一条曲线，而这条曲线，实际上就是 `f(x)` 这个函数所描述的。而平均数，实际上就是最小二乘法的一种特例。  

参考：   
最小二乘法的本质是什么？ - 马同学的回答 - 知乎  
https://www.zhihu.com/question/37031188/answer/411760828