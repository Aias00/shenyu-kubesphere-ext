
## Architecture

 ![](https://shenyu.apache.org/img/architecture/shenyu-architecture-3d.png)

## What is the Apache ShenYu?

This is an asynchronous, high-performance, cross-language, responsive API gateway.

## Why named Apache ShenYu

ShenYu (神禹) is the honorific name of Chinese ancient monarch Xia Yu (also known in later times as Da Yu), who left behind the touching story of the three times he crossed the Yellow River for the benefit of the people and successfully managed the flooding of the river. He is known as one of the three greatest kings of ancient China, along with Yao and Shun.

* Firstly, the name ShenYu is to promote the traditional virtues of our Chinese civilisation.
* Secondly, the most important thing about the gateway is the governance of the traffic.
* Finally, the community will do things in a fair, just, open and meritocratic way, paying tribute to ShenYu while also conforming to the Apache Way.

---

## Features

* Proxy: Support for Apache® Dubbo™, Spring Cloud, gRPC, Motan, SOFA, TARS, WebSocket, MQTT
* Security: Sign, OAuth 2.0, JSON Web Tokens, WAF plugin
* API governance: Request, response, parameter mapping, Hystrix, RateLimiter plugin
* Observability: Tracing, metrics, logging plugin
* Dashboard: Dynamic traffic control, visual backend for user menu permissions
* Extensions: Plugin hot-swapping, dynamic loading
* Cluster: NGINX, Docker, Kubernetes
* Language: provides .NET, Python, Go, Java client for API register

---

## Quick Start

After subscribing to and installing this extension component, you can start using it! The default username and password are: admin/123456. It is recommended to change the default password after logging into the system.

### Prerequisites

#### Tools

* [Kubernetes &＆ Kubectl](https://kubernetes.io/docs/setup/)
* [Helm](https://helm.sh/docs/intro/install/)

#### Database

> Before you read this document, you need to complete some preparations before deploying Shenyu according to the [Deployment Prerequisites document](https://shenyu.apache.org/docs/deployment/deployment-before/).

### Add Helm repository

```shell
helm repo add shenyu https://apache.github.io/shenyu-helm-chart
helm repo update
```

### Install

#### Deployment prerequisites

Before reading this document, you need to read [Deployment prerequisites](https://shenyu.apache.org/docs/deployment/deployment-before/) to complete the environment preparation before deploying ShenYu.

#### Instructions

* **Install the application**: By default, both admin and bootstrap are installed.
* **Service Exposure**: Use NodePort to expose the service, the default port is 31095 for admin and 31195 for bootstrap.
* **Database**: Currently supports h2, MySQL, PostgreSQL, Oracle as database. Default is h2.

#### h2 as database

Running the following command will install admin and bootstrap under shenyu namespace and create namespace.

```shell
helm install shenyu shenyu/shenyu -n=shenyu --create-namespace
```

#### MySQL as database

Modify and copy the following command and execute:

```shell
helm install shenyu shenyu/shenyu -n=shenyu --create-namespace \
      --set dataSource.active=mysql \
      --set dataSource.mysql.ip=127.0.0.1 \
      --set dataSource.mysql.port=3306 \
      --set dataSource.mysql.username=root \
      --set dataSource.mysql.password=123456 
```

#### PostgreSQL as database(Version of ShenYu > 2.5.0)

Modify the following command and copy it to execute:

```shell
helm install shenyu shenyu/shenyu -n=shenyu --create-namespace \
      --set dataSource.active=pg \
      --set dataSource.pg.ip=127.0.0.1 \
      --set dataSource.pg.port=5432 \
      --set dataSource.pg.username=postgres \
      --set dataSource.pg.password=123456
```

#### Oracle as database

Modify the following command and copy it to execute:

```shell
helm install shenyu shenyu/shenyu -n=shenyu --create-namespace \
      --set dataSource.active=oracle \
      --set dataSource.oracle.ip=127.0.0.1 \
      --set dataSource.oracle.port=1521 \
      --set dataSource.oracle.serviceName=shenyu \
      --set dataSource.oracle.username=root \
      --set dataSource.oracle.password=123456
```

---

## Mind map

 ![](https://shenyu.apache.org/img/shenyu/activite/shenyu-xmind.png)

---
