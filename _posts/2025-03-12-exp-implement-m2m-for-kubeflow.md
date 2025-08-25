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
kubernetes 的 service account 的 token 是签发者是谁，token 当中带的信息是什么。

而 kubectl 可以通过 -raw 来直接与 api 交互。
这样，我们通过 openid 路由就可以获取到  jwks uri 
```shell
kubectl get --raw  /.well-known/openid-configuration
```

其会返回如下信息: 
```json
{"issuer":"$domain","jwks_uri":"$domain:443/openid/v1/jwks","response_types_supported":["id_token"],"subject_types_supported":["public"],"id_token_signing_alg_values_supported":["RS256"}
```

如果内部解析工作不顺利的情况下, 我们可以硬编码 jwks 的信息. 
即, 通过 jwks_uri, 我们就可以执行如下命令: 
```shell
kubectl get --raw /openid/v1/jwks 
```
得到如下格式
```
{"keys":[{"use":"sig","kty":"RSA","kid":"hash","alg":"RS256","n":"hash","e":"blabla"}]}
```

通过 jwks 以及以及从 token 中获取到的信息，就可以创建 request auth 

这样, 我们添加成如下的 authorization policy ，就可以解决这个问题了。
```
apiVersion: security.istio.io/v1
kind: RequestAuthentication
metadata:
  name: ${name}
spec:
  jwtRules:
  - forwardOriginalToken: true
    issuer: '{issuer_obtained_upon}'
    jwks: '${jwks_info_obtained_upon}'
    outputClaimToHeaders:
    - claim: sub
      header: add-to-customize-header
  selector:
    matchLabels:
      istio: ingressgateway

```
