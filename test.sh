#!/bin/bash

if [ $# -eq 1 ];then
    numbers=$1
else
   echo "Invalid arguments" >&2
   exit 1
fi

if [ $numbers -le 0 ]; then
   echo "Invalid numbers count!" >&2
fi

mpic++ --prefix /usr/local/share/OpenMPI -o es es.cpp
#mpic++ -o es es.cpp || exit 1
dd if=/dev/random bs=1 count=$numbers of=numbers 2>/dev/null
mpirun --prefix /usr/local/share/OpenMPI -np $numbers es
#LD_PRELOAD="/usr/lib64/openmpi/lib/libmpi_cxx.so.1 /usr/lib64/openmpi/lib/libmpi.so.1" mpirun -np $numbers es
rm -f es numbers
