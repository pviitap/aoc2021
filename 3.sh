#!/bin/bash

cp 3.txt tmp_1.txt

for i in {1..12}
do

	lines=$(($(wc -l tmp_$i.txt | cut -d' ' -f1)))
	lines=$(bc -l <<< "$lines/2")
	filter=$(awk -v total=$lines -v pos=$i -f find_common.awk "tmp_$i.txt" )

	echo "i: $i filter: $filter lines: $lines"

	awk -v filter_a=$filter -v pos=$i -f 3b.awk "tmp_$i.txt" > "tmp_$(($i+1)).txt"

	count=$(($(wc -l tmp_$(($i+1)).txt | cut -d' ' -f1)))
	echo $count
	if [[ "$count" == "1" ]]; then
		echo "==="
		cat "tmp_$(($i+1)).txt"
		bc -l <<< "ibase=2;$(cat "tmp_$(($i+1)).txt")"
		exit
	fi
done 
