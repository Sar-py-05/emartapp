# emart-app
# E-Mart Application Architecture

Internet
|
v
Nginx Reverse Proxy (Port 80)
|
+-----------------------+
| |
v v
Angular Client Node API
(Port 80) (Port 5000)
|
v
MongoDB
(Port 27017)

|
v

Java API
(Port 9000)
|
v
MySQL
(Port 3306)

Docker Network:
emartapp_default

Container Communication:

nginx -> client:80
nginx -> api:5000
nginx -> webapi:9000

api -> emongo:27017

webapi -> emartdb:3306
