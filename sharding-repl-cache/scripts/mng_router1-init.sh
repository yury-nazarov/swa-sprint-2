#!/bin/bash

###
# Инициализируем Router и добавляем шарды
###

docker compose exec -T mng_router1 mongosh --port 27017 --quiet <<EOF
sh.addShard("rs1/mng_rs1_1:27011,mng_rs1_2:27012,mng_rs1_3:27013");
sh.addShard("rs2/mng_rs2_1:27021,mng_rs2_2:27022,mng_rs2_3:27023");
sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )
EOF

