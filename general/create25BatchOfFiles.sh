#!/bin/bash

file_name=$1

if [ -z $file_name ]
then
        echo "usage: $0 <file_name>"
        exit
fi

start_num=0
name_count=$(echo "./$file_name" | wc -c)
prev_num=$(find . -type f -regex "./$file_name[0-9]+" -empty -maxdepth 1 | sort -V | tail -1 | cut -b $name_count-)
echo "$start_num $prev_num"

if [[ $prev_num =~ ^[0-9]+$ ]];
then
        start_num=$prev_num
fi
echo "$start_num $prev_num"

for x in {1..25}
do
        number=$(($start_num + $x))
        touch "$file_name$number"
done