#!/bin/bash

###
# Проверка наличия данных на всех репликах шардов
###

docker compose exec -T mng_router1 mongosh --port 27017 --quiet <<EOF
use somedb
db.helloDoc.countDocuments();
EOF

docker compose exec -T mng_rs1_1 mongosh --port 27011 --quiet <<EOF
use somedb
db.helloDoc.countDocuments();
EOF

docker compose exec -T mng_rs1_2 mongosh --port 27012 --quiet <<EOF
use somedb
db.helloDoc.countDocuments();
EOF

docker compose exec -T mng_rs1_3 mongosh --port 27013 --quiet <<EOF
use somedb
db.helloDoc.countDocuments();
EOF


docker compose exec -T mng_rs2_1 mongosh --port 27021 --quiet <<EOF
use somedb
db.helloDoc.countDocuments();
EOF

docker compose exec -T mng_rs2_2 mongosh --port 27022 --quiet <<EOF
use somedb
db.helloDoc.countDocuments();
EOF

docker compose exec -T mng_rs2_3 mongosh --port 27023 --quiet <<EOF
use somedb
db.helloDoc.countDocuments();
EOF