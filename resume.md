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

## Summary
* * *

AI Engineer and Platform Architect with 10+ years of experience building production systems.

- Currently focused on **LLM-powered agents**, voice AI, and developer tooling
- Kubeflow community member with contributions to auth, security (CVE fixes), and platform reliability
- Built real-time voice agents in Rust, AI coding agents in Go, and TTS engines from scratch
- Deep infrastructure background: Kubernetes, MLOps platforms serving 100+ teams
- Lifelong learner and educator — OS kernel video series on BiliBili

## Experience
* * *

#### SAP — AI Platform Engineer (Kubeflow, MLOps)  2019.12 - Present

***Keywords: Open Source, MLOps, AI Platform, Kubernetes***

- Architected and maintained a multi-tenant ML training platform serving 100+ internal teams, built on Kubeflow, Kubernetes, and Kueue.
- Designed the platform's OAuth2 authentication layer and contributed the solution back to the Kubeflow community (kubeflow/manifests PRs #2884, #2862, #2656).
- Built Infrastructure as Code pipelines using Helm and ArgoCD for reproducible deployments.
- Designed and implemented a Kubernetes-native queueing system (Kueue + PyTorchJob) for GPU resource scheduling.
- Contributed security fixes to Kubeflow Pipelines: SSRF prevention (CVE-2023-6570, PR #13126), SQL injection fix (PR #13127), and gRPC configuration improvements (PR #12438).
- Integrated kfp-sdk with Jenkins CI/CD, enabling data scientists to deploy ML pipelines via pull request.

#### Seedlink — DevOps Engineer  2019.06 - 2019.12

***Keywords: Cloud Architecture, CI/CD, Docker***

- Dockerized all services and designed the service architecture.
- Refactored CI/CD workflow using Jenkins (following the Moby project pattern).
- Rebuilt Ansible provisioning and deployment automation.
- Integrated Terraform for AWS infrastructure management.

#### Strikingly — DevOps Engineer  2018.03 - 2019.06

***Keywords: Public Cloud, Infrastructure as Code, Monitoring***

- Maintained fully automated CI/CD pipelines (GitLab CI).
- Managed AWS infrastructure with Terraform (VPC, auto-scaling, security groups).
- Built monitoring stack with Prometheus, Grafana, and Elasticsearch.
- Developed AWS Lambda functions in Python/Go for scheduled data pipelines.
- Maintained production Kubernetes cluster on Tencent Cloud.

#### eHi Car Rental — DevOps Engineer  2015.07 - 2018.03

***Keywords: Private Cloud, Log Analytics, Monitoring***

- Built Elastic Stack (ELK) for centralized log analysis across 500+ instances.
- Automated daily data extraction with Python; reduced incident detection time from 1 hour to 5 minutes.
- Implemented ElastAlert for real-time production monitoring.
- Translated ElastAlert documentation from English to Chinese for the community.

#### Power Dekor — IT Manager  2012.02 - 2015.06

***Keywords: Network Engineering, Team Management***

- Designed and maintained corporate network supporting 100+ clients.
- Managed IT department operations and executive reporting.

## Open Source & Projects
* * *

### AI & Agent Projects

- **[Car Agent](https://github.com/cybernagle/car-agent)** (Private) — Real-time voice-interaction AI agent for in-car scenarios. Built with Rust (core agent + relay server), iOS (SwiftUI client), integrated with LLM providers, TTS (Kokoro), and STT (FunASR streaming). Features WebSocket-based relay, tool orchestration, and terminal streaming viewer.
- **[Cos](https://github.com/cybernagle/cos)** — AI Coding Agent implemented in Go with Bubbletea TUI. Full-featured terminal-based coding assistant.
- **[Kokoros](https://github.com/cybernagle/Kokoros)** — Kokoro TTS engine re-implemented in Rust for real-time, high-quality text-to-speech. Optimized for low-latency inference.
- **[OptiTranslate](https://github.com/cybernagle/OptiTranslate)** — macOS menu-bar AI translator (Swift). Opt+Space to translate selected text, saves results to Markdown.
- **[FingerSaver](https://github.com/cybernagle/fingersaver)** (Private) — Multi-agent terminal manager. Split-pane TUI for orchestrating multiple coding agents simultaneously.

### Kubeflow Community Contributions

- **Security:** Fixed SSRF vulnerability CVE-2023-6570 in Kubeflow Pipelines ([PR #13126](https://github.com/kubeflow/pipelines/pull/13126)), SQL injection prevention ([PR #13127](https://github.com/kubeflow/pipelines/pull/13127))
- **Platform:** gRPC max_receive_message_length configuration ([PR #12438](https://github.com/kubeflow/pipelines/pull/12438)), pipeline version bug fix ([PR #10268](https://github.com/kubeflow/pipelines/pull/10268))
- **Auth:** OAuth2Proxy documentation and Istio envoy filter chain fixes ([manifests PRs #2884, #2656](https://github.com/kubeflow/manifests))
- **Member:** [Kubeflow community member](https://github.com/kubeflow/community/blob/master/memberlist.yaml)

### CS Education

- **[CS Videos](https://github.com/cybernagle/cs-videos)** — Operating systems and computer science video series on [BiliBili](https://space.bilibili.com/250682464). Topics include kernel internals, memory management, API Gateway design, eBPF, HTTPS internals, and universal hashing. Implemented with Manim (Python).
- **[Binary Bomb Lab Guide](https://github.com/cybernagle/Binary-Bomb)** — Walkthrough for CSAPP's binary bomb exercise, with companion video series.

## Technical Skills
* * *

- **Languages:** Rust, Go, Python, Swift, Groovy, Shell
- **AI/ML:** LLM Integration, Agent Orchestration, Prompt Engineering, PyTorch, Kubeflow Pipelines, TTS/STT Systems
- **Platform:** Kubernetes, Docker, Helm, ArgoCD, Terraform, Ansible, Jenkins
- **Cloud:** AWS, Alibaba Cloud, Tencent Cloud
- **Observability:** Prometheus, Grafana, Elasticsearch, Kibana, ElastAlert
- **Languages:** English (fluent), 中文 (native)

## Education
* * *

- 2012 — Computer Application and Technology (2009 - 2012)
