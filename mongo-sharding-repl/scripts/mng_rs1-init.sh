#!/bin/bash

###
# Инициализируем ReplicaSet
###

docker compose exec -T mng_rs1_1 mongosh --port 27011 --quiet  <<EOF
rs.initiate(
    {
      _id : "rs1",
      members: [
        { _id : 11, host : "mng_rs1_1:27011" },
        { _id : 12, host : "mng_rs1_2:27012" },
        { _id : 13, host : "mng_rs1_3:27013" },
      ]
    }
);
EOF

