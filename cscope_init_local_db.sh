#!/bin/bash

find . -name "*.c" -exec readlink -f {} \;\
	-o -name "*.h" -exec readlink -f {} \;\
	-o -name "Makfile" -exec readlink -f {} \;\
	> cscope.files
ctags -R . *.c *.h *.cpp --langmap=c --tag-relative=yes ./

cscope -b
