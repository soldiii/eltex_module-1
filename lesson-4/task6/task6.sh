#!/bin/bash

echo "Cоздаем архив из первого файла"
tar -cvf archive.tar a.txt

echo "Показываем содержимое архива"
tar -tvf archive.tar

echo "Добавляем второй файл в архив"
tar -rvf archive.tar b.txt

echo "Показываем содержимое архива"
tar -tvf archive.tar

echo "Добавляем третий файл в архив"
tar -rvf archive.tar c.txt

echo "Показываем содержимое архива"
tar -tvf archive.tar

echo "Удаляем второй файл из архива"
tar --delete -f archive.tar b.txt

echo "Показываем содержимое архива" 
tar -tvf archive.tar

echo "Создаем папку для распаковки архива"
mkdir tar_folder

echo "Распаковываем архив в созданную папку"
tar -xvf archive.tar -C tar_folder/
