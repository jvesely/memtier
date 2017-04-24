#!/usr/bin/python3

import numpy,os,re,sys

tot_expr = re.compile('^Totals\ *[0-9.]*\ *[0-9.]*\ *[0-9.]*\ *([0-9.]*)')
source = open(sys.argv[1])
data = []


for line in source:
    val = tot_expr.match(line)
    if (val is None):
        continue
    data.append(float(val.group(1)))

print("%f,%f" % (numpy.mean(data), numpy.std(data)));
