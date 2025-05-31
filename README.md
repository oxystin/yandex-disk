# Yandex.Disk Backup (Docker)

Контейнер для синхронизации данных с Яндекс.Диском, используя официальный клиент. Позволяе обходить искуственное ограничения скорости по WebDAV.

## 📦 Возможности

- Использует официальный клиент Yandex.Disk
- Обходит ограничение скорости WebDAV
- Подходит для резервного копирования

## 🚀 Быстрый старт

### 1. Клонируй проект

```bash
git clone https://github.com/yourusername/yandex-disk-backup.git
cd yandex-disk-backup
```

### 2. Пройди настройку Yandex.Disk

```bash
docker run -it --rm \
  -v $PWD/yandex-config:/root/.config/yandex-disk \
  yandex-disk-client \
  yandex-disk setup
```
или

```bash
docker compose run --rm yandex-disk yandex-disk setup
```

Следуй инструкциям и авторизуйся. Конфигурация сохранится в `./yandex-config`.

### 3. Запусти постоянную синхронизацию

```bash
docker run -d \
  --name yandex-disk \
  -v $PWD/yandex-config:/root/.config/yandex-disk \
  -v $PWD/backup:/ydisk \
  yandex-disk-client
```

или

```bash
docker compose up -d
```

Содержимое папки `./backup` будет синхронизировано с Яндекс.Диском.

## 🗂 Структура

- `yandex-config/` — конфигурация клиента (токены, настройки)
- `backup/` — файлы для синхронизации с Яндекс.Диском


## 📄 Лицензия

MIT
