@echo off

mkdir build
pushd src

gcc table.c object.c scanner.c compiler.c vm.c value.c debug.c chunk.c memory.c main.c -o ..\\build\\clox.exe

popd

build\\clox.exe files\\test.lox