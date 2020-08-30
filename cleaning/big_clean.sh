#!/usr/bin/bash
FILE=$1
file="${FILE//.tgz}"
#echo $file
here=$(pwd)
tmpDir=`mktemp -d` && tar -C $tmpDir -xvf $1
cd /
cd $tmpDir/$file
grep -l --null DELETE ./* | xargs -0 rm
tree
cd ..
tar -czf cleaned_$FILE $file
tree
ls
cd /
echo $here
echo $tmpDir
mv $tmpDir/cleaned_$FILE $here
