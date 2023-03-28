#!/bin/bash

# Запрос имени процесса и промежутка времени
read -p "Введите имя процесса: " process_name
read -p "Введите начальную дату/время в формате 'Mon DD': " start_date
read -p "Введите конечную дату/время в формате 'Mon DD': " end_date

process_logs=$(grep $process_name /var/log/auth.log)
echo $process_logs | awk -v start="$start_date" -v end="$end_date" '$0 > start && $0 < end' 
