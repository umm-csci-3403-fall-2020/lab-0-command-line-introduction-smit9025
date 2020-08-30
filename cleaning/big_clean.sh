#!/usr/bin/bash
FILE=$1 #Store name of tgz file inputted
file="${FILE//.tgz}" #Take stored name of inputted file and remove .tgz from the name
here=$(pwd) #Stores current path location
tmpDir=`mktemp -d` && tar -C $tmpDir -xvf $1 #Creates a temp directory and extracts the inputted tar file into the temp directory
cd / #Moves current location to the root
cd $tmpDir/$file #Moves current location into the temp directory
grep -l --null DELETE ./* | xargs -0 rm #Looks at every file that is in the directory and deletes files that have the word DELETE in them
cd .. #Moves current location back one
tar -czf cleaned_$FILE $file #Compresses files in inputted file name directory that holds the extracted files into a "cleaned" tar archive
cd / #Moves current location back to root
mv $tmpDir/cleaned_$FILE $here #Moves the new tar archive in the temp directory over to the cleaning directory in the lab
