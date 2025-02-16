#!/bin/bash

set -e

function progress {
    echo "-------------------------------------------"
    echo "-------" $1
    echo "-------------------------------------------"
}

program_file=$1
if [ ! -r "$1" ]
then 
    echo "You used $0 incorrectly.  Please call it with a valid C file as follows:"
    echo "   bash $0 <file-name>.c"
else

    trap "progress 'cleaning up'; rm -f *.o ./a.out" SIGHUP SIGINT SIGTERM EXIT

    progress 'calling the compiler'
    gcc $program_file
    progress 'compiler finished'
    set +e
    progress 'starting the program'
    ./a.out
    progress 'program stopped'
fi

