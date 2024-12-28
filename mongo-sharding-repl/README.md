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

Проверяем, что демо данные были добавленны
```shell
./scripts/mng_router1-check_data.sh
```

## Как проверить

### Если вы запускаете проект на локальной машине

Откройте в браузере http://localhost:8080

### Если вы запускаете проект на предоставленной виртуальной машине

Узнать белый ip виртуальной машины

```shell
curl --silent http://ifconfig.me
```

Откройте в браузере http://<ip виртуальной машины>:8080

## Доступные эндпоинты

Список доступных эндпоинтов, swagger http://<ip виртуальной машины>:8080/docs