#!/bin/bash

function progress {
    echo "-------------------------------------------"
    echo "-------" $1
    echo "-------------------------------------------"
}

set -e
program_file=$1
shift
params=$*

if [ ! -r "$program_file" ]
then
    echo "You used $0 incorrectly.  Please call it with a valid Ada file as follows:"
    echo "   bash $0 <file-name>.adb"
else

    prog_name=${program_file/.adb/}
    trap "progress 'cleaning up'; rm -f *.ali *.o $prog_name" SIGHUP SIGINT SIGTERM EXIT

#    gnatmake *.ad[bs]
    progress 'calling the compiler'
    gnatmake $program_file
    progress 'compiler finished'
    set +e
    progress 'starting the program'
    ./$prog_name $params
    progress 'program stopped'
fi

