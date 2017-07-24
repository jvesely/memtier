#!/bin/sh

GPU_CONFIG=w8
CPU_CONFIG=t4
HYBRID_CONFIG=t4
if [ "x$SUFFIX" == "x" ]; then
	SUFFIX=1024_full
fi


echo "bench,cpu,error,gpu,error,nosys,error"
for t in misses hits; do
	echo -n "$t,"
	for f in cpu_${t}_${CPU_CONFIG} gpu_${t}_${GPU_CONFIG} hybrid_${t}_${HYBRID_CONFIG}; do
		./process_lat.py data/${f}_${SUFFIX}.out
	done | tr '\n' ','
	echo
done
