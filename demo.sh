#!/usr/bin/env bash

rm -f Compiler Login

g++ -o sha256sum sha256sum.cpp

g++ -o Compiler Compiler.cpp
./Compiler -o Login Login.cpp

echo "== Original Compiler =="

./sha256sum Login
./Login <<< "asdf"
./Login <<< "test123"
./Login <<< "backdoor"

echo -e "\n== Evil Compiler =="

./Compiler -o EvilCompiler EvilCompiler.cpp
./EvilCompiler -o Login Login.cpp

./sha256sum Login
./Login <<< "asdf"
./Login <<< "test123"
./Login <<< "backdoor"

echo -e "\n== Compiler Compiled with Evil Compiler =="

./EvilCompiler -o FirstCompiler Compiler.cpp
rm EvilCompiler

./Login <<< "asdf"
./Login <<< "test123"
./Login <<< "backdoor"

echo -e "\n== \"Clean\" Compiler =="

rm Compiler
./FirstCompiler -o Compiler Compiler.cpp
./Compiler -o Login Login.cpp

./sha256sum Login
./Login <<< "asdf"
./Login <<< "test123"
./Login <<< "backdoor"

echo -e "\n== Recompiled SHA256 Utility =="
./Compiler -o sha256sum sha256sum.cpp
./sha256sum Login

