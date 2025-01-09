#!/bin/bash

###
# Демо данные в БД
###

docker compose exec -T mng_router1 mongosh --port 27017 --quiet <<EOF
use somedb
db.helloDoc.countDocuments();
EOF

