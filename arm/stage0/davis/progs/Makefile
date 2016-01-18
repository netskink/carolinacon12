# very simple makefile

CC = gcc

DEFINES = -DNORMAL
C_FLAGS = $(DEFINES) -fno-stack-protector -z execstack -O0 -ggdb 
L_FLAGS = -ggdb 

.PHONY: default all clean


default: simpleprog buffer_overflow
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

clean:
	-rm -f *.o
	-rm simpleprog
	-rm buffer_overflow 


