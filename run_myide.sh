#!/bin/bash
#Switch to the right project
#need to have a symbolic link 
#to the project sources directory
#in ~/projects

if [ -z $1 ] || [ -z $2 ]; then
	echo Usage: run_myide.sh project language
	exit 1
fi

echo Switching to project $1 ...
pushd ~/projects/$1

#C programming language project
if [ $2 = "c" ]; then
	find . -name "*.c" -o -name "*.h" -o -name "Makfile" > cscope.files
fi

#Python programming language project
if [ $2 = "python" ]; then
	find . -name "*.py" > cscope.files
fi

cscope -b
export CSCOPE_DB=~/projects/$1/cscope.out
vim -t sx_core_api_cmd_table_init
#cscope
popd
