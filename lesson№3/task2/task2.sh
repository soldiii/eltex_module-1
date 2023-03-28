#!/bin/bash

if [ "$#" -ne 3 ]; then
echo "Ошибка: чтобы использовать скрипт, необходимо внести 3 аргумента по следующему шаблону: ./task2.sh <местоположение> <количество папок> <шаблон имени>>"
exit 1
fi

dir_location=$1 # местоположение (аргумент 1)
num_dirs=$2 # количество папок (аргумент 2)
name_template=$3 # шаблон имени (аргумент 3)

echo "Создание количества папок = $num_dirs, по местоположению = $dir_location и по шаблону имени = $name_template"

for i in $(seq 1 $num_dirs)
do
dir_name=$(printf "$name_template" "$i")
dir_path="$dir_location/$dir_name"
mkdir -p $dir_path/subdir{1..100}
for subdir in $dir_path/subdir*
do
touch $subdir/file{1..200}
done
done

