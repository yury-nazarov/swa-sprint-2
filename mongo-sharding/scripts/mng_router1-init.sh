#!/bin/bash

###
# Инициализируем Router
###

docker compose exec -T mng_router1 mongosh --port 27017 <<EOF
sh.addShard("rs1/mng_shard1_1:27011");
sh.addShard("rs2/mng_shard2_1:27021");
sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )
EOF

