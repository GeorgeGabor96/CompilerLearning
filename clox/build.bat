@echo off

mkdir build
pushd src

gcc scanner.c compiler.c vm.c value.c debug.c chunk.c memory.c main.c -o ..\\build\\clox.exe

popd

pushd build

clox.exe

popd