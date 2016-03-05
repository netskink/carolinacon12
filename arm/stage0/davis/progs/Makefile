# very simple makefile

CC = gcc

# some defines in case we need them
DEFINES = -DNORMAL

# Compiler Flags
#
# No optimization and include debug info with gdb improvements.
C_FLAGS_0 = -O0 -ggdb 
# Stack protection disable
C_FLAGS_1 = -fno-stack-protector 
# Executable stack
C_FLAGS_2 = -z execstack 
# Place holder
C_FLAGS_3 = -D_FORTIFY_SOURCE=0
# What we intend to use.
C_FLAGS = $(DEFINES) $(C_FLAGS_0) $(C_FLAGS_1) $(C_FLAGS_2) $(C_FLAGS_3)

# Linker flags
#
# Include debugging symbols
L_FLAGS_0 = -ggdb 
# Make a static executable
L_FLAGS_1 = -static -z execstack -fno-stack-protector
# What we intend to use.
L_FLAGS = $(L_FLAGS_0) $(L_FLAGS_1) 

EXES = bof
OBJECTS = bof.o shell.o salwan.o

.PHONY: default all clean test 


default: bof shell.o shellbytes.txt hello salwan.o salwan

all: default

# OBJECTS is all .c files renamed as .o
OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))

HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC)  $(C_FLAGS) -c $< -o $@

.PRECIOUS: bof $(OBJECTS)

bof: bof.o
	$(CC) $(L_FLAGS) -o $@ $<

hello: hello.o
	ld -s -o hello hello.o

hello.o: hello.asm
	as -o hello.o hello.asm

salwan: salwan.o
	ld -o salwan salwan.o

salwan.o: salwan.asm
	as -mthumb -gdb -o salwan.o salwan.asm

shellbytes.txt : shell.o salwan
	./dohexy.sh

shell.o: shell.asm
	as -o shell.o shell.asm

clean:
	-rm -f $(OBJECTS)
	-rm -f $(EXES)
	-rm -f shellbytes.txt
	-rm -f shell.o


