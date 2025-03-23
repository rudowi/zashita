#!/bin/bash

# Обновить пакеты и установить Git (если не установлен)
sudo apt-get update && sudo apt-get install -y git

# Проверка успешности установки Git
if ! command -v git &> /dev/null; then
    echo "Ошибка: Не удалось установить Git!"
    exit 1
fi

# Параметры репозитория (можно изменить)
REPO_URL="https://github.com/rudowi/zashita.git"
TARGET_DIR="$HOME/yee/projects"

# Создать целевую директорию
mkdir -p "$TARGET_DIR"

# Клонирование репозитория
echo "Клонирование репозитория $REPO_URL в $TARGET_DIR"
if git clone "$REPO_URL" "$TARGET_DIR"; then
    echo "Репозиторий успешно клонирован!"
else
    echo "Ошибка при клонировании репозитория!"
    exit 1
fi

# Дополнительные действия (опционально)
# cd "$TARGET_DIR"
# git checkout main
# ./setup.sh  # Пример запуска скрипта из репозитория

exit 0