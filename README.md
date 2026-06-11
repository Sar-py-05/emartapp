# E-Mart Microservices Application

## Overview

E-Mart is a containerized e-commerce application built using a microservices architecture. The application consists of an Angular frontend, Node.js API service, Java Spring Boot API service, MongoDB, MySQL, and an Nginx reverse proxy. All components are deployed using Docker Compose.

This project was created to practice:

* Docker Containerization
* Docker Compose Orchestration
* Microservices Architecture
* Reverse Proxy Configuration with Nginx
* Multi-Container Networking
* Application Deployment on AWS EC2
* Troubleshooting and Operational Runbooks

---

## Architecture

```text
Internet
    |
    v
+------------------+
|      Nginx       |
|  Reverse Proxy   |
+------------------+
        |
        +-------------------+
        |                   |
        v                   v
+---------------+    +---------------+
| Angular Client|    |  Node API     |
|   Port 80     |    |  Port 5000    |
+---------------+    +---------------+
                            |
                            v
                     +--------------+
                     |   MongoDB    |
                     |  Port 27017  |
                     +--------------+

        |
        v

+------------------+
| Java Spring Boot |
|     Web API      |
|   Port 9000      |
+------------------+
        |
        v
+--------------+
|    MySQL     |
|  Port 3306   |
+--------------+
```

---

## Technology Stack

### Frontend

* Angular
* Nginx

### Backend

* Node.js
* Java Spring Boot

### Databases

* MongoDB 4
* MySQL 8.0.33

### Infrastructure

* Docker
* Docker Compose
* Ubuntu Linux
* AWS EC2

---

## Repository Structure

```text
emartapp/
│
├── client/
├── nodeapi/
├── javaapi/
├── nginx/
│   └── default.conf
│
├── docker-compose.yaml
├── Jenkinsfile
│
├── docs/
│   ├── architecture.md
│   ├── deployment-guide.md
│   ├── runbook.md
│   ├── troubleshooting.md
│   ├── lessons-learned.md
│   └── dependencies.md
│
└── README.md
```

---

## Prerequisites

* Ubuntu 22.04/24.04
* Docker Engine
* Docker Compose Plugin
* Git

Verify installation:

```bash
docker --version
docker compose version
git --version
```

---

## Deployment

Clone the repository:

```bash
git clone <repository-url>
cd emartapp
```

Build images:

```bash
docker compose build
```

Start application:

```bash
docker compose up -d
```

Verify containers:

```bash
docker ps
```

---

## Validation

Check application:

```bash
curl localhost
```

Expected result:

```html
Welcome to E-MART Online
```

Or open:

```text
http://<EC2-Public-IP>
```

from your browser.

---

## Container Overview

| Container | Purpose              | Port  |
| --------- | -------------------- | ----- |
| nginx     | Reverse Proxy        | 80    |
| client    | Angular Frontend     | 80    |
| api       | Node.js Backend      | 5000  |
| webapi    | Java Spring Boot API | 9000  |
| emongo    | MongoDB              | 27017 |
| emartdb   | MySQL                | 3306  |

---

## Docker Networking

Containers communicate through Docker DNS using service names:

```text
client
api
webapi
emongo
emartdb
```

Example:

```text
nginx -> client:80
nginx -> api:5000
nginx -> webapi:9000
```

Do not use hardcoded container IP addresses.

---

## Common Operational Commands

View running containers:

```bash
docker ps
```

View logs:

```bash
docker logs nginx
docker logs client
docker logs api
docker logs webapi
```

Restart services:

```bash
docker compose restart
```

Stop application:

```bash
docker compose down
```

Remove unused resources:

```bash
docker system prune -a
```

---

## Known Issues and Lessons Learned

### Nginx 502 Bad Gateway

Issue:

```text
502 Bad Gateway
```

Root Cause:

Nginx upstream pointed to:

```nginx
client:4200
```

Actual Angular container was listening on:

```nginx
client:80
```

Fix:

```nginx
upstream client {
    server client:80;
}
```

Verification:

```bash
curl localhost
```

---

## Documentation

Additional project documentation is available in:

```text
docs/
```

* architecture.md
* deployment-guide.md
* runbook.md
* troubleshooting.md
* lessons-learned.md
* dependencies.md

---

## Learning Objectives

This project demonstrates:

* Docker Image Creation
* Docker Compose
* Container Networking
* Reverse Proxy Configuration
* Service Discovery
* EC2 Deployments
* Production Troubleshooting
* Operational Documentation

---

## Author

Abhishek Roy

DevOps / MLOps Learning Portfolio Project
