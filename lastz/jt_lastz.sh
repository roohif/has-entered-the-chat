#!/bin/bash

lastz hg19-chr22.fa[unmask] panTro4-chr22-slice.fa \
	--step=10 --seed=match12 --notransition --exact=20 --noytrim --ambiguous=n \
	--coverage=50 --identity=50 \
	--format=general \
		> chr22_hg19_vs_pantro4_10000slice.dat \
