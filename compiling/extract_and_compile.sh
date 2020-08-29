#!/usr/bin/bash
tar xzf NthPrime.tgz #This line will extract the tgz file as well as uncompress the file. x = extract, v = lists files extracted, z = uncompress, f = file name
cd NthPrime #Here we go into the directory that is extracted
gcc main.c nth_prime.c nth_prime.h -o NthPrime #This line compiles the program and names it
./NthPrime $1 #This line runs the compiled program with the argument that was inputted with the bash file
