#!/bin/bash

###
# Инициализируем ReplicaSet
###

docker compose exec -T mng_rs2_1 mongosh --port 27021 --quiet  <<EOF
rs.initiate(
    {
      _id : "rs2",
      members: [
        { _id : 21, host : "mng_rs2_1:27021" },
        { _id : 22, host : "mng_rs2_2:27022" },
        { _id : 23, host : "mng_shard2_3:27023" },

      ]
    }
);
EOF