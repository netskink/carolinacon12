
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


default: buffer_overflow shell testy1 testya1.o testya2.o testya3.o testya4.o buffer_overflow2 testya5.o buffer_overflow3

all: default

# OBJECTS is all .c files renamed as .o
OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))

HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC)  $(C_FLAGS) -c $< -o $@

.PRECIOUS: buffer_overflow buffer_overflow2 $(OBJECTS)

buffer_overflow3: buffer_overflow3.o
	$(CC) $(L_FLAGS) -o $@ $<

buffer_overflow2: buffer_overflow2.o
	$(CC) $(L_FLAGS) -o $@ $<

buffer_overflow: buffer_overflow.o
	$(CC) $(L_FLAGS) -o $@ $<

testy1: testy1.o
	$(CC) $(L_FLAGS) -o $@ $<

testya1.o: testya1.asm
	nasm -felf testya1.asm

testya2.o: testya2.asm
	nasm -felf testya2.asm

testya3.o: testya3.asm
	nasm -felf testya3.asm

testya4.o: testya4.asm
	nasm -felf testya4.asm

testya5.o: testya5.asm
	nasm -felf testya5.asm

shell: shell.asm
	nasm -felf shell.asm

clean:
	-rm -f *.o
	-rm buffer_overflow3
	-rm buffer_overflow2
	-rm buffer_overflow 
	-rm testy1 

test: buffer_overflow
	./buffer_overflow `printf "AAAABBBBCCCCDDDDEEEEFF\x8b\x84\x04\x08"`

stripdebug: buffer_overflow
	strip --strip-debug buffer_overflow

stripall: buffer_overflow
	strip --strip-all buffer_overflow

