---
title: "Deploy a castlemock mockserver on Kubernetes with helm."
date: 2022-02-11T19:01:54+01:00
images: []
categories: [tutorial, mockserver, kubernetes, helm]
tags: [devops, castlemock, macos]
authors: [trilogy]
---

Original post on [Dev.to](https://dev.to/3logy/deploy-a-castlemock-mockserver-on-kubernetes-with-helm-41p8)

# What is a mockserver?

A mock server is actually a fake API that simulates a real server response. There are many articles about certain open source solutions like mockserver or about the general concept of mocking APIs

Why should a team use a mock server in their development lifecycle? There could be two good reasons :

-   Simplify testing
-   Decoupling development teams

After we noticed a tight coupling behavior between a product team and my team, I decided to deploy a mock server to reduce the dependencies between the team. The mock server should have the following properties:

-   could be used for automation tests as well as for manual tests
-   Easy setup and maintenance by the business analyst
-   can process REST as SOAP requests

I found out that there are a lot of open source solution for mocking api. From mock-server to castlemock

# Install Docker and Kubernetes on MacOs

This is pretty easy.
The following steps can help you with:

-   Download Docker-Desktop
-   Install Kubernetes from Docker-Desktop

When that's done, all you have to do is pull the latest version of castlemock from Docker Hub :

```bash
 docker pull castlemock/castlemock
```

If everything works, install Helm using the following commands :

```bash
 brew install helm
```

It's all.

# Install castlemock with helm

Assuming Docker, Kubernetes and Helm are install and running. Do the following steps:

```bash
    git clone https://github.com/3logy/castlemock-helm
    helm install castlemock ./castlemock/
```

So easy it's when working with Helm.

Many thanks to Muhammad Hewedy 👍 , who helps me on Twitter to get into Castlemock deployment on Kubernetes.