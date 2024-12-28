#!/bin/bash

###
# Инициализируем Shard 2
###

docker compose exec -T mng_shard2_1 mongosh --port 27021 <<EOF
rs.initiate(
    {
      _id : "rs2",
      members: [
        { _id : 21, host : "mng_shard2_1:27021" },
      ]
    }
);
EOF

