#!/usr/bin/env python

import sys
from collections import defaultdict

#Create empty dict
data_dict = defaultdict(list)

# Function for calculating Mean
def mean(data_list):
    return sum(data_list)/float(len(data_list)) #if len(data_list) else 0


# input comes from STDIN (standard input)

for line in sys.stdin:
    # Remove white spaces and split data on ','.
    line = line.strip()	
    splits = line.split(",")
	# Assign each to respective element
    stock_name = splits[0]
    close = splits[1]
    date =  splits[2]
	#Append to Data
    data_dict[stock_name, date].append(float(close))
    #print (data_dict)
	
#Calculate Mean, Min and max for all items in values of dict
for k,v in data_dict.items():
    print (k, mean(v), min(v), max(v))
    