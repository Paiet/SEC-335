#!/bin/bash

#Asks user how they would like the output and ingests input
read -p "Would you like the Output [p]rinted or [e]xported? " printoption

read -p "Please input the first 3 octets of the network you would like to scan: " netprefix

read -p "Please input the port you would like to scan: " portnum

function printresults() {
	echo "Printing results:"
	echo "ip,port"
	for h in $(seq 1 255); do
    	  timeout .1 bash -c "echo >/dev/tcp/$netprefix.$h/$portnum" 2>/dev/null && 
      	    echo "$netprefix.$h,$portnum"
done

echo "Process finished"
}

function exportresults(){
	read -p "What would you like to name the output file? " outname
	echo "host,port" >> $outname.csv
	echo "Please wait while the scan runs"
	
      	for h in $(seq 1 255); do
	  timeout .1 bash -c "echo >/dev/tcp/$netprefix.$h/$portnum" 2>/dev/null &&
	    echo "$netprefix.$h,$portnum" >> $outname.csv
done

echo "See exported file for results."
}


if [[ ${printoption} == [pP] ]]
then
	printresults

elif [[ ${printoption} == [eE] ]]
then
	exportresults

else
	echo "Please run the command again and choose a supported option"

fi

#Credit to my SYS320 repository for the bash refresher
