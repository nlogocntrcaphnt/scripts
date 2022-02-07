#!/bin/bash

ffmpeg_arg=""
ffmpeg_inputs="ffmpeg"
filename="merge_"


for ((i=0; i<=$#; i++))
do
	input="$(echo $@ | sed 's/ .*//')"
	ffmpeg_inputs+=" -i $input"
	
	input="$(echo ${input::-4})"
	filename+="$(echo $(basename $input))_"

	shift 1

    ffmpeg_arg+="[$i:v][$i:a]"
done

filename="$(echo ${filename::-1})"
ffmpeg_command="$(echo "$ffmpeg_inputs -filter_complex \"$ffmpeg_arg concat=n=$i:v=1:a=1 [outv] [outa]\" -map \"[outv]\" -map \"[outa]\" ~/Videos/recordings/$filename.mp4")"

eval $ffmpeg_command



