FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        libglib2.0-0 \
    && curl -O http://repo.yandex.ru/yandex-disk/yandex-disk_latest_amd64.deb \
    && apt install -y ./yandex-disk_latest_amd64.deb \
    && rm -f yandex-disk_latest_amd64.deb \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME ["/root/.config/yandex-disk", "/ydisk"]

CMD ["bash", "-c", "yandex-disk start --no-daemon --dir=/ydisk"]
