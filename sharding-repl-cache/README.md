# pymongo-api

## Как запустить

Запускаем mongodb кластер и приложение

```shell
docker compose up -d
```

В зависимости от ОС (aka Unix like), возможно понадобится добавить прав на исполнение
```shell
chmod +x ./scripts/*
```
Инициализируем mng_config1
```shell
./scripts/mng_config1-init.sh
```

Инициализируем реплики: mng_rs1, mng_rs2
```shell
./scripts/mng_rs1-init.sh
./scripts/mng_rs2-init.sh
```

Инициализируем роутер: mng_router1,
```shell
./scripts/mng_router1-init.sh
```

Наполняем демо данными
```shell
./scripts/mng_router1-demo_data.sh
```

## Как проверить

Проверяем, что демо данные были добавленны
```shell
./scripts/mng_router1-check_data.sh
```

Проверяем время ответа с кешем (на холодную ~1.033479s, из кеша ~0.008710s)
```shell
./scripts/redis_check_response_time.sh
```

### Если вы запускаете проект на локальной машине

Откройте в браузере http://localhost:8080

Должно быть аналогично
```json
{
    "mongo_topology_type": "Sharded",
    "mongo_replicaset_name": null,
    "mongo_db": "somedb",
    "read_preference": "Primary()",
    "mongo_nodes": [
        [
            "mng_router1",
            27017
        ]
    ],
    "mongo_primary_host": null,
    "mongo_secondary_hosts": [],
    "mongo_address": [
        "mng_router1",
        27017
    ],
    "mongo_is_primary": true,
    "mongo_is_mongos": true,
    "collections": {
        "helloDoc": {
            "documents_count": 1000
        }
    },
    "shards": {
        "rs1": "rs1/mng_rs1_1:27011,mng_rs1_2:27012,mng_rs1_3:27013",
        "rs2": "rs2/mng_rs2_1:27021,mng_rs2_2:27022,mng_rs2_3:27023"
    },
    "cache_enabled": true,
    "status": "OK"
}
```

### Если вы запускаете проект на предоставленной виртуальной машине

Узнать белый ip виртуальной машины

```shell
curl --silent http://ifconfig.me
```

Откройте в браузере http://<ip виртуальной машины>:8080

## Доступные эндпоинты

Список доступных эндпоинтов, swagger http://<ip виртуальной машины>:8080/docs