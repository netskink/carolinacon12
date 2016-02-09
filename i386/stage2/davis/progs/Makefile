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
C_FLAGS_3 = 
# What we intend to use.
C_FLAGS = $(DEFINES) $(C_FLAGS_0) $(C_FLAGS_1) $(C_FLAGS_2) $(C_FLAGS_3)

# Linker flags
#
# Include debugging symbols
L_FLAGS_0 = -ggdb 
# Make a static executable
L_FLAGS_1 = -static
# What we intend to use.
L_FLAGS = $(L_FLAGS_0) $(L_FLAGS_1) 

.PHONY: default all clean test stripdebug stripall


default: simpleprog buffer_overflow shell testy1 testya1.o
all: default

# OBJECTS is all .c files renamed as .o
OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))

HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC)  $(C_FLAGS) -c $< -o $@

.PRECIOUS: buffer_overflow simpleprog $(OBJECTS)

simpleprog: simpleprog.o
	$(CC) $(L_FLAGS) -o $@ $<

buffer_overflow: buffer_overflow.o
	$(CC) $(L_FLAGS) -o $@ $<

testy1: testy1.o
	$(CC) $(L_FLAGS) -o $@ $<

testya1.o: testya1.asm
	nasm -felf testya1.asm

testya2.o: testya2.asm
	nasm -felf testya2.asm

shell: shell.asm
	nasm -felf shell.asm

clean:
	-rm -f *.o
	-rm simpleprog
	-rm buffer_overflow 
	-rm testy1 

test: buffer_overflow
	./buffer_overflow `printf "AAAABBBBCCCCDDDDEEEEFF\x8b\x84\x04\x08"`

stripdebug: buffer_overflow
	strip --strip-debug buffer_overflow

stripall: buffer_overflow
	strip --strip-all buffer_overflow

