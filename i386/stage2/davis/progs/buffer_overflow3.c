#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void nevercalled(void) {
	printf("I should never be called.\n");
	exit(0);
}

void vulnerable(char *arg) {
	int i;
	int j;
	char buffer[50];
	for(i=0;i<5;i++) {
		printf("-");
	}
	printf("\n");
	strcpy(buffer,arg);
	for(j=0;j<5;j++) {
		printf("+");
	}
	printf("\n");
}

int main(int argc, char **argv) {

	vulnerable(argv[1]);
	printf("argv[1] = %s\n", argv[1]);

	return(0);
}


