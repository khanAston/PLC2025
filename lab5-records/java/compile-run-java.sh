#!/bin/bash

set -e

program_file=$1
shift
params=$*

function progress {
    echo "-------------------------------------------"
    echo "-------" $1
    echo "-------------------------------------------"
}

if [ ! -r "$program_file" ]
then
    echo "You used $0 incorrectly.  Please call it with a valid Java file as follows:"
    echo "   bash $0 <file-name>.java"
else

    trap "progress 'cleaning up'; rm -f *.class" SIGHUP SIGINT SIGTERM EXIT

    class_name=${program_file/.java/}

    progress 'calling the compiler'
    javac $program_file
#     javac `find . -name '*.java'`
    progress 'compiler finished'
    set +e
    progress 'starting the program'
    java -ea $class_name $params
    progress 'program stopped'
fi

