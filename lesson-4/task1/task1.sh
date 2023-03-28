#!/bin/bash

# Функции для резервного копирования:
# Резервное копирование dd-способом
function backup_dd() {
	dd if="$1" of="$2" bs=4M conv=noerror,sync
}
# Резервное копирование tar-способом
function backup_tar() {
	tar -czvf "$2"/backup-$(date +%Y%m%d%H%M%S).tar.gz "$1"
}
# Резервное копирование git-способом
function backup_git() {
	git add "$2"
   	git commit -m "Backup $(date)"
    	git push origin master
}

# Предлагаем пользователю выбрать способ резервного копирования
echo "Выберите метод резервного копирования:"
echo "1. dd"
echo "2. tar"
echo "3. git"
read method

echo "Введите информацию, которую нужно скопировать"
read source

echo "Введите место, куда нужно резервно копировать указанную информацию"
read destination

# Предлагаем пользователю выбрать периодичность резервного копирования
echo "Выберите периодичность резервного копирования:"
echo "1. Ежедневно"
echo "2. Еженедельно"
echo "3. Ежемесячно"
read frequency

# Выбираем функцию в зависимости от выбранного метода
case $method in
    1)
        backup_dd  "$source" "$destination"
        ;;
    2)
        backup_tar "$source" "$destination"
        ;;
    3)
        backup_git "$source"
        ;;
    *)
        echo "Неверно введен метод резервного копирования"
        exit 1
        ;;
esac

# Выбираем периодичность
case $frequency in
    1)
        at now + 1 day -f $0
        ;;
    2)
        at now + 1 week -f $0
        ;;
    3)
        at now + 1 month -f $0
        ;;
    *)
        echo "Неверно введена периодичность резервного копирования"
        exit 1
        ;;
esac
