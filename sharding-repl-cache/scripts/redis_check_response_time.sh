#!/bin/bash

###
# Проверка наличия данных на всех репликах шардов
###

curl \
    -X 'GET' 'http://localhost:8080/helloDoc/users' -H 'accept: application/json' \
    -w '\n* Response time: %{time_total}s\n' --silent --output /dev/null