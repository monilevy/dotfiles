#!/bin/bash
pushd /home/monil/projects/MLNX/latest-sdk
find . -name "*.[ch]" > cscope.files
cscope -b
export CSCOPE_DB=/home/monil/projects/MLNX/latest-sdk/cscope.out
vim -t main
popd
