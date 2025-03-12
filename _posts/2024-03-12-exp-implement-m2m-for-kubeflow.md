---
title: "[ Exp ] 在 kubeflow 实现机器间通信及验证"
subtitle: "「笔记」"
layout: post
author: "NagleZh"
header-style: text
lang: zh
---

kubeflow 本身使用的 istio ingress gateway 来进行验证
本质上使用的是 JWT Token

而在 k8s 当中，本身的 auth 就是使用的 jwt 

那么，我们就可以复用 kubeflow 的验证，需要理解的，是知道
kubernetes 的 token 是签发者是谁，token 当中带的信息是什么。

而 kubectl 可以通过 -raw 来直接与 api 交互。
这样，我们通过 openid 路由就可以获取到  jwks uri 

通过 jwks 以及以及从 token 中获取到的信息，就可以创建 request auth 

再添加上 authorization policy ，就可以解决这个问题了。