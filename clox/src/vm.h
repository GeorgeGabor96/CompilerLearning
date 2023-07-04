#ifndef clox_vm_h
#define clox_vm_h

#include "chunk.h"
#include "table.h"
#include "value.h"

#define STACK_MAX 256

typedef struct {
    Chunk* chunk;
    uint8_t* ip; // NOTE: points to the next instruction, not the current one
    Value stack[STACK_MAX];
    Value* stackTop; // NOTE: points to the next value to be pushed
    Table globals;
    Table strings; // NOTE: keep all strings of the program so that we can compare them by pointer
    Obj* objects; // NOTE: List of heap objects for GC
} VM;

typedef enum {
    INTERPRET_OK,
    INTERPRET_COMPILE_ERROR,
    INTERPRET_RUNTIM_ERROR
} InterpretResult;

extern VM vm;

void initVM();
void freeVM();
InterpretResult interpret(char const* source);
void push(Value value);
Value pop();

#endif