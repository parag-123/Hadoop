#!/usr/bin/env python

import sys

# input comes from STDIN (standard input)
for line in sys.stdin:
    stock_name = ''
    close = ''
    date = ''
    # remove leading and trailing whitespace
    splits = line.split(",")
	# Print Stock name, Date and close value.
    print (splits[0], splits[6], splits[10])