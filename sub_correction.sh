#!/bin/bash

cat $1 | grep "\-\-" > /tmp/sub_timestamps.txt

while [ -s /tmp/sub_timestamps.txt ]; do
    	line=$(head -n 1 /tmp/sub_timestamps.txt)
	echo $line
	working_line="$(echo $line)"

	first_hours="$(echo ${working_line:0:2})"
	working_line="$(echo $working_line | sed 's/^[^:]*://g')"

	first_minutes="$(echo ${working_line:0:2})"
	working_line="$(echo $working_line | sed 's/^[^:]*://g')"

	first_seconds="$(echo ${working_line:0:2})"
	working_line=${working_line:3}

	first_milliseconds="$(echo ${working_line:0:3})"

	first_seconds=$(($first_seconds+2))
	
	if [[ $first_seconds -gt 59 ]]
	then
		$first_second=$(($first_seconds % 60))
		first_minutes=$(($first_minutes + 1))
	fi

	if [[ $first_seconds -lt 10 ]]
	then
		first_seconds=$(echo "0$first_seconds")
	fi

	if [[ $first_minutes -gt 59 ]]
	then
		$first_minutes=$(($first_minutes % 60))
		first_hours=$(($first_hours + 1))
	fi
	if [[ $first_minutes -lt 10 ]]
	then
		first_minutes=$(echo "0$first_minutes")
	fi

	if [[ $first_hours -lt 10 ]]
	then
		first_hours=$(echo "0$first_hours")
	fi

	working_line=${working_line:8}

	second_hours="$(echo ${working_line:0:2})"
	working_line="$(echo $working_line | sed 's/^[^:]*://g')"

	second_minutes="$(echo ${working_line:0:2})"
	working_line="$(echo $working_line | sed 's/^[^:]*://g')"

	second_seconds="$(echo ${working_line:0:2})"
	working_line=${working_line:3}

	second_milliseconds="$(echo ${working_line:0:3})"

	second_seconds=$(($second_seconds+2))
	
	if [[ $first_seconds -gt 59 ]]
	then
		$second_second=$(($second_seconds % 60))
		second_minutes=$(($second_minutes + 1))
	fi

	if [[ $second_seconds -lt 10 ]]
	then
		second_seconds=$(echo "0$second_seconds")
	fi

	if [[ $second_minutes -gt 59 ]]
	then
		$second_minutes=$(($second_minutes % 60))
		second_hours=$(($second_hours + 1))
	fi

	if [[ $second_minutes -lt 10 ]]
	then
		second_minutes=$(echo "0$second_minutes")
	fi

	if [[ $second_hours -lt 10 ]]
	then
		second_hours=$(echo "0$second_hours")
	fi

	replacement_string=$(echo "$first_hours:$first_minutes:$first_seconds,$first_milliseconds --> $second_hours:$second_minutes:$second_seconds,$second_milliseconds")
	sed -i -r "s/$line/$replacement_string/" $1
	sed -i 1d /tmp/sub_timestamps.txt
done

