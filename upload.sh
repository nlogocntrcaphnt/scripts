#!/bin/bash

output_filename=${1%.*}
output_filename=${output_filename##*/}

curl -v --upload-file $1 https://transfer.sh/$output_filename
