---
layout: page
title: Resume
permalink: /cv/
---

## Personal Information
* * *

- GitHub: [cybernagle](https://www.github.com/cybernagle)
- Twitter: [@cybernagle](https://twitter.com/cybernagle)
- BiliBili: [Knowledge Sharing](https://space.bilibili.com/250682464)
- **zhang.nlage@gmail.com**



## Quick Overview
* * *

Profile Skilled DevOps Engineer with
- Over 10+ years of experience
- Open source contributor
- Lifelong learner and sharer

## Company Timeline View

* * *
#### SAP (Kubernetes ,Devops Engnieer, Data Scientist) 2019.12 - Current

***Keyword: Open Source, Software Engineering, Low Level Coding***

  - Integrate kfp(kubeflow pipeline) sdk support CI/CD kubeflow pipeline on jenkins.
  - Implement multi-tenant training platform(kubeflow) base on kubernetes. onboarded 100+ internal team.
  - Re-implement oAuth for kubeflow platform, and contribute solution back to community.
  - Design Infrastructure as Code for team by using helm & argoCD.
  - Desing & Implement Queueing System on kubernetes in a cloud native way.(kqueue+pytorchjob)

#### Seedlink (Public Cloud, Devops Engineer) 2019.06 - 2019.12

***Kyeword: Learn from Failure, Consolidate***

  - Dockerlize all the service, design service Arch.
  - Refactoring CI/CD workflow by using Jenkins.(follow ![moby](https://github.com/moby/moby/blob/19.03/Jenkinsfile) workflow)
  - Almost refactoring all the ansible code for provision and deploy.
  - Apply terraform in team to support AWS operation.
  - Integrated Jenkins with Teams by groovy.

#### Strikingly (Public Cloud, Devops Engineer) 2018.03 - 2019.06

***Keyword: Public Cloud, Infrastructure As Code, A Stable world***

  - maintain fully automated CI/CD pipelines for code deployment using gitlab-ci. 
  - Maintain infrastructure on AWS by terraform.  
  - Automated instance provision by shell and ansible. 
  - Develop lambda on AWS for cronjobs by python/golang. 
  - Setup monitoring system. Use prometheus, grafana and elasticsearch. 
  - Mantain game k8s production on tencent Cloud. 
  - Setup data pipeline,which scrap data from eos to elasticsearch by using python and AWS lambda. 

#### eHi Car Rental Service(Private Cloud, DevOps Enginner) 2015.07 - 2018.03 

***Keyword: Private Cloud, Manually Operation, Scripting, Analsis***

  - Setup Elastic stack(Elasticsearch+Logstash+Kibana) for log analysis. 
  - Automated extract daily data from elasticsearch by using python. 
  - Using ElasticAlert to monitoring production log.  
  - Maintain Zabbix/Cacti/Piwik system for problem analysis. 
  - Translate Elastlaert document from English to Chinese. 
  - Reduce problem detecting and solving time from 1 hour to 5 minutes by using alert and log. 
    
#### Power Dekor Floor factory ( IT Help Desk Support, Manager)  2012.02 - 2015.06 

***Keyword: Cooperate, Comminunication***

  - Build network for office which support 100+ clients.  
  - Troubleshoting with network traffics. 
  - Manage IT depatment, wrote weekly report. 
  - Wrote powerpoint report for CEO. 

## Project View

***

### Side Project
- [proconfig generator](https://github.com/cybernagle/proconfig-generator) for MyShell community
- [cs videos](https://space.bilibili.com/250682464) which implement by [manim(in python)](https://github.com/cybernagle/cs-videos)
- [binary bomb guide](https://github.com/cybernagle/Binary-Bomb) for learners who internested in CSAPP, also the [videos](https://space.bilibili.com/250682464/lists/1498508?type=season)

### Main Project

#### 2022 - 2025(current) Platform served for Data Scientist Train,Fine-Tunning & Deploy models.

Key Components:
- Kubeflow
- Kueue
- oAuth2
- Hashicorp Vault
- Jenkins

Support Developer/Data Engineer/Data Scientist onboarding their project by pull request on github. and hashicorp manage sensitive date.
Kubeflow(pipeline,notebook etc) support user to debug & train & deploy their traing code & manifests.

#### 2019.12 - 2021.6 CI/CD System Enhancement

Jenkins Shared Library for Monitoring Jenkins pipeline execution time

  - jenkins shared library(groovy)
  - grafana
  - influxdb

A unified CI/CD system writen by jenkins pipeline & groovy , most part are groovy.   
using groovy to do data extraction , put it on influxdb. and analysis on grafana.   

#### 2018.3 - 2019.12 Infrastructure Management System

  - AWS vpc/peering/ec2/s3/dynamodb/auto-scaling/security group/ami and so on
  - Elasticsearch
  - Docker
  - AWS lambda
  - Terraform
  - Ansible
  - Jenkins

Using ansible to do system provisioning on ec2 by using cloud init.   
terraform build vpc, nat gateway, security group, auto scaling group.  
provisioning system by using ansible. the ansible include three step: [bootstap, provisioning app environment, deploy app]  
bootstap include setup default environment.   
provision app environment it's about setup application spefic package, and environment.  
deploy application, is to run container on ec2, and this part can be reused by CD system.  
Using jenkins to do CI/CD.  

#### 2015.7 - 2018.3 Monitoring System

  - Elasticsearch, Kibana , Logstash
  - Elastalert
  - Cerebro

Pain point: The system got 500 more instances, both include windows & linux.  
What we have done: we need a good tool to extract logs from each and to do analysis instead of pull logs from instance directly and analysis by labtop.  
Using Elasticsearch & Kibana (version 3), nxlog is try to extrat the log from windows server , and push to logstash. we defined the rule of log format on logstash. then push it directly to elasticsearch.  
For es management part, we are using cerebro. to track if the es stauts is red or not. and how replicas works.  
For alerting part, we are using elastalert. it's just using yaml to send alert to lot of channels. include wechat.    
 
## Skills 
* * *
  - Kubeflow Platform. 
  - Terraform for infrastructure manage. 
  - Configuration and automated by ansible. 
  - Kubernetes application management.
  - Git for version control 
  - Jenkins & Argocd for integration and deploy.
  - Golang/Python/Groovy development. 
  - Strong experience with public cloud. (AWS/Ali cloud/Tencent Cloud). 
  - Docker. 
  - Windows Server / Linux Server Mangement. 
  - Elastic stack / Piwik / prometheus / Zabbix / Cacti 
  - Language: English/中文 

## Education 
* * *
  2012  Computer application and technology 2009 - 2012 



