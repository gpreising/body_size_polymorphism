#!/bin/bash

while read -r x
do 
	rm data/reads/${x}
done < data/xmul_to_filter.txt
