## 架构图

![](https://shenyu.apache.org/img/architecture/shenyu-architecture-3d.png)

## 什么是 Apache ShenYu

这是一个异步的，高性能的，跨语言的，响应式的 API 网关。

## 为什么叫 ShenYu

ShenYu(神禹)是中国古代君主夏禹(后世亦称大禹)的尊称，他留下了三渡黄河造福人民并成功治理黄河洪水的感人故事。他和尧、舜一起被认为是中国古代三大帝王之一。

- 首先，ShenYu 这个名字是为了弘扬我们中华文明的传统美德。
- 其次，对于网关来说最重要的是流量管理。
- 最后，社区将以公平、公正、公开、择优的方式做事，在向神禹致敬的同时，也符合 Apache Way。

## 特点

- 代理：支持 Apache Dubbo，Spring Cloud，gRPC，Motan，SOFA，TARS，WebSocket，MQTT
- 安全性：签名，OAuth 2.0，JSON Web 令牌，WAF 插件
- API 治理：请求、响应、参数映射、Hystrix、RateLimiter 插件
- 可观测性：跟踪、指标、日志记录插件
- 仪表板：动态流量控制，用户菜单权限的可视化后端
- 扩展：插件热插拔，动态加载
- 集群：NGINX、Docker、Kubernetes
- 语言：提供.NET，Python，Go，Java 客户端用于 API 注册

---

## 快速开始

订阅并安装此扩展组件后 ，即可开始使用！

### 先决条件

#### 工具

- [Kubernetes &＆ Kubectl](https://kubernetes.io/zh-cn/docs/setup/)
- [Helm](https://helm.sh/zh/docs/intro/install/)

#### 数据库

> 在阅读本文档前，你需要先阅读[部署先决条件](https://shenyu.apache.org/zh/docs/deployment/deployment-before)文档来完成部署 shenyu 前的环境准备工作。

### 添加 Helm 仓库

```shell
helm repo add shenyu https://apache.github.io/shenyu-helm-chart
helm repo update
```

### 安装

#### 说明

- **安装应用**：默认同时安装 admin 与 bootstrap。
- **服务暴露**：使用 NodePort 暴露服务，admin 默认端口为 31095, bootstrap 为 31195。
- **数据库**：目前支持 h2, MySQL, PostgreSQL, Oracle 作为数据库。默认使用 h2。

#### h2 作为数据库

运行以下命令，会在 shenyu namespace 下安装 admin 与 bootstrap ，并创建命名空间。

```shell
helm install shenyu shenyu/shenyu -n=shenyu --create-namespace
```

#### MySQL 作为数据库

修改以下命令并复制，执行：

```shell
helm install shenyu shenyu/shenyu -n=shenyu --create-namespace \
      --set dataSource.active=mysql \
      --set dataSource.mysql.ip=127.0.0.1 \
      --set dataSource.mysql.port=3306 \
      --set dataSource.mysql.username=root \
      --set dataSource.mysql.password=123456
```

#### PostgreSQL 作为数据库(ShenYu 版本 > 2.5.0)

修改以下命令并复制，执行：

```shell
helm install shenyu shenyu/shenyu -n=shenyu --create-namespace \
      --set dataSource.active=pg \
      --set dataSource.pg.ip=127.0.0.1 \
      --set dataSource.pg.port=5432 \
      --set dataSource.pg.username=postgres \
      --set dataSource.pg.password=123456
```

#### Oracle 作为数据库

修改以下命令并复制，执行：

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

## 脑图

![](https://shenyu.apache.org/img/shenyu/activite/shenyu-xmind.png)

---
