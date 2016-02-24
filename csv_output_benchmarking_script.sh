#!/bin/bash

rm output.txt
for i in `seq 0 2`;
do
	noIterations=$((10**$i))
	echo $noIterations Requests >> output.txt
	echo -----------
	ARRAY=(20 5 2 1)
	for concurIndex in `seq 0 3`;
	do
		concur=${ARRAY[$concurIndex]} 
		if [[ $concur -le $noIterations ]]; then
    			echo Will run ab with $noIterations iterations at $concur concurrency
			echo $concur concurrent: >> output.txt
			NAME=n_${noIterations}_c_${concur}.csv
			ab -c $concur -n $noIterations -g $NAME "https://www.yahoo.com/" | grep "Time taken for tests:" >> output.txt
			echo Was the result
		else
			echo Hit the else clause!!
			echo $concur is the concurrency, $noIterations is the iteration number  
		fi
	done
done
