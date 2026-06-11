# E-Mart Docker Deployment Guide

## Prerequisites

### EC2 Requirements

* Ubuntu 24.04 LTS
* Minimum t2.medium
* Internet connectivity
* Security Group Rules:

| Port  | Purpose            |
| ----- | ------------------ |
| 22    | SSH                |
| 80    | Application        |
| 3306  | MySQL (Optional)   |
| 27017 | MongoDB (Optional) |

---

## Install Docker

```bash
apt update
apt install -y ca-certificates curl gnupg

install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
| gpg --dearmor -o /etc/apt/keyrings/docker.gpg

chmod a+r /etc/apt/keyrings/docker.gpg

echo \
"deb [arch=$(dpkg --print-architecture) \
signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo $VERSION_CODENAME) stable" \
| tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update

apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

---

## Clone Repository

```bash
git clone <repository-url>
cd emartapp
```

---

## Build Images

```bash
docker compose build
```

---

## Start Application

```bash
docker compose up -d
```

---

## Verify Deployment

```bash
docker ps
```

Expected Containers:

* nginx
* client
* api
* webapi
* emongo
* emartdb

Verify:

```bash
curl localhost
```

Expected:

HTML content containing:

Welcome to E-MART Online
