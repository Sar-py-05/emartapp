# Lessons Learned

## 1. Docker Port Mapping Confusion

Host Port:

4200:4200

does not mean application listens on 4200 inside container.

Always verify inside container:

netstat -tulpn

Actual finding:

Client container listens on:

80

---

## 2. Nginx Upstream Must Use Internal Container Port

Incorrect:

client:4200

Correct:

client:80

Docker networking uses container port, not host published port.

---

## 3. docker compose start vs up

start:
Only starts existing containers.

up:
Creates and starts containers.

If containers were removed:

docker compose up -d

must be used.

---

## 4. Docker DNS Is Powerful

Container communication should use:

client
api
webapi
emongo
emartdb

instead of IP addresses.

---

## 5. Logs Are The First Place To Look

Commands:

docker logs nginx

docker logs client

docker logs api

docker logs webapi

These usually reveal root cause quickly.

---

## 6. Verify Before Changing

Useful commands:

docker ps

docker logs <container>

docker network inspect <network>

curl localhost

getent hosts client

These should always be checked before modifying configurations.
