#!/bin/bash

# ..................
# Author: Robert Amoah
# Contact: mr_robertamoah@yahoo.com
# ..................

# Description
#       Creating 25 batch of files with naming structure of <filename><number>
#       filename will be provided as an argument
#       number will be 1 if no such file exists
#       or 1 plus the number part of the existing file with the highest number

# assign first argument to file_name variable
file_name=$1

# check if file_name is empty
if [ -z $file_name ]
then
        # echo the appropriate usage and exit
        echo "usage: $0 <file_name>"
        exit
fi

# assign 0 to start_num variable
start_num=0

# get the number of characters in the filename when it is searched with the 'find' command
name_count=$(echo "./$file_name" | wc -c)

# find the existing files, in the current working directory, with the same naming structure and extract the number portion of the file with the highest number
prev_num=$(find . -maxdepth 1 -type f -regex "./$file_name[0-9]+" -empty | sort -V | tail -1 | cut -b $name_count-)

# check if the prev_num variable only contains numbers
if [[ $prev_num =~ ^[0-9]+$ ]];
then
        # assign the number part of the existing file with the highest number to start_num variable
        start_num=$prev_num
fi

# was used for testing the values of start_num and prev_num variables
# echo "$start_num $prev_num"

# loop through a set of numbers, from 1 to 25 (for each run, the current number will be assigned to x)
# you can also write it in C style
for x in {1..25}
do
        # add the current number, which is x, to the start_num and assign it to number variable
        number=$(($start_num + $x))

        # create empty file with the structure <filename><number>
        touch "$file_name$number"
done

# Thank you 👍