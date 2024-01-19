#!/bin/bash

DB=/home/glenn/genome/panTro4/panTro4
ENTRY=chr22
SLICE_SIZE=10000

# Get the size of the sequence
ENTRY_SIZE=$(( `blastdbcmd -db $DB -entry $ENTRY -outfmt %l` ))

for (( i=1; i<=$ENTRY_SIZE; i=i+$SLICE_SIZE)); do
	BEGIN=$i
	END=$(( $i + $SLICE_SIZE - 1 ))

	SLICE=`blastdbcmd -db $DB -entry $ENTRY -range $BEGIN-$END -outfmt %s`
	echo ">$ENTRY-$BEGIN-$END"
	echo $SLICE | fold
done 
