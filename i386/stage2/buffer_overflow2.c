#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void nevercalled(void) {
	printf("I should never be called.\n");
	exit(0);
}

void vulnerable(char *arg) {
	char buffer[50];
	strcpy(buffer,arg);
}

int main(int argc, char **argv) {

	vulnerable(argv[1]);
	printf("argv[1] = %s\n", argv[1]);

	return(0);
}


