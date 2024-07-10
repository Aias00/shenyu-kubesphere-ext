
# What is the Apache ShenYu?

This is an asynchronous, high-performance, cross-language, responsive API gateway.

# Why named Apache ShenYu

ShenYu (神禹) is the honorific name of Chinese ancient monarch Xia Yu (also known in later times as Da Yu), who left behind the touching story of the three times he crossed the Yellow River for the benefit of the people and successfully managed the flooding of the river. He is known as one of the three greatest kings of ancient China, along with Yao and Shun.

* Firstly, the name ShenYu is to promote the traditional virtues of our Chinese civilisation.
* Secondly, the most important thing about the gateway is the governance of the traffic.
* Finally, the community will do things in a fair, just, open and meritocratic way, paying tribute to ShenYu while also conforming to the Apache Way.

---

## 前置条件

Manually install an ingress controller and set it to NodePort mode by default, with port 30888. It is recommended not to make adjustments until you are familiar with the entire process.

```bash
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace \
  --set controller.service.type=NodePort \
  --set controller.service.nodePorts.http=30888
```

# Features

* Proxy: Support for Apache® Dubbo™, Spring Cloud, gRPC, Motan, SOFA, TARS, WebSocket, MQTT
* Security: Sign, OAuth 2.0, JSON Web Tokens, WAF plugin
* API governance: Request, response, parameter mapping, Hystrix, RateLimiter plugin
* Observability: Tracing, metrics, logging plugin
* Dashboard: Dynamic traffic control, visual backend for user menu permissions
* Extensions: Plugin hot-swapping, dynamic loading
* Cluster: NGINX, Docker, Kubernetes
* Language: provides .NET, Python, Go, Java client for API register
