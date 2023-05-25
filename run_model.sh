#!/bin/bash

# Function to check if a command exists
command_exists () {
    type "$1" &> /dev/null ;
}

# check if uuidgen and awk exist
if ! command_exists uuidgen || ! command_exists awk
then
    echo "This script requires uuidgen and awk to be installed."
    exit 1
fi

# check if input parameters exist
if [ -z "$1" ] || [ -z "$2" ]
then
    echo "Please provide team and overs as input parameters."
    exit 1
fi

# create tmp directory if it does not exist
mkdir -p tmp

# parameters
team=$1
overs=$2

# generate a unique filename
tmp_file=tmp/$(uuidgen).csv

# copy over header row
head -n1 data/intermediate_data.csv > $tmp_file

# filter the input CSV file
awk -F, -v team="$team" -v overs="$overs" 'BEGIN {OFS = ","; count=0} $1 == team && count < overs {print; count++}' data/intermediate_data.csv >> $tmp_file

# run the python script
python prediction_script.py $tmp_file
