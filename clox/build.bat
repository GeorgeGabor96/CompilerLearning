@echo off

mkdir build
pushd src

clang table.c object.c scanner.c compiler.c vm.c value.c debug.c chunk.c memory.c main.c -g -o ..\\build\\clox.exe -D_CRT_SECURE_NO_WARNINGS

popd

build\\clox.exe files\\classes.lox