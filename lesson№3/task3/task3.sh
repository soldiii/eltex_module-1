#!/bin/bash

# Запрос имени процесса и периодичности проверки
read -p "Введите имя процесса: " process_name
read -p "Введите периодичность проверки (в секундах): " check_interval

#функция проверки процесса
check_process() {
if pgrep "$process_name" > /dev/null
then
echo "Процесс $process_name запущен."
else
echo "Процесс $process_name не запущен, запускаем."
$processname &
fi
}

#Бесконечный цикл
while true
do
check_process
sleep "$check_interval"
done


