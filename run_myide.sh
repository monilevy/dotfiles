#!/bin/bash
#Switch to the right project
#need to have a symbolic link 
#to the project sources directory
#in ~/projects

if [ -z $1 ] || [ -z $2 ]; then
	echo Usage: run_myide.sh project language
	exit 1
fi


if ! [ -d ~/projects/$1 ]; then
	echo Project $1 does not exist in ~/projects
	exit
fi

echo Switching to project $1 ...
pushd ~/projects/$1

#C programming language project
if [ $2 = "c" ]; then
	find . -name "*.c" -exec readlink -f {} \;\
		-o -name "*.h" -exec readlink -f {} \;\
		-o -name "Makfile" -exec readlink -f {} \;\
		> cscope.files
fi

#Python programming language project
if [ $2 = "python" ]; then
	find . -name "*.py" -exec readlink -f {} \; > cscope.files
fi

cscope -b
export CSCOPE_DB=~/projects/$1/cscope.out
cscope -d
popd
