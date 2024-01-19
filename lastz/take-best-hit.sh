#!/bin/bash

DATAFILE=chr22_hg19_vs_pantro4_10000slice.dat

declare -A TOP_HITS_PERC
declare -A TOP_HITS_LENGTH

while IFS=$'\t' read -a line
do
	# If this is the header line, throw it out
	if [ "${line[0]}" = "#score" ]; then
		continue
	fi

	QUERY=${line[6]}
	PERC=${line[12]//%} # Remove the percentage character
	LENGTH=$(( ${line[10]} - ${line[9]} ))

	# If it's not in the dictionary, add it
	if [ ! "${TOP_HITS_PERC[$QUERY]}" ]; then
		TOP_HITS_PERC["$QUERY"]=$PERC
		TOP_HITS_LENGTH["$QUERY"]=$LENGTH
	fi

	# Save the highest percentage
	OLD_PERC=${TOP_HITS_PERC[$QUERY]}
	if (( $(echo "$PERC > $OLD_PERC" | bc -l ) ))
	then
		TOP_HITS_PERC["$QUERY"]=$PERC
		TOP_HITS_LENGTH["$QUERY"]=$LENGTH
	fi

done < $DATAFILE

# Let's calculate the average!!!
for key in "${!TOP_HITS_PERC[@]}"
do
	echo $key : ${TOP_HITS_PERC[$key]} : ${TOP_HITS_LENGTH[$key]}
done | sort

for key in "${!TOP_HITS_PERC[@]}"
do
	echo ${TOP_HITS_PERC[$key]}

done | awk '{ sum += $1; count++ } END { print "Average: ", sum / count, "Count:", count }'

