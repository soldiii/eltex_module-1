#!/bin/bash
mkdir -p dir{1..50}/subdir{1..100}
for dir in dir*
do
for subdir in $dir/subdir*
do
touch $subdir/file{1..200}
done;
done;

