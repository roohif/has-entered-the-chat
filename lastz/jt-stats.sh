#!/bin/bash

RESULTFILE=chr22_hg19_vs_pantro4_10000slice.dat

awk '{ sumPerc += $13; n++ } END { print sumPerc / n }' $RESULTFILE

