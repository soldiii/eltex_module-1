#!/bin/bash

config_file="task5.cfg"

if [ ! -f "$config_file" ]
then
echo "Не удалось найти файл конфигурации \"$config_file\""
exit 1
fi

source $config_file

process_logs=$(grep $process_name $log_file)
echo $process_logs | awk -v start="$start_date" -v end="$end_date" '$0 > start && $0 < end' 
