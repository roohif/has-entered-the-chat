#!/bin/bash

# Run all combinations of maxmatch and simplify

nohup nucmer --maxmatch --nosimplify -c 100 -p max-yes-simp-no  hg19-chr21.fa pt6-chr21.fa &
nohup nucmer --maxmatch              -c 100 -p max-yes-simp-yes hg19-chr21.fa pt6-chr21.fa &
nohup nucmer            --nosimplify -c 100 -p max-no-simp-no   hg19-chr21.fa pt6-chr21.fa &
nohup nucmer                         -c 100 -p max-no-simp-yes  hg19-chr21.fa pt6-chr21.fa &


