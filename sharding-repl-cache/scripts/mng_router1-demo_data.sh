#!/bin/bash

###
# Кол-во записей в коллекции
###

docker compose exec -T mng_router1 mongosh --port 27017 <<EOF
use somedb
for(var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i})
EOF