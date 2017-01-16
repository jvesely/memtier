#!/bin/sh

if [ "x$RATIO" = "x" ] ; then
	echo "RATIO not set"
	exit 1
fi
if [ "x$PORT" = "x" ] ; then
	echo "PORT not set"
	exit 1
fi
if [ "x$HOST" = "x" ] ; then
	HOST="192.168.5.61"
fi
if [ "x$COUNT" = "x" ] ; then
	COUNT=64
fi
if [ "x$CONCURRENT" = "x" ] ; then
	CONCURRENT=1
fi
if [ "x$THREADS" = "x" ] ; then
	THREADS=1
fi
if [ "x$PATTERN" = "x" ] ; then
	PATTERN="S:S"
fi
if [ "x$KMIN" = "x" ] ; then
	KMIN=1000
fi
if [ "x$KMAX" = "x" ] ; then
	KMAX=1000
fi
if [ "x$VSIZE" = "x" ] ; then
	VSIZE=1024
fi

./memtier_benchmark -s $HOST -p $PORT -P memcache_binary --udp -n $COUNT -c $CONCURRENT -t $THREADS --key-pattern=$PATTERN --key-minimum=$KMIN --key-maximum=$KMAX --ratio $RATIO -d $VSIZE --hide-histogram --client-stats=clients.out
