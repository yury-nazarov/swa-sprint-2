#!/bin/bash

###
# Инициализируем config server
###

docker compose exec -T mng_config1 mongosh --port 27018 <<EOF
rs.initiate(
  {
    _id : "config_server",
    configsvr: true,
    members: [
      { _id : 1, host : "mng_config1:27018" }
    ]
  }
);
EOF

