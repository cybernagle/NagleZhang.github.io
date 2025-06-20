---
title: "[ Exp ] Authentication Finally failed when change Opensearch Admin Password."
subtitle: "「笔记」"
layout: post
author: "NagleZh"
header-style: text
lang: zh
---

# How to Change the Admin Password for an OpenSearch Cluster Created by the OpenSearch Operator?

OpenSearch has introduced a new product called `opensearch-k8s-operator`. With this product, we can create an OpenSearch cluster simply by using the OpenSearchCluster CR.

Correspondingly, the OpenSearch Operator also provides a [Helm chart for users](https://github.com/opensearch-project/opensearch-k8s-operator/tree/47366515f75bd9cb4e21fbd126000ff0001d0bd4/charts/opensearch-cluster).

The steps for launching a managed OpenSearch cluster are as follows:
1. Bootstrap
2. Master node launch
3. Security node
4. Data node

This article discusses a specific issue related to changing the admin username and password. In the Helm chart mentioned earlier, the default username and password are `admin/admin`. Once the cluster is launched, the default password will need to be changed.

There is a pitfall in this process: the `adminCredentialsSecret` in `opensearchclusters.opensearch.opster.io` is only used to configure the admin credentials for client-to-server access. It does not modify the admin username and password in the OpenSearch security database itself.

To change it, two steps are required:
1. Modify the password in the security database.
2. Configure the client access password.

The order of steps 1 and 2 cannot be reversed. If step 2 is executed first, all nodes will fail to communicate with each other, resulting in the error `Authentication finally failed`. The reasons are as follows:

- `adminSecrets` is only used to configure the credentials for inter-node communication. However, setting its content or password does not directly modify the database where the password is stored.
- The first step is to locate `internal_users.yml`, which is stored in the [securityConfigSecret](https://github.com/opensearch-project/opensearch-k8s-operator/blob/47366515f75bd9cb4e21fbd126000ff0001d0bd4/charts/opensearch-cluster/values.yaml#L270C1-L271C1) defined in the `OpensearchCluster`.
- The default value of this secret can be found on [GitHub](https://github.com/opensearch-project/opensearch-k8s-operator/commit/50ad826a93ba47e746677aecdc7c7ee59eb30377#diff-f43c5e50c5d98865125e2e79cbf7454d8a3dc553801a50fb41ef995a235334db).
- Modify the value of `internal_users.yml`. You will find that the secrets are generated using a one-way hash. The method for generating this hash is described in the next step.
- In the content of `internal_users.yml`, the password needs to be a hash value. At this point, you need the `hash.sh` script from OpenSearch Security. Run `hash.sh`, input the password, and you will get the hash value.
- The `hash.sh` script mentioned earlier can be found on any node at the following path: `/usr/share/opensearch/plugins/opensearch-security/tools/hash.sh`.
- Store this hash in the `internal_users.yml` file as shown below:

```yaml
internal_users.yml: |-
  _meta:
    type: "internalusers"
    config_version: 2
  admin:
    hash: "$2y$12$lJsHWchewGVcGlYgE3js/O4bkTZynETyXChAITarCHLz8cuaueIyq"
    reserved: true
    backend_roles:
    - "admin"
    description: "Demo admin user"
```

- Subsequently, OpenSearch will start a security job to update the user account and password database.
- At this point, modify the cluster admin credentials to your target values, i.e., execute step 2: `Configure the client access password`.

# Opensearch Operator 创建的 Opensearch instance 如何修改其 admin password ? 
Opensearch 出了一款新的产品叫做 opensearch-k8s-operator, 通过这款产品, 我们仅仅需要使用 OpenSearchCluster CR 即可创建 opensearch cluster. 

相应的, Opensearch Opeartor 也提供给了 [helm chart 供用户使用](https://github.com/opensearch-project/opensearch-k8s-operator/tree/47366515f75bd9cb4e21fbd126000ff0001d0bd4/charts/opensearch-cluster).

其托管启动的 opensearch cluster 步骤如下: 
1. bootstrap 
2. master node launch 
3. security node 
4. data node. 

本文谈论的是一个具体的账户名密码修改的问题, 在前文所述的 helm chart 当中, 其默认的账户密码, 是 admin/admin , 当我们启动了以后, 默认密码会面临修改.   
修改存在一个坑 --> “opensearchclusters.opensearch.opster.io 中的 adminCredentialsSecret 这个仅仅是用于配置 client 访问 server 时候的 admin credentials. 而并非修改 opensearch 本身 security 数据库当中的 admin 的账户名密码.   

要修改它, 那么需要做两件事情: 
1. 修改 security 数据库的密码
2. 配置 client 访问的密码.

上面 1,2 的顺序不可以相反, 如果先执行 2 , 那么会导致所有的 Node 无法相互通信, 从而产生 `Authentication finally failed` 的问题.原因如下: 

 - adminSecrets 仅仅是用于配置相互访问的 credentials , 但是设置它的内容, 或者说密码的数据库, 并不能直接被它修改. 
 - 第一步要做的事情是, 找到 interlal_users.yml, 这个会存储在 `OpensearchCluster` 当中定义的 [securityConfigSecret](https://github.com/opensearch-project/opensearch-k8s-operator/blob/47366515f75bd9cb4e21fbd126000ff0001d0bd4/charts/opensearch-cluster/values.yaml#L270C1-L271C1) 当中. 
 - 这个 secrets 默认值, 请参考[github](https://github.com/opensearch-project/opensearch-k8s-operator/commit/50ad826a93ba47e746677aecdc7c7ee59eb30377#diff-f43c5e50c5d98865125e2e79cbf7454d8a3dc553801a50fb41ef995a235334db)
 - 将 internal_users.yaml 的值修改掉. 你会发现这个 secrets 是one way hash 生成的, 生成方法在下一步.
 - internal_users.yaml 的内容当中, password 需要是一个 hash 值, 这个时候, 就需要 opensearch security 当中的 hash.sh 这个脚本, 运行改 hash.sh , 输入密码, 我们就得到了 hash 值.
 - 前面提到的 hash.sh 可以在任意 node 的下面路径当中找到: /usr/share/opensearch/plugins/opensearch-security/tools/hash.sh 
 - 将这个 hash 存放在 internal_users.yml 的这个文件当中. 如下
 ```yaml
      internal_users.yml: |-
        _meta:
          type: "internalusers"
          config_version: 2
        admin:
          hash: "$2y$12$lJsHWchewGVcGlYgE3js/O4bkTZynETyXChAITarCHLz8cuaueIyq"
          reserved: true
          backend_roles:
          - "admin"
          description: "Demo admin user"Add comment
 ```
 - 随后, opensearch 会启动 security job 来更新 user 账号密码数据库. 
 - 这个时候, 再将 cluster admin credential 修改成我们的目标值. 也就是, 执行第 2 步: `配置 client 访问的密码`

