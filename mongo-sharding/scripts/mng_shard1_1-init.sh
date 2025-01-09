#!/bin/bash

###
# Инициализируем Shard 1
###

docker compose exec -T mng_shard1_1 mongosh --port 27011 <<EOF
rs.initiate(
    {
      _id : "rs1",
      members: [
        { _id : 11, host : "mng_shard1_1:27011" },
      ]
    }
);
EOF

