#!/bin/bash

file="counter.log"

if [ -f counter.log ]; then
	counter=$(wc -l $file | awk '{print $1}')
else
	touch $file
	counter=0
fi

counter=$((counter+1))

echo "$(date) I run $counter times" >> $file

at now + 1 minute -f task5.sh
