#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void NeverCalled(void) {
	puts("I should never be called.\n");
	exit(0);
}

void vulnerable(char *arg) {
	char buffer[10];
	strcpy(buffer,arg);
}

int main(int argc, char **argv) {
	vulnerable(argv[1]);
	// to not clutter up the -tui option
	// run this code with (gdb) run > out.txt
	printf("argv[1] = %s\n", argv[1]);

	return(0);
}


