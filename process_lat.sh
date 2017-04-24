#!/bin/sh

GPU_CONFIG=w7
CPU_CONFIG=t4


echo "bench,cpu,error,gpu,error"
for t in misses hits; do
	echo -n "$t,"
	for f in cpu_${t}_${CPU_CONFIG} gpu_${t}_${GPU_CONFIG}; do
		./process_lat.py data/$f.out
	done | tr '\n' ','
	echo
done
