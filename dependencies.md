# Dependencies

## Host Dependencies

* Docker Engine
* Docker Compose Plugin
* Git
* Curl

Verify:

docker --version
docker compose version
git --version
curl --version

---

## Container Images

Client:

* nginx:alpine

API:

* node
* npm

WebAPI:

* openjdk

Database:

* mysql:8.0.33
* mongo:4

Reverse Proxy:

* nginx:latest

---

## Network Dependency

Docker bridge network:

emartapp_default

Containers communicate through service names.

Examples:

api
webapi
client
emongo
emartdb

Do not use hardcoded IP addresses.
