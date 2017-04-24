#!/bin/bash

function gen_gnuplot() {
	echo -n '
set terminal eps size 2.5,3
set output "'"$OUT_FILE"'"
#set title "Throughput"
set title "Latency"

set style histogram clustered errorbars gap 3 title textcolor lt -1 font ",11"  offset character 2, -2, 0
set style fill pattern border -1
set style data histogram

set xtic rotate by -30 scale 0

#set ylabel "Ops/s"
set ylabel "milliseconds"
#set xlabel "'"$X_LABEL"'"
set yrange [0:]

set grid ytics

set key top outside horizontal

set datafile separator ","

plot \
	'
	echo "for [COL=2:4:2] '$1' u COL:COL+1:xtic(1) ti col(COL) fillstyle pattern COL / 2 + 1"
}
BASE=`basename $1 .csv`
OUT_FILE=$BASE.eps

echo Generating $OUT_FILE
gen_gnuplot $@ | gnuplot
