# Troubleshooting Guide

## Issue 1: docker compose start fails

Error:

service "emartdb" has no container to start

Cause:

Containers were deleted.

Fix:

docker compose up -d

Reason:

start only starts existing containers.
up creates missing containers.

---

## Issue 2: 502 Bad Gateway

Symptoms:

curl localhost

returns:

502 Bad Gateway

Check:

docker logs nginx

Common Error:

connect() failed (111: Connection refused)

Cause:

Nginx cannot reach upstream service.

Verification:

docker exec nginx getent hosts client

Expected:

172.x.x.x client

---

### Root Cause Encountered

Incorrect configuration:

upstream client {
server client:4200;
}

Actual service:

client container serves on:

80

Fix:

upstream client {
server client:80;
}

Restart:

docker restart nginx

Verification:

curl localhost

Expected:

Welcome to E-MART Online

---

## Issue 3: Host Not Found

Error:

host not found in upstream "client:4200"

Check:

docker exec nginx getent hosts client

Cause:

DNS resolution failure or container not started.

Fix:

docker compose restart

Verify:

docker ps

---

## Issue 4: Container Exits Immediately

Check:

docker logs <container>

Common Causes:

* Application crash
* Missing environment variables
* Incorrect startup command

---

## Issue 5: Port Already Allocated

Error:

Bind for 0.0.0.0:80 failed

Check:

sudo lsof -i :80

Fix:

Stop conflicting service

Example:

sudo systemctl stop nginx

---

## Issue 6: Database Connection Failure

Mongo:

docker logs api

MySQL:

docker logs webapi

Verify:

docker ps

Ensure databases are healthy.

---

## Issue 7: Docker DNS Issues

Check network:

docker network inspect emartapp_default

Verify container names:

docker exec nginx getent hosts client
docker exec nginx getent hosts api
docker exec nginx getent hosts webapi
