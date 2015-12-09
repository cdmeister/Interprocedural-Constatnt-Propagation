#!/bin/bash

make
#cp test/583compress/input1/compress.in.bak test/input.in
#clang -emit-llvm -o test/test.bc -c test/583compress/src/compress.c
#clang -emit-llvm -o test/test.bc -c test/583simple/src/simple.c

clang -emit-llvm -o test/test.bc -c test/test.c
llc test/test.bc -o test/test.s
g++ -o test/test test/test.s 
./test/test 

opt -stats -constprop test/test.bc > test/test.const.bc
opt -stats -load=../lib/Hello.so -hello test/test.const.bc > test/test.ipco.bc
llvm-dis test/test.ipco.bc

#llc test/test.slicm.bc -o test/test.slicm.s
#g++ -o test/test test/test.slicm.s 

#./test/test


