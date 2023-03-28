#!/bin/bash

echo "Установите время для будильника (формат: ЧЧ:ММ): "
read alarm_time

echo "Введите путь к файлу с музыкой: "
read music_file

while true; do
  current_time=$(date +"%H:%M")
  if [ "$current_time" == "$alarm_time" ]; then
    echo "Будильник сработал в $current_time"
    mpg123 "$music_file"
    break
  fi
  sleep 60
done
