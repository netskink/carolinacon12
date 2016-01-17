# very simple makefile

all: simpleprog buffer_overflow

simpleprog: simpleprog.c
	gcc -fno-stack-protector -z execstack -O0 -ggdb simpleprog.c -o simpleprog

buffer_overflow: buffer_overflow.c
	gcc -fno-stack-protector -z execstack -O0 -ggdb buffer_overflow.c -o buffer_overflow

clean:
	rm simpleprog
	rm buffer_overflow


