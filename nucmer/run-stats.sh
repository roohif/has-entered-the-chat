#!/bin/bash

show-coords -q -T -H max-yes-simp-yes.delta | awk '{ percSum += $7; n++ } END { print "Max: Yes Simp: Yes Average: " percSum / n }'
show-coords -q -T -H max-yes-simp-no.delta  | awk '{ percSum += $7; n++ } END { print "Max: Yes Simp: No  Average: " percSum / n }'
show-coords -q -T -H max-no-simp-yes.delta  | awk '{ percSum += $7; n++ } END { print "Max: No  Simp: Yes Average: " percSum / n }'
show-coords -q -T -H max-no-simp-no.delta   | awk '{ percSum += $7; n++ } END { print "Max: No  Simp: No  Average: " percSum / n }'

